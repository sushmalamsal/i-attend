import 'package:i_attend/import_all.dart';

class KTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final VoidCallback onChanged;
  const KTextField(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent, width: 1),
        ),
        floatingLabelStyle: TextStyle(color: Colors.orangeAccent),
      ),
      onChanged: (_) => onChanged(),
    );
  }
}
