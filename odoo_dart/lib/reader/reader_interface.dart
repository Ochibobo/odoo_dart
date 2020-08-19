import 'package:odoo_dart/j_mahal/jmahal.dart';

abstract class NetworkReader<T extends JMahal> {
  //Method to fetch values
  Future<void> readObjectFromNetwork();

  //Method to retrieve the list of read objects
  List<T> get retreivedObjectsList;

  //List that must be present to store the retrieved values
  List<T> objectList;
}
