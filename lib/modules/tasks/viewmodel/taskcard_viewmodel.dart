import 'package:i_attend/import_all.dart';

class TaskcardViewModel extends BaseViewModel {
  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void toggleExpansion() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}
