import 'package:intl/intl.dart';

String getCurrentTime(){
  DateTime now = DateTime.now();
  String formattedDate = DateFormat( 'yyyy-MM-dd  kk:mm a').format(now);
  return formattedDate.toString();
}

