import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KDateTimeField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final VoidCallback onChanged;

  const KDateTimeField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.onChanged,
  });

  @override
  _KDateTimeFieldState createState() => _KDateTimeFieldState();
}

class _KDateTimeFieldState extends State<KDateTimeField> {
  Future<void> _pickDateTime() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.orangeAccent,
            hintColor: Colors.orangeAccent,
            colorScheme: ColorScheme.light(primary: Colors.orangeAccent),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate == null) return;

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.orangeAccent,
            hintColor: Colors.orangeAccent,
            colorScheme: ColorScheme.light(primary: Colors.orangeAccent),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime == null) return;

    DateTime finalDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    widget.controller.text =
        DateFormat("yyyy-MM-ddTHH:mm:ss").format(finalDateTime);
    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickDateTime,
      child: AbsorbPointer(
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: widget.labelText,
            suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orangeAccent, width: 1),
            ),
            floatingLabelStyle: TextStyle(color: Colors.orangeAccent),
          ),
        ),
      ),
    );
  }
}
