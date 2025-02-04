import 'package:i_attend/import_all.dart';
import 'package:rive/rive.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookViewModel>.reactive(
      viewModelBuilder: () => BookViewModel(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: model.onBookTap,
          child: RiveAnimation.asset(
            'assets/book_flip.riv',
            fit: BoxFit.contain,
            onInit: model.onRiveInit,
          ),
        );
      },
    );
  }
}
