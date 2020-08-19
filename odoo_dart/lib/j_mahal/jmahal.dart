import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

//A class for Dart <--> JSON conversion
abstract class JMahal<T> {
  //Signature for a method that maps JSON to Dart Objects
  T fromJSON({Map<String, dynamic> jsonData});

  //Signature of a method that maps Dart Objects to JSON
  Map<String, dynamic> toJSON();
}

//Create a class of formatted Date time
class FormattedDateTime {
  String _formattedDateTimeValue;

  FormattedDateTime();

  FormattedDateTime formattedDateTime(
      {@required DateTime dateValue, @required String format}) {
    var dateFormat = DateFormat(format);
    _formattedDateTimeValue = dateFormat.format(dateValue);
    return this;
  }

  String stringValue() {
    return _formattedDateTimeValue;
  }
}

//A class to perform type conversions
class Val {
  //Try to convert a value to an integer
  static int asInt({@required var value}) {
    int intValue;
    try {
      intValue = int.parse(value);
    } catch (e, s) {
      print('Exception:\n $e');
      print('Stack trace:\n $s');
    }
    return intValue;
  }

  //Try to convert a value to a double
  static double asDouble({@required var value}) {
    double doubleValue;
    try {
      doubleValue = double.parse(value);
    } catch (e, s) {
      print('Exception:\n $e');
      print('Stack trace:\n $s');
    }
    return doubleValue;
  }

  //Try to convert a value to DateTime
  static DateTime asDateTime({@required var value}) {
    DateTime dateTime;
    try {
      dateTime = DateTime.parse(value);
    } catch (e, s) {
      print('Exception:\n $e');
      print('Stack trace:\n $s');
    }

    return dateTime;
  }

  //Return formatted date value
  static FormattedDateTime asFormattedDateTime(
      {@required var value, @required String format}) {
    FormattedDateTime formattedDate;
    try {
      var dateTime = DateTime.parse(value);
      if (format != null) {
        formattedDate = FormattedDateTime()
            .formattedDateTime(dateValue: dateTime, format: format);
      }
    } catch (e, s) {
      print('Exception:\n $e');
      print('Stack trace:\n $s');
    }

    return formattedDate;
  }

  //Convert the values to an object that extends/implements JMahal
  static T asObject<T extends JMahal>(
      {@required T object, @required Map<String, dynamic> data}) {
    //Since the object extends/implements JMahal, call the object's fromJSON method
    return object.fromJSON(jsonData: data);
  }

  //Convert to List of objects of type JMahal
  static List<T> asObjectList<T extends JMahal>(
      {@required T object, @required List<Map<String, dynamic>> json}) {
    var list = json.map((datum) {
      return asObject<T>(object: object, data: datum);
    }).toList();

    return list;
  }

  //Convert to a List of supported object types
  static List<T> asList<T>({@required List<dynamic> json, String dateFormat}) {
    var data = json;

    switch (T) {
      case int:
        data = data.map((v) => asInt(value: v)).toList();
        break;
      case String:
        data = data.cast<String>();
        break;
      case dynamic:
        break;
      case double:
        data = data.map((v) => asDouble(value: v)).toList();
        break;
      case DateTime:
        data = data.map((v) => asDateTime(value: v)).toList();
        break;
      case FormattedDateTime:
        data = data
            .map((v) => asFormattedDateTime(value: v, format: dateFormat))
            .toList();
        break;
      default:
        {
          print('Unsupported type: $T');
          data = null;
        }
        break;
    }

    return data;
  }
}
