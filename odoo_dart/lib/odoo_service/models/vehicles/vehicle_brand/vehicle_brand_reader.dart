import 'package:odoo_dart/odoo_service/models/vehicles/vehicle_brand/vehicle_brand.dart';
import 'package:odoo_dart/reader/base_reader.dart';
import 'package:odoo_dart/reader/reader_interface.dart';

class VehicleBrandReader extends BaseReader<VehicleBrand>
    implements NetworkReader<VehicleBrand> {
  VehicleBrand vehicleBrand;
  //List of fields
  @override
  List<String> fields = <String>[
    'id',
    'display_name',
    'name',
  ];

  //Model name
  @override
  String modelName;

  VehicleBrandReader({
    this.fields,
    this.modelName,
    this.vehicleBrand,
  }) : super(
          fields: fields,
          modelName: modelName,
          instance: vehicleBrand,
        );

  @override
  List<VehicleBrand> objectList;

  @override
  Future<void> readObjectFromNetwork() async {
    await readValues().then((values) => objectList = values);
  }

  @override
  List<VehicleBrand> get retreivedObjectsList => objectList;
}
