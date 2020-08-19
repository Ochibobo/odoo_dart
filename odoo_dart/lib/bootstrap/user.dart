import 'base_auth.dart';
import 'package:yaml/yaml.dart';

/*
  Class to hold user information
  In most cases, the user is the admin
*/
class User implements BaseAuth<User> {
  final String emailAddress;
  final String password;
  static final String _yamlUserHeader = 'user';
  static final String _yamlEmailHeader = 'email';
  static final String _yamlPassword = 'password';

  User({
    this.emailAddress,
    this.password,
  });

  //Load the user from the properties.yaml file
  @override
  User loadFromYaml({YamlMap yamlMap}) {
    YamlMap userMap = yamlMap[_yamlUserHeader];
    return User(
      emailAddress: userMap[_yamlEmailHeader],
      password: userMap[_yamlPassword],
    );
  }
}
