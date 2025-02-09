import 'package:i_attend/import_all.dart';
import 'package:rive/rive.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookViewModel>.reactive(
      viewModelBuilder: () => BookViewModel(),
      builder: (context, model, child) {
        return Stack(children: <Widget>[
          RiveAnimation.asset(
            'assets/book_flip.riv',
            fit: BoxFit.contain,
            onInit: model.onRiveInit,
          ),
          Positioned(
            top: 300,
            left: 120,
            child: model.isBookFlipped == false
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: ElevatedButton(
                          onPressed: model.onBookTap,
                          child: const Text("Mark as Done"),
                        ),
                      ),
                      const Text("Hello"),
                      const Text("Bye"),
                    ],
                  )
                : Center(
                    child: const Text(
                      "completed",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
          ),
        ]);
      },
    );
  }
}
