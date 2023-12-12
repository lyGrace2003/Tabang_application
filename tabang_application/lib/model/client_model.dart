class Clients{
  final String uid;
  final String firstName;
  final String lastName;
  final String contactNum;
  final String email;
  final String photoUrl;

  const Clients({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.contactNum,
    required this.email,
    required this.photoUrl
  });

  Map<String, dynamic> toJson()=>{
    "uid": uid,
    "firstName": firstName,
    "lastName": lastName,
    "contactNum": contactNum,
    "email": email,
    "photoUrl": photoUrl
  };
}