import '../import_all.dart';

class KSmallText extends StatelessWidget {
  final String text;
  final Color textcolour;
  const KSmallText({super.key, required this.text, required this.textcolour});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 10, fontWeight: FontWeight.w400, color: textcolour),
    );
  }
}
