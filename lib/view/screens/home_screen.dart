import 'package:companies_json_model/controllers/company_controller.dart';
import 'package:companies_json_model/models/company.dart';
import 'package:companies_json_model/view/widgets/company_add_dialog.dart';
import 'package:companies_json_model/view/widgets/company_edit_dialog.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final companyController = CompanyController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    companyController.getCompanies().then((_) {
      isLoading = false;
      setState(() {});
    });
  }

  void delete(int index) async {
    final response = await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Ishonchingiz komilmi?"),
            content: Text(
                "Siz ${companyController.list[index].name} ni o'chirmoqchisiz."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text("Bekor qilish"),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text("Ha, ishonchim komil"),
              ),
            ],
          );
        });

    if (response) {
      companyController.delete(index);
      setState(() {});
    }
  }

  void edit(int index, Company company) async {
    Map<String, dynamic> data = await showDialog(
        context: context,
        builder: (ctx) {
          return CompanyEditDialog(
              name: company.name,
              location: company.location,
              employees: company.employees,
              products: company.products);
        });
    companyController.update(
      index,
      data['name'],
      data['location'],
      data['employees'],
      data['products'],
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Companies"),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : companyController.list.isEmpty
                ? const Center(
                    child: Text("No companies available"),
                  )
                : ListView.builder(
                    itemCount: companyController.list.length,
                    itemBuilder: (ctx, index) {
                      Company company = companyController.list[index];
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Name: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: company.name,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Location: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: company.location,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Employees:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                for (var employee in company.employees)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: "• Name: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: employee.name,
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: "   Age: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: employee.age.toString(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: "   Position: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: employee.position,
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: "   Skills: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            for (var skill in employee.skills)
                                              TextSpan(
                                                text: " $skill",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Products:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                for (var product in company.products)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: "• Name: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: product.name,
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: "   Price: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: product.price.toString(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: "   In Stock: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: product.inStock
                                                  ? "Yes"
                                                  : "No",
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    FilledButton(
                                      style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.amber),
                                      ),
                                      onPressed: () {
                                        edit(
                                          index,
                                          companyController.list[index],
                                        );
                                      },
                                      child: const Text("Edit"),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    FilledButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            WidgetStatePropertyAll(Colors.red),
                                      ),
                                      onPressed: () {
                                        delete(index);
                                      },
                                      child: const Text("Delete"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () async {
            Map<String, dynamic>? data = await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (ctx) {
                  return const CompanyAddDialog();
                });
            if (data != null) {
              companyController.add(
                data['name'],
                data['location'],
                data['employees'],
                data['products'],
              );
              setState(() {});
            }
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
