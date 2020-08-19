//The child used in the relationship
import '../j_mahal/jmahal.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class Child<T extends JMahal> {
  //Foreign key field
  final String foreignKey;
  //Instance of the JMahal used in reading the child values
  final T instance;
  //Model Name of the child
  final String modelName;
  //DBPath for the child node
  final String dbPath;
  //List of T instances
  List<T> _childInstances;
  //Primary key label used for retrieval purposes
  String primaryKeyLabel;

  Child({
    this.foreignKey,
    this.instance,
    this.modelName,
    this.dbPath,
    this.primaryKeyLabel,
  });

  Future<void> loadChildData() async {
    _childInstances = <T>[];
    //Database linked to child records
    var db = await databaseFactoryIo.openDatabase(dbPath);

    //Store used to access child records
    var store = intMapStoreFactory.store(modelName);

    //Read values
    var snapshots = await store.find(db,
        finder: Finder(
          filter: Filter.greaterThan(primaryKeyLabel, 0),
        ));

    //Temp is a list used to hold and sort child records based on foreign key
    var _temp = <Map<String, dynamic>>[];
    snapshots.forEach((snapshot) {
      _temp.add(snapshot.value);
    });

    //Sort based on foreign key ids in descending order
    _temp.sort((a, b) => a[foreignKey][0].compareTo(b[foreignKey][0]));

    _temp.forEach(
      (snapshot) => _childInstances.add(instance.fromJSON(jsonData: snapshot)),
    );
  }

  //To retrieve child instances
  List<T> get childInstances => _childInstances;
}
