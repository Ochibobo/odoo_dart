import 'package:path/path.dart';
import 'package:odoo_dart/j_mahal/jmahal.dart';

class FuelRequest implements JMahal<FuelRequest> {
  static String modelName = 'fleet.vehicle.log.fuel';
  static String dbPath = join('.dart_tool', 'sembast', 'fleet', 'fleet.db');

  int requestID;
  double litre;
  double pricePerLitre;
  int vendorID;
  String vendor;
  double costAmount;
  String fuelType;
  String department;
  String tillNumber;
  String project;
  int vehicleID;
  String vehicleDisplayName;
  double lastOdometer;
  var date;
  bool isAttachmentPresent;
  List<dynamic> purchaserDetails;
  List<dynamic> vehicleDetails;
  int purchaserID;

  FuelRequest({
    this.requestID,
    this.litre,
    this.costAmount,
    this.purchaserID,
    this.date,
    this.department,
    this.project,
    this.fuelType,
    this.lastOdometer,
    this.pricePerLitre,
    this.tillNumber,
    this.vehicleID,
    this.vehicleDisplayName,
    this.vendorID,
    this.vendor,
    this.purchaserDetails,
    this.vehicleDetails,
  });

  @override
  FuelRequest fromJSON({Map<String, dynamic> jsonData}) {
    List _vehicleDetails = jsonData['vehicle_id'];
    return FuelRequest(
      requestID: jsonData['id'],
      litre: jsonData['liter'] ?? 0.0,
      pricePerLitre: jsonData['price_per_liter'] ?? 0.0,
      costAmount: jsonData['cost_amount'] ?? 0.0,
      department: jsonData['x_dept'].toString(),
      fuelType: jsonData['fuel_type'] ?? '',
      tillNumber: jsonData['x_paybill'].toString(),
      //vehicleID: _vehicleDetails[0] ?? 0,
      vendor: jsonData['x_vendors'].toString(),
      // vehicleDisplayName: _vehicleDetails[1] ?? '',
      lastOdometer: jsonData['odometer'] ?? 0.0,
      date: jsonData['date'],
      project: jsonData['x_projects'],
      purchaserDetails: jsonData['purchaser_details'],
      vehicleDetails: _vehicleDetails,
    );
  }

  @override
  Map<String, dynamic> toJSON() {
    var _id = vehicleDetails[0] as int;
    var _vehicleName = vehicleDetails[1] as String;
    return {
      'request_id': requestID,
      // 'purchase_details': purchaserDetails,
      'vehicle_id': _id,
      'vehicle_name': _vehicleName,
      'odometer': lastOdometer,
      // 'fuel_type': fuelType,
      // 'x_projects': project,
      // 'x_dept': department,
      'liter': litre,
      'price_per_liter': pricePerLitre,
      'cost_amount': costAmount,
      // 'x_vendors': vendor,
      // 'x_paybill': tillNumber,
      'date': date,
    };
  }
}
