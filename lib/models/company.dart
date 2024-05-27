import 'package:companies_json_model/models/employee.dart';
import 'package:companies_json_model/models/product.dart';

class Company {
  final String name;
  final String location;
  final List<Employee> employees;
  final List<Product> products;

  Company({
    required this.name,
    required this.location,
    required this.employees,
    required this.products,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    var employeesFromJson = json['employees'] as List;
    var productsFromJson = json['products'] as List;

    List<Employee> employeeList =
        employeesFromJson.map((e) => Employee.fromJson(e)).toList();
    List<Product> productList =
        productsFromJson.map((p) => Product.fromJson(p)).toList();

    return Company(
      name: json['company'],
      location: json['location'],
      employees: employeeList,
      products: productList,
    );
  }
}
