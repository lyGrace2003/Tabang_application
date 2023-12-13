class Client{
  final String firstName;
  final String lastName;
  final String contact;
  final String email;
  final String profilepic;

  Client({
    required this.firstName,
    required this.lastName,
    required this.contact,
    required this.email,
    required this.profilepic,
  });
}

class Provider{
  final String firstName;
  final String lastName;
  final String contact;
  final String email;
  final String profilepic;
  final List<Task> task;

  Provider({
    required this.firstName,
    required this.lastName,
    required this.contact,
    required this.email,
    required this.profilepic,
    required this.task
  });
}

class Task{
  final String provider;
  final String service;
  final String rates;
  final String cover;
  final String desc;

  Task({
    required this.provider,
    required this.service,
    required this.rates,
    required this.cover,
    required this.desc
  });
}