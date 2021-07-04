import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:minibr/pages/item-detail.dart';
import 'package:minibr/pages/items.dart';
import 'package:minibr/pages/login.dart';
import 'package:minibr/pages/home.dart';
import 'package:minibr/store/store.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(ChangeNotifierProvider(
    create: (context) => Store(),
    child: Application(),
  ));
}

class Application extends StatefulWidget {
  Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  var _title = dotenv.env['APP_NAME'].toString();
  var _isDebug = dotenv.env['DEBUG'].toString().toLowerCase() == "true";

  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(
      builder: (context, store, child) => MaterialApp(
        debugShowCheckedModeBanner: _isDebug,
        theme: store.isDark ? ThemeData.dark() : ThemeData.light(),
        title: _title,
        home: Home(),
        initialRoute: '/login',
        routes: {
          '/home': (context) => Home(),
          '/login': (context) => Login(),
          '/items': (context) => Items(),
          '/item-detail': (context) => ItemDetail(),
        },
      ),
    );
  }
}
