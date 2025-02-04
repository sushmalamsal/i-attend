import 'package:i_attend/import_all.dart';
import 'package:rive/rive.dart';

class BookViewModel extends BaseViewModel {
  late StateMachineController? _controller;
  SMIInput<bool>? _flipBook;
  SMIInput<bool>? _startClose;
  SMIInput<bool>? _bookClosed;
  SMITrigger? _pointsGained;

  StateMachineController? get controller => _controller;

  void onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'book_animation');
    if (controller == null) return;
    artboard.addController(controller);

    _flipBook = controller.findInput<bool>('flip_book') as SMIBool?;
    _startClose = controller.findInput<bool>('start_close') as SMIBool?;
    _bookClosed = controller.findInput<bool>('book_closed') as SMIBool?;
    _pointsGained = controller.findInput('points_gained') as SMITrigger?;
    if (_flipBook == null || _startClose == null || _bookClosed == null) {
      print("ERROR: Inputs are missing!");
    }
  }

  void onBookTap() {
    if (!_flipBook!.value) {
      _flipBook!.value = true;

      Future.delayed(Duration(seconds: 1), () {
        _flipBook!.value = false;
        _startClose!.value = true;

        Future.delayed(Duration(seconds: 1), () {
          _bookClosed!.value = true;

          Future.delayed(Duration(seconds: 1), () {
            _pointsGained!.fire();
          });
        });
      });
    }
  }
}
