import 'package:movies_app/providers/base_provider.dart';

class MovieBackdropProvider extends BaseProvider {
  int _index = 0;

  int get getIndex => _index;

  void setIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
