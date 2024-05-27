import 'dart:convert';

import 'package:companies_json_model/models/company.dart';

class CompanyController {
  var mockJson = """[
{
  "company": "Tech Solutions",
  "location": "San Francisco",
  "employees": [
    {
      "name": "Alice",
      "age": 30,
      "position": "Developer",
      "skills": ["Dart", "Flutter", "Firebase"]
    },
    {
      "name": "Bob",
      "age": 25,
      "position": "Designer",
      "skills": ["Photoshop", "Illustrator"]
    }
  ],
  "products": [
    {
      "name": "Product A",
      "price": 29.99,
      "inStock": true
    },
    {
      "name": "Product B",
      "price": 49.99,
      "inStock": false
    }
  ]
},
{
  "company": "Innovative Solutions",
  "location": "New York",
  "employees": [
    {
      "name": "Charlie",
      "age": 35,
      "position": "Project Manager",
      "skills": ["Agile", "Scrum", "JIRA"]
    },
    {
      "name": "Dana",
      "age": 28,
      "position": "Software Engineer",
      "skills": ["JavaScript", "React", "Node.js"]
    }
  ],
  "products": [
    {
      "name": "Product X",
      "price": 19.99,
      "inStock": true
    },
    {
      "name": "Product Y",
      "price": 39.99,
      "inStock": true
    }
  ]
},
{
    "company": "Tech Innovators",
    "location": "San Francisco",
    "employees": [
      {
        "name": "Alice",
        "age": 30,
        "position": "Data Scientist",
        "skills": ["Python", "Machine Learning", "SQL"]
      },
      {
        "name": "Bob",
        "age": 40,
        "position": "DevOps Engineer",
        "skills": ["AWS", "Docker", "Kubernetes"]
      }
    ],
    "products": [
      {
        "name": "Product A",
        "price": 29.99,
        "inStock": true
      },
      {
        "name": "Product B",
        "price": 49.99,
        "inStock": false
      }
    ]
  },
  {
    "company": "GreenTech Solutions",
    "location": "Austin",
    "employees": [
      {
        "name": "Emily",
        "age": 32,
        "position": "Environmental Engineer",
        "skills": ["CAD", "Environmental Impact Assessment", "Project Management"]
      },
      {
        "name": "Frank",
        "age": 45,
        "position": "R&D Specialist",
        "skills": ["Product Development", "Market Research", "Sustainability"]
      }
    ],
    "products": [
      {
        "name": "Product C",
        "price": 24.99,
        "inStock": true
      },
      {
        "name": "Product D",
        "price": 34.99,
        "inStock": true
      }
    ]
  }
]""";
  final List<Company> _list = [];

  List<Company> get list {
    return [..._list];
  }

  Future<void> getCompanies() async {
    try {
      List<dynamic> parsedJson = jsonDecode(mockJson);

      List<Map<String, dynamic>> companyList =
          List<Map<String, dynamic>>.from(parsedJson);

      _list.clear();

      for (var company in companyList) {
        _list.add(Company.fromJson(company));
      }
    } catch (e) {
      print(e);
    }
  }
}
