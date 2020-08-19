import 'package:path/path.dart';
import 'package:odoo_dart/j_mahal/jmahal.dart';

class Vehicle implements JMahal<Vehicle> {
  static final String modelName = 'fleet.vehicle';
  static final String dbPath =
      join('.dart_tool', 'sembast', 'fleet', 'fleet.db');

  int id;
  var licensePlate; //Should be String
  double odometer;
  var modelYear; //Should be String
  String fuelType;
  var driverDetails; //Should be List<dynamic>
  List<dynamic> brandDetails;
  List<dynamic> modelDetails;
  var vehicleType; //Should be List<dynamic>

  Vehicle({
    this.id,
    this.brandDetails,
    this.driverDetails,
    this.fuelType,
    this.licensePlate,
    this.modelDetails,
    this.modelYear,
    this.odometer,
    this.vehicleType,
  });

  @override
  Vehicle fromJSON({Map<String, dynamic> jsonData}) {
    return Vehicle(
      id: jsonData['id'],
      brandDetails: jsonData['brand_id'],
      driverDetails:
          jsonData['driver_id'], //!= false ? jsonData['driver_id'] : [],
      fuelType: jsonData['fuel_type'],
      licensePlate: jsonData['license_plate'],
      modelDetails: jsonData['model_id'],
      modelYear:
          jsonData['model_year'], //!= false ? jsonData['model_year'] : '',
      odometer: jsonData['odometer'],
      vehicleType: jsonData['vechical_type_id'],
    );
  }

  @override
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'brand_id': brandDetails,
      'driver_details': driverDetails,
      'fuel_type': fuelType,
      'license_plate': licensePlate,
      'model_details': modelDetails,
      'model_year': modelYear,
      'odometer': odometer,
      'vehicle_type': vehicleType,
    };
  }
}
