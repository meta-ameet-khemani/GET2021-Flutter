import 'base_provider.dart';

class MovieCategoryProvider extends BaseProvider {
  int _categoryIndex = 0;

  int get getIndex => _categoryIndex;

  void setIndex(int index) {
    _categoryIndex = index;
    notifyListeners();
  }
}
