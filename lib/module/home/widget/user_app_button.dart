import 'package:flutter/material.dart';

import '../../../resources/theme/home_theme.dart';
import '../../../resources/theme/leafy_theme.dart';
import '../../../services/applications/application.dart';
import '../../../shared_widget/themed_widget.dart';
import '../../../shared_widget/touchable_text_button.dart';

class UserAppButton extends ThemedWidget<HomeTheme> {
  final Application? _application;
  final void Function(Application? application) _onTapped;
  final void Function() _onLongPress;
  final TextStyle? _textStyle;

  const UserAppButton({
    Key? key,
    required Application? application,
    required void Function(Application? application) onTapped,
    required void Function() onLongPress,
    TextStyle? textStyle,
  })  : _application = application,
        _onTapped = onTapped,
        _onLongPress = onLongPress,
        _textStyle = textStyle,
        super(key: key);

  @override
  Widget body(BuildContext context, LeafyTheme theme) {
    return TouchableTextButton(
      text: _application?.name ?? 'Select',
      style: _textStyle ?? theme.bodyText1,
      pressedColor: theme.foregroundPressedColor,
      //color: theme.foregroundColor,
      onTap: () {
        _onTapped(_application);
      },
      onLongPress: _onLongPress,
    );
  }
}
