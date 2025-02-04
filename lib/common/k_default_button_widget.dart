import '../import_all.dart';

class KDefaultButton extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Color buttonColor;
  final double width;
  final VoidCallback onPressed;
  final double height;
  final double borderWidth;
  final Color borderColor;

  KDefaultButton({
    super.key,
    this.width = double.infinity,
    required this.label,
    this.labelColor = Colors.orangeAccent,
    this.buttonColor = Colors.white,
    required this.onPressed,
    this.height = 35.0,
    this.borderWidth = 0.8,
    this.borderColor = Colors.orangeAccent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: labelColor,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.w600,
            color: labelColor,
          ),
        ),
      ),
    );
  }
}
