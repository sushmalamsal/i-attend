import '../import_all.dart';

class KSmallText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textcolour;
  const KSmallText(
      {super.key,
      required this.text,
      required this.textcolour,
      this.fontSize = 10});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.w400, color: textcolour),
    );
  }
}
