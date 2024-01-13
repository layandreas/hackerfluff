import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';

import '../storage/db_provider.dart';
import 'settings_model.dart';
import 'dart:convert';

// Necessary for code-generation to work
part 'settings_provider.g.dart';

enum Setting {
  theme,
}

@riverpod
class Settings extends _$Settings {
  @override
  Future<SettingsModel> build() async {
    final db = await ref.watch(databaseProvider.future);

    final settingsFromDB = await db
        .rawQuery("select settings_json as settingsJson from settings ");
    if (settingsFromDB.length == 1) {
      final settingsRaw =
          json.decode(settingsFromDB[0]["settingsJson"] as String);
      final settingsParsed = SettingsModel.fromJson(settingsRaw);
      return settingsParsed;
    } else {
      return const SettingsModel();
    }
  }

  void updateSettings({required SettingsModel settings}) async {
    final db = ref.read(databaseProvider);
    final settingsStr = json.encode(settings.toJson());

    switch (db) {
      case AsyncError():
        return;

      case AsyncValue(:final value):
        await value!.transaction((txn) async {
          await txn.rawInsert(
              'insert or replace into settings(setting_name, settings_json) values(?, ?)',
              ["settings_json", settingsStr]);
        });
        ref.invalidateSelf();
    }
  }
}
