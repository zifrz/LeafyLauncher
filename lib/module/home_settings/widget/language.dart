part of 'settings_body.dart';

class _Language extends ThemedGetWidget<UserApplicationsController, HomeTheme> {
  const _Language({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, LeafyTheme theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          L10nProvider.getText(L10n.settingsLanguage),
          style: theme.bodyText3.copyWith(color: theme.textInfoColor),
        ),
        const LeafySpacer(),
        TouchableTextButton(
          text: Get.locale!.toLanguageTag(),
          style: theme.bodyText2,
          color: theme.foregroundColor,
          pressedColor: theme.foregroundPressedColor,
          onTap: controller.changeLocale,
        ),
      ],
    );
  }
}
