import 'package:odoo_dart/j_mahal/jmahal.dart';

class VehicleModel implements JMahal<VehicleModel> {
  static final String modelName = 'fleet.vehicle.model';

  int id;
  String name;
  List<dynamic> brandDetails;

  VehicleModel({
    this.id,
    this.brandDetails,
    this.name,
  });

  @override
  VehicleModel fromJSON({Map<String, dynamic> jsonData}) {
    return VehicleModel(
      id: jsonData['id'],
      brandDetails: jsonData['brand_id'],
      name: jsonData['name'],
    );
  }

  @override
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'name': name,
      'brand_details': brandDetails,
    };
  }
}
