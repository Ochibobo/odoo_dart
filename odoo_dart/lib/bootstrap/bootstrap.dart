import 'dart:io';

import 'credentials.dart';
import 'user.dart';
import 'package:yaml/yaml.dart';

class Bootstrap {
  static final String _path = 'lib/properties.yaml';
  final File _propertiesFile = File(_path);
  YamlMap _yamlMap;
  Credentials _credentials;
  User _user;

  Bootstrap() {
    //Load the properties file into a YamlMap
    _loadPropertiesFile();
    //Create a user instance
    _user = User().loadFromYaml(yamlMap: _yamlMap);
    //Create an instance of credentials
    _credentials = Credentials().loadFromYaml(yamlMap: _yamlMap);
  }

  void _loadPropertiesFile() {
    var yamlData = _propertiesFile.readAsStringSync();
    _yamlMap = loadYaml(yamlData);
  }

  //Get the user instance
  User get user => _user;

  //Get the server credentials instance
  Credentials get credentials => _credentials;
}
