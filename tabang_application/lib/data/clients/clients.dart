import 'package:hive/hive.dart';

part 'clients.g.dart';

@HiveType(typeId: 1)
class Clients {

  Clients({
    required this.firstName, 
    required this.lastName, 
    required this.contactNum, 
    required this.emailAd, 
    required this.password});

  @HiveField(0)
  String firstName;

  @HiveField(1)
  String lastName;

  @HiveField(2)
  String contactNum;

  @HiveField(3)
  String emailAd;

  @HiveField(4)
  String password;
}