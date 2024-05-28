import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart'; // Add this import

const String appGroupId = 'group.com.layandreas.hackerfluff';
const String iOSWidgetName = 'HackerfluffWidgets';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HomeWidget.setAppGroupId(appGroupId);

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(const ProviderScope(
    child: HackernewsApp(),
  ));
}
