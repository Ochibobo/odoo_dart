import 'package:odoo_dart/j_mahal/jmahal.dart';

class VehicleBrand implements JMahal<VehicleBrand> {
  static final String modelName = 'fleet.vehicle.model.brand';

  int id;
  String name;

  VehicleBrand({
    this.id,
    this.name,
  });

  @override
  VehicleBrand fromJSON({Map<String, dynamic> jsonData}) {
    return VehicleBrand(
      name: jsonData['name'],
      id: jsonData['id'],
    );
  }

  @override
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'name': name,
    };
  }
}
