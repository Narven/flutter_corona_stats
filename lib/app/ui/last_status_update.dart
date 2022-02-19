import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastUpdatedDateFormatter {
  LastUpdatedDateFormatter(this.lastUpdated);
  final DateTime? lastUpdated;

  String lastUpdatedStatus() {
    if (lastUpdated != null) {
      final formatter = DateFormat.yMd().add_Hms();
      final formatted = formatter.format(lastUpdated!);
      return 'Last updated $formatted';
    }
    return '';
  }
}

class LastUpdatedStatus extends StatelessWidget {
  final String text;

  const LastUpdatedStatus({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
