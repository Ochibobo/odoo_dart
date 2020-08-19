import 'package:odoo_dart/j_mahal/jmahal.dart';

class VehicleType implements JMahal<VehicleType> {
  static final String modelName = 'vehicle.type';

  int id;
  String name;
  String displayName;

  VehicleType({
    this.displayName,
    this.id,
    this.name,
  });

  @override
  VehicleType fromJSON({Map<String, dynamic> jsonData}) {
    return VehicleType(
      id: jsonData['id'],
      name: jsonData['name'],
      displayName: jsonData['display_name'],
    );
  }

  @override
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'name': name,
      'display_name': displayName,
    };
  }
}
