import 'package:odoo_dart/init/init.dart';

void main(List<String> arguments) async {
  var init = Initializer(); 
  await init.doAuthenticate();
}
