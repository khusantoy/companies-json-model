import 'package:companies_json_model/controllers/company_controller.dart';
import 'package:companies_json_model/models/company.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                      return Card(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            text:
                                                product.inStock ? "Yes" : "No",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                            ],
                          ),
                        ),
                      );
                    }),
      ),
    );
  }
}
