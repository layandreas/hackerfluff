import 'package:flutter/material.dart';

import 'settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'settings_model.dart';
import '../feed/bottom_bar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: BottomBar(
          child: SafeArea(
            child: SettingsList(
              title: 'Theming',
              settingsCards: [
                SettingsCard(
                  text: 'Theme',
                  leading: const Icon(Icons.color_lens_outlined),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThemeSettingsView()))
                  },
                ),
                const SettingsCard(
                  text: 'Default Light Theme',
                  leading: Icon(Icons.light_mode_outlined),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const SettingsCard(
                  text: 'Default Dark Theme',
                  leading: Icon(Icons.dark_mode_outlined),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ));
  }
}

class SettingsList extends StatelessWidget {
  const SettingsList({
    super.key,
    required this.settingsCards,
    this.title,
  });

  final List<SettingsCard> settingsCards;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          ListTile(
            leading: Text(
              title ?? '',
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
        Expanded(
          child: ListView(
            children: settingsCards,
          ),
        ),
      ],
    );
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard(
      {super.key, required this.text, this.leading, this.trailing, this.onTap});

  final void Function()? onTap;
  final String text;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      elevation: 0,
      color: Colors.transparent,
      child: ListTile(
        dense: true,
        visualDensity: const VisualDensity(vertical: -4),
        title: Text(
          text,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize),
        ),
        leading: leading,
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}

class ThemeSettingsView extends ConsumerWidget {
  const ThemeSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsyncValue = ref.watch(settingsProvider);
    final settingsNotifier = ref.watch(settingsProvider.notifier);
    final settings = switch (settingsAsyncValue) {
      AsyncData(:final value) => value,
      _ => null
    };
    final ThemeSetting selectedTheme =
        (settings?.themeSettings?.theme) ?? ThemeSetting.system;

    void onTapSetting({required ThemeSetting selectedTheme}) {
      if (settings != null) {
        final settingsUpdated = settings.copyWith(
            themeSettings: ThemeSettingsModel(theme: selectedTheme));
        settingsNotifier.updateSettings(settings: settingsUpdated);
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: SafeArea(
          child: SettingsList(settingsCards: [
        SettingsCard(
            text: 'System Theme',
            trailing: (selectedTheme == ThemeSetting.system)
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () => onTapSetting(selectedTheme: ThemeSetting.system)),
        SettingsCard(
          text: 'Light',
          trailing: (selectedTheme == ThemeSetting.light)
              ? Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.primary,
                )
              : null,
          onTap: () => onTapSetting(selectedTheme: ThemeSetting.light),
        ),
        SettingsCard(
            text: 'Dark',
            trailing: (selectedTheme == ThemeSetting.dark)
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () => onTapSetting(selectedTheme: ThemeSetting.dark)),
        SettingsCard(
            text: 'OLED-Dark',
            trailing: (selectedTheme == ThemeSetting.oledDark)
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () => onTapSetting(selectedTheme: ThemeSetting.oledDark)),
        SettingsCard(
            text: 'Blue',
            trailing: (selectedTheme == ThemeSetting.blue)
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () => onTapSetting(selectedTheme: ThemeSetting.blue)),
      ])),
    );
  }
}
