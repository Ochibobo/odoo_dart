import 'package:odoo_dart/odoo_service/models/vehicles/vehicle_model/vehicle_model.dart';
import 'package:odoo_dart/reader/base_reader.dart';
import 'package:odoo_dart/reader/reader_interface.dart';

class VehicleModelReader extends BaseReader<VehicleModel>
    implements NetworkReader<VehicleModel> {
  VehicleModel vehicleModel;

  //List of fields
  @override
  List<String> fields = <String>[
    'id',
    'name',
    'brand_id',
  ];

  //Model name
  @override
  String modelName;

  VehicleModelReader({
    this.fields,
    this.modelName,
    this.vehicleModel,
  }) : super(
          fields: fields,
          modelName: modelName,
          instance: vehicleModel,
        );
  @override
  List<VehicleModel> objectList;

  @override
  Future<void> readObjectFromNetwork() async {
    await readValues().then((values) => objectList = values);
  }

  @override
  List<VehicleModel> get retreivedObjectsList => objectList;
}
