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
            physics: const NeverScrollableScrollPhysics(),
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
        final settingsUpdated =
            settings.copyWith.themeSettings?.call(theme: selectedTheme);

        if (settingsUpdated != null) {
          settingsNotifier.updateSettings(settings: settingsUpdated);
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
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
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
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
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
