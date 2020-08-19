import 'package:yaml/yaml.dart';

abstract class BaseAuth<T> {
  T loadFromYaml({YamlMap yamlMap});
}
