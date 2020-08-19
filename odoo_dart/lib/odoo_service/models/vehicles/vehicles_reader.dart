import 'package:odoo_dart/odoo_service/models/vehicles/vehicles.dart';
import 'package:odoo_dart/reader/base_reader.dart';
import 'package:odoo_dart/reader/reader_interface.dart';

class VehicleReader extends BaseReader<Vehicle>
    implements NetworkReader<Vehicle> {
  Vehicle vehicle;
  //List of fields
  @override
  List<String> fields = <String>[
    'id',
    'brand_id',
    'driver_id',
    'fuel_type',
    'license_plate',
    'model_id',
    'model_year',
    'odometer',
    'vechical_type_id',
  ];

  //Model name
  @override
  String modelName;

  VehicleReader({
    this.fields,
    this.modelName,
    this.vehicle,
  }) : super(
          fields: fields,
          modelName: modelName,
          instance: vehicle,
        );

  @override
  List<Vehicle> objectList;

  @override
  Future<void> readObjectFromNetwork() async {
    await readValues().then((values) => objectList = values);
  }

  @override
  List<Vehicle> get retreivedObjectsList => objectList;
}
