class JobModel {
  final int id;
  final String position;
  final String company;
  final String companyImage;
  final String status;
  final String salary;
  final String location;
  final String description;
  final String responsibilities;
  final List<String> types;
  final DateTime createdDate;
  final DateTime applyBefore;

  JobModel({
    required this.id,
    required this.position,
    required this.company,
    required this.companyImage,
    required this.status,
    required this.salary,
    required this.location,
    required this.description,
    required this.responsibilities,
    required this.types,
    required this.createdDate,
    required this.applyBefore,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
    id: json['id'],
    position: json['position'],
    company: json['company'],
    companyImage: json['companyImage'],
    status: json['status'],
    salary: json['salary'],
    location: json['location'],
    description: json['description'],
    responsibilities: json['responsibilities'],
    types: List<String>.from(json['types']),
    createdDate: DateTime.parse(json['createdDate']),
    applyBefore: DateTime.parse(json['applyBefore']),
  );
}
