import 'package:odoo_dart/odoo_service/models/vehicles/vehicle_type/vehicle_type.dart';
import 'package:odoo_dart/reader/base_reader.dart';
import 'package:odoo_dart/reader/reader_interface.dart';

class VehicleTypeReader extends BaseReader<VehicleType>
    implements NetworkReader<VehicleType> {
  VehicleType vehicleType;

  //List of fields
  @override
  List<String> fields = <String>[
    'id',
    'name',
    'display_name',
  ];

  //Model name
  @override
  String modelName;

  VehicleTypeReader({
    this.fields,
    this.modelName,
    this.vehicleType,
  }) : super(
          fields: fields,
          modelName: modelName,
          instance: vehicleType,
        );

  @override
  List<VehicleType> objectList;

  @override
  Future<void> readObjectFromNetwork() async {
    await readValues().then((values) => objectList = values);
  }

  @override
  List<VehicleType> get retreivedObjectsList => objectList;
}
