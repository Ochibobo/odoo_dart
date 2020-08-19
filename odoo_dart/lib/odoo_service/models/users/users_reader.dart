import 'package:odoo_dart/odoo_service/models/users/users.dart';
import 'package:odoo_dart/reader/base_reader.dart';
import 'package:odoo_dart/reader/reader_interface.dart';

class UsersReader extends BaseReader<User> implements NetworkReader<User> {
  User user;
  //List of fields
  @override
  List<String> fields = <String>[
    'id',
    'name',
    'email',
    'phone',
    'partner_id',
  ];

  //Specify the domain used for filtering (Only interested in users who are drivers)
  static final List<List<dynamic>> filterDomain = [
    ['is_driver', '=', true]
  ];

  //Model name
  @override
  String modelName;

  UsersReader({
    this.fields,
    this.modelName,
    this.user,
  }) : super(
          fields: fields,
          modelName: modelName,
          instance: user,
          // domain: filterDomain,
        );

  @override
  List<User> objectList;

  @override
  Future<void> readObjectFromNetwork() async {
    await readValues().then((values) => objectList = values);
  }

  @override
  List<User> get retreivedObjectsList => objectList;
}
