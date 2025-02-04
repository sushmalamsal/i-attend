import 'package:i_attend/import_all.dart';

class kFloatingText extends StatefulWidget {
  @override
  _FloatingTextState createState() => _FloatingTextState();
}

class _FloatingTextState extends State<kFloatingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_animation.value),
          child: Text(
            " My Progress",
            style: TextStyle(
                fontSize: 10,
                color: Colors.lightGreen,
                fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
