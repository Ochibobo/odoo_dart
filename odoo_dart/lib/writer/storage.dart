import 'package:path/path.dart';
import 'package:odoo_dart/j_mahal/jmahal.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:meta/meta.dart';

class Storage<T extends JMahal> {
  final String storageFolder = 'fleet';
  final String dbName = 'fleet.db';
  List<JMahal> records;
  String modelName;
  Database _db;
  StoreRef _store;

  Storage({
    @required this.records,
    @required this.modelName,
  });

  Future<void> openDatabase() async {
    //Create a reference to the database
    _db = await databaseFactoryIo
        .openDatabase(join('.dart_tool', 'sembast', storageFolder, dbName));
    //Create a store (SQL Table Equivalent) for the object
    _store = intMapStoreFactory.store(modelName);
  }

  Future<void> writeData() async {
    //Write all the objects to storage
    await _db.transaction((tnx) async {
      //Loop through the object list writing them to the db one by one
      for (var record in records) {
        //Write each record to db
        await _store
            //Write Objects as JSON String
            .add(tnx, record.toJSON())
            .then((id) => print('Success - ($modelName : #$id)'))
            .catchError((e) => print('Failed - ($modelName : $record)'));
      }
      ;
    });
  }

  Future<void> readValues({@required T instance}) async {
    //Empty the list prior to reading into it
    records = <JMahal>[];
    await _store.find(_db).then(
          (rows) => rows.forEach(
            (snapshot) {
              //Cast the instance into JMahal instance
              T record = instance.fromJSON(
                  jsonData: snapshot.value as Map<String, dynamic>);
              //Add the record to the list of JMahal objects
              records.add(record);
            },
          ),
        );
  }

  //Return the list of records read from the database
  List<JMahal> get objectRecords => records;
}
