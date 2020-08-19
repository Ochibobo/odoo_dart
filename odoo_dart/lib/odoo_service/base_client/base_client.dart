import 'package:odoo_api/odoo_api.dart';
import 'package:odoo_api/odoo_user_response.dart';
import 'package:odoo_dart/bootstrap/bootstrap.dart';
import 'package:meta/meta.dart';
import 'package:odoo_dart/bootstrap/credentials.dart';
import 'package:odoo_dart/bootstrap/user.dart';

class BaseClient {
  final Bootstrap bootstrap;
  final Credentials _credentials;
  final User _user;
  OdooClient _odooClient;
  OdooUser _odooUser;

  BaseClient({
    @required this.bootstrap,
  })  : _credentials = bootstrap.credentials,
        _user = bootstrap.user;

  //Create an instance of the odoo client
  void _initializeOdooClient() {
    _odooClient = OdooClient(_credentials.host);
  }

  //Authenticate the user on the odoo server
  Future<void> authenticateUser() async {
    _initializeOdooClient();
    await _odooClient
        .authenticate(
          _user.emailAddress,
          _user.password,
          _credentials.database,
        )
        .then(
          (AuthenticateCallback auth) => auth.isSuccess
              ? _odooUser = auth.getUser()
              : () {
                  _odooUser = null;
                  print('Invalid user credentials');
                },
        )
        .catchError(
          (e) => print('Authentication exited with error: $e'),
        );
    print(_odooUser.database);
  }

  //Return an instance of the odoo user
  OdooUser get odooUser => _odooUser;

  //Return an instance of the odoo client
  OdooClient get odooClient => _odooClient;
}
