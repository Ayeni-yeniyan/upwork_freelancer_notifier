import 'package:stacked/stacked.dart';

class BottomNavViewModel extends BaseViewModel {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  changeIndex(int newIndex) {
    _selectedIndex = newIndex;
    rebuildUi();
  }
}
