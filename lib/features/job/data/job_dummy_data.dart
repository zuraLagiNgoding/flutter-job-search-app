import '../domain/models/job_model.dart';

final List<JobModel> dummyJobs = [
  JobModel(
    id: 0,
    position: 'Flutter Developer',
    company: 'A-Company',
    companyImage:
        'https://i.fbcd.co/products/resized/resized-750-500/logo-set-26-03-78a1ebac05279e80ffef88d7519750a7eb3a0b200bd81594f0bca5c64fa1bf97.jpg',
    status: 'applied',
    salary: '\$60K',
    location: 'Work from office',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet leo magna. Donec blandit dignissim lorem a aliquet. Donec eget elit rutrum, volutpat nibh.',
    responsibilities:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a purus scelerisque, volutpat nisl in, mollis nunc. Fusce quis euismod odio, nec placerat magna. Pellentesque.',
    types: const ['Remote', 'Fulltime'],
    createdDate: DateTime.utc(2025 - 01 - 01),
    applyBefore: DateTime.utc(2025 - 08 - 15),
  ),
  JobModel(
    id: 1,
    position: 'Backend Engineer',
    company: 'Apple Inc',
    companyImage:
        'https://1000logos.net/wp-content/uploads/2017/02/Apple-Logosu.png',
    status: 'expired_soon',
    salary: '\$70K',
    location: 'Work from anywhere',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet leo magna. Donec blandit dignissim lorem a aliquet. Donec eget elit rutrum, volutpat nibh.',
    responsibilities:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a purus scelerisque, volutpat nisl in, mollis nunc. Fusce quis euismod odio, nec placerat magna. Pellentesque.',
    types: const ['Onsite', 'Contract'],
    createdDate: DateTime.utc(2025 - 01 - 02),
    applyBefore: DateTime.utc(2025 - 08 - 15),
  ),
  JobModel(
    id: 2,
    position: 'DevOps',
    company: 'Apple Inc',
    companyImage:
        'https://1000logos.net/wp-content/uploads/2017/02/Apple-Logosu.png',
    status: '',
    salary: '\$50K',
    location: 'Work from anywhere',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet leo magna. Donec blandit dignissim lorem a aliquet. Donec eget elit rutrum, volutpat nibh.',
    responsibilities:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a purus scelerisque, volutpat nisl in, mollis nunc. Fusce quis euismod odio, nec placerat magna. Pellentesque.',
    types: const ['Onsite', 'Contract'],
    createdDate: DateTime.utc(2025 - 01 - 02),
    applyBefore: DateTime.utc(2025 - 08 - 15),
  ),
];
