import 'package:companies_json_model/models/employee.dart';
import 'package:companies_json_model/models/product.dart';
import 'package:flutter/material.dart';

class CompanyAddDialog extends StatefulWidget {
  const CompanyAddDialog({super.key});

  @override
  State<CompanyAddDialog> createState() => _CompanyAddDialogState();
}

class _CompanyAddDialogState extends State<CompanyAddDialog> {
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

  void _submit() {
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
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Company'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) => name = value!,
                validator: (value) => value!.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
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
                decoration: const InputDecoration(labelText: 'Employee name'),
                onSaved: (value) => employeeName = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Enter employee name' : null,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Employee age'),
                onSaved: (value) => employeeAge = int.parse(value!),
                validator: (value) =>
                    value!.isEmpty ? 'Enter employee age' : null,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Employee position'),
                onSaved: (value) => employeePosition = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Enter employee position' : null,
              ),
              TextFormField(
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
                decoration: const InputDecoration(labelText: 'Product name'),
                onSaved: (value) => productName = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Enter product name' : null,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Product price'),
                onSaved: (value) => productPrice = double.parse(value!),
                validator: (value) =>
                    value!.isEmpty ? 'Enter Product price' : null,
              ),
              SwitchListTile(
                value: inStock,
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
          onPressed: _submit,
          child: const Text('Add'),
        ),
      ],
    );
  }
}
