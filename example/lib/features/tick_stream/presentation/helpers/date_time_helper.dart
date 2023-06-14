import 'package:intl/intl.dart';

String getFormattedDateTime(int epoch) => DateFormat('yyyy-MM-dd HH:mm:ss')
    .format(DateTime.fromMillisecondsSinceEpoch(epoch * 1000));
