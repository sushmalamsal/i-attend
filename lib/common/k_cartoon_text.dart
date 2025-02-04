import '../import_all.dart';

class KCartoonText extends StatelessWidget {
  final String cartoontext;
  const KCartoonText({super.key, required this.cartoontext});

  @override
  Widget build(BuildContext context) {
    return Text(
      cartoontext,
      style: GoogleFonts.permanentMarker(
        fontSize: 12,
        color: const Color(0xFFDA9910),
      ),
    );
  }
}
