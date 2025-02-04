import '../import_all.dart';

class KDivider extends StatelessWidget {
  const KDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.8,
      color: Colors.grey.shade300,
      indent: 0,
      endIndent: 0,
    );
  }
}
