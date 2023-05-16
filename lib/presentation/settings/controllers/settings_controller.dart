import 'package:finance_helper/core/theme/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final colorListProvider = Provider((ref) => colorList);

final themeNotifierProvider = StateNotifierProvider<ThemeController, AppTheme>(
  (ref) => ThemeController(),
);

class ThemeController extends StateNotifier<AppTheme> {
  ThemeController() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeSelectedColor(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
