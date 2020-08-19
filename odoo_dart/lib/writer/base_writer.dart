import 'package:odoo_dart/j_mahal/jmahal.dart';
import 'package:meta/meta.dart';
import 'package:odoo_dart/writer/storage.dart';

//A class to write data output to excel sheets
class BaseStore<T extends JMahal> {
  String modelName;
  List<T> records;
  //Storage instance used to communicate to the database
  Storage<T> storage;

  BaseStore({
    @required this.modelName,
    @required this.records,
  }) : storage = Storage<T>(modelName: modelName, records: records);

  //Open connection to the storage area
  Future<void> prepareStorage() async {
    await storage.openDatabase();
  }

  //Write values to the store
  Future<void> persist() async {
    await storage.writeData();
  }

  //Read values from store
  Future<void> read({@required T instance}) async {
    await storage.readValues(instance: instance);
    storage.records.forEach((f) => print(f.toJSON()));
  }
}
