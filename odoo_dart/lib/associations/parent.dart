//To hold the parent of the association
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class Parent<T> {
  //The field name used for the association
  final String primaryKeyLabel;
  //Model name of the parent
  final String modelName;
  //Model name db
  String dbPath;
  //List to hold primary keys
  List<T> _primaryKeys;

  Parent({
    this.modelName,
    this.primaryKeyLabel,
    this.dbPath,
  });

  //Connect to database
  Future<Database> _connectToDB() async {
    return databaseFactoryIo.openDatabase(dbPath);
  }

  //Load parent primary key values to memory
  Future<void> loadPrimaryKeys() async {
    _primaryKeys = <T>[];
    //Get the database instance
    var db = await _connectToDB();

    //Store used to fetch the parent's records
    var store = intMapStoreFactory.store(modelName);
    //Read values
    var snapshots = await store.find(
      db,
      finder: Finder(
        filter: Filter.greaterThan(primaryKeyLabel, 0),
        sortOrders: [SortOrder(primaryKeyLabel)],
      ),
    );

    //Append primary keys to a list of primary keys
    snapshots.forEach(
      (snapshot) => _primaryKeys.add(snapshot.value[primaryKeyLabel]),
    );

    print(_primaryKeys);
  }

  //Retieve the list of primary keys
  List<T> get primaryKeys => _primaryKeys;
}
