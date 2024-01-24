import 'package:flutter/material.dart';

import 'settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'settings_model.dart';
import '../feed/bottom_bar.dart';
import '../feed/n_comments_seen_provider.dart';
import 'dart:math';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nCommentsSeenAsync = ref.watch(nCommentsSeenProvider(null));
    final nCommentsSeen = switch (nCommentsSeenAsync) {
      AsyncData(:final value) => value,
      _ => 0,
    };

    final settingsAsyncValue = ref.watch(settingsProvider);
    final settingsNotifier = ref.watch(settingsProvider.notifier);
    final settings = switch (settingsAsyncValue) {
      AsyncData(:final value) => value,
      _ => null
    };
    final double selectedTextScaleFactor =
        (settings?.fontSettings?.textScaleFactor) ?? 1;

    void setSelectedTextScaleFactor({required double adjust}) {
      final newSelectedTextScaleFactor =
          max(min(selectedTextScaleFactor + adjust, 1.3), 1.0);

      if (settings != null) {
        final settingsUpdated = settings.copyWith.fontSettings
            ?.call(textScaleFactor: newSelectedTextScaleFactor);

        if (settingsUpdated != null) {
          settingsNotifier.updateSettings(settings: settingsUpdated);
        } else {
          settingsNotifier.updateSettings(
              settings: SettingsModel(
                  fontSettings: FontSettingsModel(
                      textScaleFactor: newSelectedTextScaleFactor)));
        }
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: BottomBar(
          child: SafeArea(
            child: SettingsList(
              settingsCards: [
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  leading: Text(
                    'Theming',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.titleLarge?.fontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
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
                SettingsCard(
                  text: 'Default Light Theme',
                  leading: const Icon(Icons.light_mode_outlined),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DefaultLightThemeSettingsView()))
                  },
                ),
                SettingsCard(
                  text: 'Default Dark Theme',
                  leading: const Icon(Icons.dark_mode_outlined),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DefaultDarkThemeSettingsView()))
                  },
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  leading: Text(
                    'Storage',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.titleLarge?.fontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SettingsCard(text: 'You have read $nCommentsSeen comments'),
                SettingsCard(
                  text: 'Delete Read Comments History',
                  textColor: Colors.red,
                  leading: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.red,
                  ),
                  onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Confirm Deletion'),
                            content:
                                const Text('Delete history of read comments'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Confirm'),
                                child: const Text('Confirm'),
                              ),
                            ],
                          )),
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  leading: Text(
                    'General',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.titleLarge?.fontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SettingsCard(
                  text: 'Adjust Font Size',
                  leading: const Icon(
                    Icons.format_size_outlined,
                  ),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(
                        onPressed: () =>
                            setSelectedTextScaleFactor(adjust: -0.05),
                        icon: const Icon(Icons.text_decrease_outlined)),
                    IconButton(
                        onPressed: () =>
                            setSelectedTextScaleFactor(adjust: 0.05),
                        icon: const Icon(Icons.text_increase_outlined))
                  ]),
                ),
                const SettingsCard(text: ''),
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

  final List<Widget> settingsCards;
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
      {super.key,
      required this.text,
      this.leading,
      this.trailing,
      this.onTap,
      this.textColor});

  final void Function()? onTap;
  final String text;
  final Widget? leading;
  final Widget? trailing;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      elevation: 0,
      color: Colors.transparent,
      child: ListTile(
        dense: true,
        visualDensity: const VisualDensity(vertical: -4),
        title: Text(text,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                color: textColor)),
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
        final settingsUpdated =
            settings.copyWith.themeSettings?.call(theme: selectedTheme);
        if (settingsUpdated != null) {
          settingsNotifier.updateSettings(settings: settingsUpdated);
        } else {
          settingsNotifier.updateSettings(
              settings: SettingsModel(
                  themeSettings: ThemeSettingsModel(theme: selectedTheme)));
        }
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

class DefaultLightThemeSettingsView extends ConsumerWidget {
  const DefaultLightThemeSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsyncValue = ref.watch(settingsProvider);
    final settingsNotifier = ref.watch(settingsProvider.notifier);
    final settings = switch (settingsAsyncValue) {
      AsyncData(:final value) => value,
      _ => null
    };
    final DefaultTheme selectedDefaultLightTheme =
        (settings?.themeSettings?.defaultLightTheme) ?? DefaultTheme.light;

    void onTapSetting({required DefaultTheme selectedDefaultLightTheme}) {
      if (settings != null) {
        final settingsUpdated = settings.copyWith.themeSettings
            ?.call(defaultLightTheme: selectedDefaultLightTheme);

        if (settingsUpdated != null) {
          settingsNotifier.updateSettings(settings: settingsUpdated);
        } else {
          settingsNotifier.updateSettings(
              settings: SettingsModel(
                  themeSettings: ThemeSettingsModel(
                      defaultLightTheme: selectedDefaultLightTheme)));
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Default Light Theme')),
      body: SafeArea(
          child: SettingsList(settingsCards: [
        SettingsCard(
          text: 'Light',
          trailing: (selectedDefaultLightTheme == DefaultTheme.light)
              ? Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.primary,
                )
              : null,
          onTap: () =>
              onTapSetting(selectedDefaultLightTheme: DefaultTheme.light),
        ),
        SettingsCard(
            text: 'Dark',
            trailing: (selectedDefaultLightTheme == DefaultTheme.dark)
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () =>
                onTapSetting(selectedDefaultLightTheme: DefaultTheme.dark)),
        SettingsCard(
            text: 'OLED-Dark',
            trailing: (selectedDefaultLightTheme == DefaultTheme.oledDark)
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () =>
                onTapSetting(selectedDefaultLightTheme: DefaultTheme.oledDark)),
        SettingsCard(
            text: 'Blue',
            trailing: (selectedDefaultLightTheme == DefaultTheme.blue)
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () =>
                onTapSetting(selectedDefaultLightTheme: DefaultTheme.blue)),
      ])),
    );
  }
}

class DefaultDarkThemeSettingsView extends ConsumerWidget {
  const DefaultDarkThemeSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsyncValue = ref.watch(settingsProvider);
    final settingsNotifier = ref.watch(settingsProvider.notifier);
    final settings = switch (settingsAsyncValue) {
      AsyncData(:final value) => value,
      _ => null
    };
    final DefaultTheme selectedDefaultDarkTheme =
        (settings?.themeSettings?.defaultDarkTheme) ?? DefaultTheme.dark;

    void onTapSetting({required DefaultTheme selectedDefaultDarkTheme}) {
      if (settings != null) {
        final settingsUpdated = settings.copyWith.themeSettings
            ?.call(defaultDarkTheme: selectedDefaultDarkTheme);

        if (settingsUpdated != null) {
          settingsNotifier.updateSettings(settings: settingsUpdated);
        } else {
          settingsNotifier.updateSettings(
              settings: SettingsModel(
                  themeSettings: ThemeSettingsModel(
                      defaultDarkTheme: selectedDefaultDarkTheme)));
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Default Dark Theme')),
      body: SafeArea(
          child: SettingsList(settingsCards: [
        SettingsCard(
          text: 'Light',
          trailing: (selectedDefaultDarkTheme == DefaultTheme.light)
              ? Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.primary,
                )
              : null,
          onTap: () =>
              onTapSetting(selectedDefaultDarkTheme: DefaultTheme.light),
        ),
        SettingsCard(
            text: 'Dark',
            trailing: (selectedDefaultDarkTheme == DefaultTheme.dark)
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () =>
                onTapSetting(selectedDefaultDarkTheme: DefaultTheme.dark)),
        SettingsCard(
            text: 'OLED-Dark',
            trailing: (selectedDefaultDarkTheme == DefaultTheme.oledDark)
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () =>
                onTapSetting(selectedDefaultDarkTheme: DefaultTheme.oledDark)),
        SettingsCard(
            text: 'Blue',
            trailing: (selectedDefaultDarkTheme == DefaultTheme.blue)
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () =>
                onTapSetting(selectedDefaultDarkTheme: DefaultTheme.blue)),
      ])),
    );
  }
}
