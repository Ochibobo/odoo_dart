import 'package:odoo_api/odoo_api.dart';
import 'package:odoo_api/odoo_api_connector.dart';
import 'package:odoo_dart/init/init.dart';
import 'package:odoo_dart/j_mahal/jmahal.dart';

class BaseReader<T extends JMahal> {
  final OdooClient _odooClient = initializer.odooClient;
  List<T> _results;
  //Fields that specify what the json map is to return (keys)
  final List<String> fields;
  List<List<dynamic>> domain;
  final String modelName;
  final T instance;

  BaseReader({
    this.instance,
    this.fields,
    this.domain = const [],
    this.modelName,
  });

  Future<List<T>> readValues() async {
    try {
      await _odooClient
          .searchRead(
        modelName,
        domain = [
          ['vehicle_id', '=', 58]
        ],
        fields,
        limit: 1000,
        order: 'create_date desc',
      )
          .then((OdooResponse response) {
        List _response = response.getResult()['records'];
        if (_response == null) return null;
        _results = <T>[];
        for (var data in _response) {
          //Map the server response into the JMahal instances
          T result = instance.fromJSON(jsonData: data);
          _results.add(result);
        }
      });
      //.catchError((e) => print('Read error for object ${T.runtimeType}: $e'));
    } catch (e, s) {
      print(e);
      print(s);
    }

    return _results;
  }
}

//Create a new instance of the class
// typedef ObjectCreator<K> = K Function();

// class Mediator<T extends JMahal> {
//   ObjectCreator<T> object;
//   Mediator(this.object);

//   T getObject() {
//     var t = object();
//     return t;
//   }
// }
