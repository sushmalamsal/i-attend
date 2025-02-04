import '../import_all.dart';

class KContainer extends StatelessWidget {
  final Widget child;
  const KContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.5,
              blurRadius: 0.5,
              offset: Offset(0, 0),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 0.2,
          ),
        ),
        margin: EdgeInsets.all(10.0),
        child: child);
  }
}
