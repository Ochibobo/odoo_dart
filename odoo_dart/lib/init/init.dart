import 'package:odoo_api/odoo_api.dart';
import '../bootstrap/bootstrap.dart';
import '../odoo_service/base_client/base_client.dart';

class Initializer {
  Bootstrap _bootstrap;
  BaseClient _baseClient;

  Initializer() {
    _bootstrap = Bootstrap();
    _baseClient = BaseClient(bootstrap: _bootstrap);
  }

  //Authenticate the user to the Odoo Server
  Future<void> doAuthenticate() async => await _baseClient.authenticateUser();

  //Get the OdooClient
  OdooClient get odooClient => _baseClient.odooClient;
}

//Global initializer
Initializer initializer = Initializer();
