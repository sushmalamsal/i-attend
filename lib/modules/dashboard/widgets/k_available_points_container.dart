import 'package:i_attend/import_all.dart';

class KAvailablePointsContainer extends StatelessWidget {
  final Widget child;
  const KAvailablePointsContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.orangeAccent,
            width: 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.4),
              blurRadius: 12,
              spreadRadius: 5,
              offset: Offset(0, 10),
            ),
            BoxShadow(
              color: Colors.yellow.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 5,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: child);
  }
}
