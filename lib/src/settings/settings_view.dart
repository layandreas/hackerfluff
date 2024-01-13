import 'package:flutter/material.dart';

import 'settings_controller.dart';
import 'settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'settings_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: SafeArea(
          child: ListView(children: [
            Card(
              child: ListTile(
                title: Text(
                  'Theme',
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.bodyLarge?.fontSize),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThemeSettingsView()));
                },
              ),
            )
          ]),
        ));
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
      body: ListView(children: [
        Card(
          child: ListTile(
            title: const Text('Follow System Theme'),
            trailing: (selectedTheme == ThemeSetting.system)
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () => onTapSetting(selectedTheme: ThemeSetting.system),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('Light'),
            trailing: (selectedTheme == ThemeSetting.light)
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () => onTapSetting(selectedTheme: ThemeSetting.light),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('OLED-Dark'),
            trailing: (selectedTheme == ThemeSetting.oledDark)
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () => onTapSetting(selectedTheme: ThemeSetting.oledDark),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('Blue'),
            trailing: (selectedTheme == ThemeSetting.blue)
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () => onTapSetting(selectedTheme: ThemeSetting.blue),
          ),
        )
      ]),
    );
  }
}

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
// class SettingsView extends StatelessWidget {
//   const SettingsView({super.key, required this.controller});

//   static const routeName = '/settings';

//   final SettingsController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         // Glue the SettingsController to the theme selection DropdownButton.
//         //
//         // When a user selects a theme from the dropdown list, the
//         // SettingsController is updated, which rebuilds the MaterialApp.
//         child: DropdownButton<ThemeMode>(
//           // Read the selected themeMode from the controller
//           value: controller.themeMode,
//           // Call the updateThemeMode method any time the user selects a theme.
//           onChanged: controller.updateThemeMode,
//           items: const [
//             DropdownMenuItem(
//               value: ThemeMode.system,
//               child: Text('System Theme'),
//             ),
//             DropdownMenuItem(
//               value: ThemeMode.light,
//               child: Text('Light Theme'),
//             ),
//             DropdownMenuItem(
//               value: ThemeMode.dark,
//               child: Text('Dark Theme'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
