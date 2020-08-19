import 'base_auth.dart';
import 'package:yaml/src/yaml_node.dart';

class Credentials implements BaseAuth<Credentials> {
  final String host;
  final String database;
  static final String _yamlServerHeader = 'server';
  static final String _yamlHostHeader = 'host';
  static final String _yamlDatabaseHeader = 'database';

  Credentials({
    this.host,
    this.database,
  });

  //Load the server credentials from the database
  @override
  Credentials loadFromYaml({YamlMap yamlMap}) {
    YamlMap serverMap = yamlMap[_yamlServerHeader];
    return Credentials(
      host: serverMap[_yamlHostHeader],
      database: serverMap[_yamlDatabaseHeader],
    );
  }
}
