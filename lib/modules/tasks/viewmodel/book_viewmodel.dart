import 'package:i_attend/import_all.dart';
import 'package:rive/rive.dart';

class BookViewModel extends BaseViewModel {
  late StateMachineController? _controller;
  SMIInput<bool>? flipBook;
  SMIInput<bool>? startClose;
  SMIInput<bool>? bookClosed;

  bool isBookFlipped = false;
  bool isBookClosed = false;

  StateMachineController? get controller => _controller;

  void onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'book_animation');
    if (controller == null) return;
    artboard.addController(controller);

    flipBook = controller.findInput<bool>('flip_book') as SMIBool?;
    startClose = controller.findInput<bool>('start_close') as SMIBool?;
    bookClosed = controller.findInput<bool>('book_closed') as SMIBool?;

    if (flipBook == null || startClose == null || bookClosed == null) {
      print("ERROR: Inputs are missing!");
    }
  }

  void onBookTap() {
    if (!flipBook!.value) {
      flipBook!.value = true;
      isBookFlipped = true;
      notifyListeners();
      Future.delayed(Duration(seconds: 1), () {
        startClose!.value = true;
        Future.delayed(Duration(seconds: 1), () {
          bookClosed!.value = true;
          isBookClosed = true;
          notifyListeners();
        });
      });
    }
  }
}
