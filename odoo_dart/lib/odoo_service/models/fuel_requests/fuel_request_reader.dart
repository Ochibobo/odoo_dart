import 'package:odoo_dart/reader/reader_interface.dart';

import 'fuel_requests.dart';
import 'package:odoo_dart/reader/base_reader.dart';

class FuelRequestReader extends BaseReader<FuelRequest>
    implements NetworkReader<FuelRequest> {
  //Instance used in reading values -- to compensate for reflection
  FuelRequest fuelRequest;
  //List of fields
  @override
  List<String> fields = <String>[
    'id',
    'vehicle_id',
    'fuel_type',
    'x_vendors',
    'purchaser_id',
    'date',
    'cost_amount',
    'liter',
    'price_per_liter',
    'x_paybill',
    'odometer',
    'x_dept',
  ];

  //Model name
  @override
  String modelName;

  FuelRequestReader({
    this.fields,
    this.fuelRequest,
    this.modelName,
  }) : super(
          instance: fuelRequest,
          fields: fields,
          modelName: modelName,
        );

  @override
  List<FuelRequest> objectList;

  @override
  Future<void> readObjectFromNetwork() async {
    await readValues().then((value) => objectList = value);
  }

  @override
  List<FuelRequest> get retreivedObjectsList => objectList;
}
