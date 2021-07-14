import 'package:intl/intl.dart';

String getCurrentTime(){
  DateTime now = DateTime.now();
  String formattedDate = DateFormat( 'yyyy-MM-dd').format(now);
  return formattedDate.toString();
}

