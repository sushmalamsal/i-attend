import '../import_all.dart';

class KDefaultButton extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Color buttonColor;
  final double width;
  final VoidCallback? onPressed;
  final double height;
  final double borderWidth;
  final Color borderColor;

  KDefaultButton({
    super.key,
    this.width = double.infinity,
    required this.label,
    this.labelColor = Colors.orangeAccent,
    this.buttonColor = Colors.white,
    this.onPressed,
    this.height = 35.0,
    this.borderWidth = 0.8,
    this.borderColor = Colors.orangeAccent,
  });

  @override
  Widget build(BuildContext context) {
    bool isDisabled = onPressed == null;
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
              color: isDisabled ? Colors.transparent : borderColor,
              width: borderWidth,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.w600,
            color: isDisabled ? Colors.grey.shade500 : labelColor,
          ),
        ),
      ),
    );
  }
}
