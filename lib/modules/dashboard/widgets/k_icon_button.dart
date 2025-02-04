import 'package:i_attend/import_all.dart';

class KIconButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final int width;
  final VoidCallback onpressed;

  const KIconButton(
      {super.key,
      required this.icon,
      required this.text,
      this.width = 130,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 50,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.orangeAccent,
              width: 0.5,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.orangeAccent.shade100, size: 22),
            const SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(
                color: Colors.orangeAccent.shade100,
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
