// model/member.dart
class Users {
  final int? id;
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final String password;

  Users(
      {required this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.phoneNumber,
      required this.password});

  // Fungsi untuk mengonversi objek Member menjadi Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  // Fungsi untuk membuat objek Member dari Map
  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      address: map['address'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
    );
  }
}
