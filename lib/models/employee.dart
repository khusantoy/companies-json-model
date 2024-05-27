class Employee {
  String name;
  int age;
  String position;
  List<String> skills;

  Employee({
    required this.name,
    required this.age,
    required this.position,
    required this.skills,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      age: json['age'],
      position: json['position'],
      skills: List<String>.from(
        json['skills'],
      ),
    );
  }
}
