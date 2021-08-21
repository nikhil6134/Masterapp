import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:masterapp/Screens/search_screen.dart';
import 'package:masterapp/providers/profile_provider.dart';

import 'package:masterapp/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Profiles()),
        ],
        child: Consumer<Profiles>(
          builder: (ctx, prof, _) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: theme(),
            home: SearchScreen(),
          ),
        ));
  }
}
