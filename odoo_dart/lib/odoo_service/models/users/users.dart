import 'package:odoo_dart/j_mahal/jmahal.dart';

class User implements JMahal<User> {
  static final String modelName = 'res.users';

  int id;
  String name;
  String emailAddress;
  String contact;
  List<dynamic> partnerDetails;

  User({
    this.contact,
    this.emailAddress,
    this.id,
    this.name,
    this.partnerDetails,
  });

  @override
  User fromJSON({Map<String, dynamic> jsonData}) {
    return User(
      id: jsonData['id'],
      emailAddress: jsonData['email'],
      contact: jsonData['phone'].toString(),
      partnerDetails: jsonData['partner_id'],
      name: jsonData['name'],
    );
  }

  @override
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'name': name,
      'email': emailAddress,
      'contact': contact,
      'partner_details': partnerDetails,
    };
  }
}
