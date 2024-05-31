import 'package:companies_json_model/models/employee.dart';
import 'package:companies_json_model/models/product.dart';
import 'package:flutter/material.dart';

class CompanyEditDialog extends StatefulWidget {
  String name;
  String location;
  List<Employee> employees;
  List<Product> products;

  // String employeeName;
  // int employeeAge;
  // String employeePosition;
  // String employeeSkills;

  // String productName;
  // double productPrice;
  // bool inStock = false;
  CompanyEditDialog({
    super.key,
    required this.name,
    required this.location,
    required this.employees,
    required this.products,
  });

  @override
  State<CompanyEditDialog> createState() => _CompanyEditDialogState();
}

class _CompanyEditDialogState extends State<CompanyEditDialog> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String location = '';
  List<Employee> employees = [];
  List<Product> products = [];

  String employeeName = '';
  int employeeAge = 0;
  String employeePosition = '';
  String employeeSkills = '';

  String productName = '';
  double productPrice = 0;
  bool inStock = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController employeeAgeController = TextEditingController();
  TextEditingController employeePositionController = TextEditingController();
  TextEditingController employeeSkillsController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  void _update() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      Employee newEmployee = Employee(
        name: employeeName,
        age: employeeAge,
        position: employeePosition,
        skills: [employeeSkills],
      );
      employees.add(newEmployee);

      Product newProduct = Product(
        name: productName,
        price: productPrice,
        inStock: inStock,
      );
      products.add(newProduct);
      Navigator.of(context).pop({
        'name': name,
        'location': location,
        'employees': employees,
        'products': products,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    locationController.text = widget.location;
    employeeNameController.text = widget.employees.first.name;
    employeeAgeController.text = widget.employees.first.age.toString();
    employeePositionController.text = widget.employees.first.position;
    employeeSkillsController.text = widget.employees.first.skills[0];
    productNameController.text = widget.products.first.name;
    productPriceController.text = widget.products.first.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Company'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) => name = value!,
                validator: (value) => value!.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                controller: locationController,
                decoration: const InputDecoration(labelText: 'Location'),
                onSaved: (value) => location = value!,
                validator: (value) => value!.isEmpty ? 'Enter location' : null,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Add Employees",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: employeeNameController,
                decoration: const InputDecoration(labelText: 'Employee name'),
                onSaved: (value) => employeeName = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Enter employee name' : null,
              ),
              TextFormField(
                controller: employeeAgeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Employee age'),
                onSaved: (value) => employeeAge = int.parse(value!),
                validator: (value) =>
                    value!.isEmpty ? 'Enter employee age' : null,
              ),
              TextFormField(
                controller: employeePositionController,
                decoration:
                    const InputDecoration(labelText: 'Employee position'),
                onSaved: (value) => employeePosition = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Enter employee position' : null,
              ),
              TextFormField(
                controller: employeeSkillsController,
                decoration: const InputDecoration(labelText: 'Employee skills'),
                onSaved: (value) => employeeSkills = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Enter employee skills' : null,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Add Products",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: productNameController,
                decoration: const InputDecoration(labelText: 'Product name'),
                onSaved: (value) => productName = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Enter product name' : null,
              ),
              TextFormField(
                controller: productPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Product price'),
                onSaved: (value) => productPrice = double.parse(value!),
                validator: (value) =>
                    value!.isEmpty ? 'Enter Product price' : null,
              ),
              SwitchListTile(
                value: widget.products.first.inStock,
                onChanged: (value) {
                  inStock = !inStock;
                  setState(() {});
                },
                title: const Text("In Stock:"),
              )
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _update,
          child: const Text('Update'),
        ),
      ],
    );
  }
}
