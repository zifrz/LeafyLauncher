import 'package:flutter/material.dart';

import '../../base/page/status_page_base.dart';
import '../../resources/theme/home_theme.dart';
import '../../resources/theme/leafy_theme.dart';
import 'home_settings_controller.dart';
import 'widget/settings_body.dart';

class HomeSettingsPage
    extends StatusPageBase<HomeSettingsController, HomeTheme> {
  const HomeSettingsPage();

  @override
  bool get resizeToAvoidBottomInset => false;

  @override
  Widget ready(BuildContext context, LeafyTheme theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SettingsBody(),
      ],
    );
  }
}