import '../import_all.dart';

class KLargeText extends StatelessWidget {
  final String text;
  const KLargeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade700),
    );
  }
}
