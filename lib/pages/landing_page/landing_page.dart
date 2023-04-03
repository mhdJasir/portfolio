import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/pages/landing_page/mobile_home_page.dart';
import 'package:portfolio/pages/landing_page/web_home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (c, constraints) {
        if (constraints.maxWidth > 600) {
          return WebHome();
        }
        return MobileHomePage();
      },
    );
  }
}