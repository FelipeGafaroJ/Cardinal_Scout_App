
import 'package:flutter/material.dart';
import 'package:com.cardinalscout/src/models/route_argument.dart';
import 'package:com.cardinalscout/src/pages/login.dart';
import 'package:com.cardinalscout/src/pages/pages.dart';
import 'package:com.cardinalscout/src/pages/home.dart';
import 'package:com.cardinalscout/src/pages/settings.dart';
import 'package:com.cardinalscout/src/pages/signup.dart';
import 'package:com.cardinalscout/src/pages/splash_screen.dart';
import 'package:com.cardinalscout/src/pages/block.dart';
import 'package:com.cardinalscout/src/pages/category.dart';
import 'package:com.cardinalscout/src/pages/activity.dart';
import 'package:com.cardinalscout/src/pages/walkthrough.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/Debug':
        //return MaterialPageRoute(builder: (_) => DebugWidget(routeArgument: args as RouteArgument));
      case '/Walkthrough':
        return MaterialPageRoute(builder: (_) => Walkthrough());
      case '/Splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/SignUp':
        return MaterialPageRoute(builder: (_) => SignUpWidget());
      case '/Login':
        return MaterialPageRoute(builder: (_) => LoginWidget());
      case '/ForgetPassword':
        //return MaterialPageRoute(builder: (_) => ForgetPasswordWidget());
      case '/Home':
        return MaterialPageRoute(builder: (_) => HomeWidget());
      case '/Pages':
        return MaterialPageRoute(builder: (_) => PagesTestWidget(currentTab: args));
      case '/Blocks':
        return MaterialPageRoute(builder: (_) => BlockWidget(routeArgument: args as RouteArgument));
      case '/Activitys':
        return MaterialPageRoute(builder: (_) => ActivityWidget(routeArgument: args as RouteArgument));
      case '/Categorys':
        return MaterialPageRoute(builder: (_) => CategoryWidget(routeArgument: args as RouteArgument));     
      case '/Settings':
        return MaterialPageRoute(builder: (_) => SettingsWidget());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(builder: (_) => PagesTestWidget(currentTab: 2));
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
