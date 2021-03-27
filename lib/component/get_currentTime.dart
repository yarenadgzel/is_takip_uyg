
import 'package:intl/intl.dart';

void getCurrentTime(){
  DateTime now = DateTime.now();
  String formattedDate = DateFormat( 'yyyy-MM-dd – kk:mm a').format(now);
  print(formattedDate);

}