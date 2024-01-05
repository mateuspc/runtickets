
import 'package:flutter/material.dart';
import 'package:runtickets/pages/autenticacao/login/desktop/page_login_desktop.dart';
import 'package:runtickets/pages/autenticacao/login/mobile/page_login_mobile.dart';

import 'package:runtickets/responsive/responsive_container.dart';

class PageLoginBase extends StatefulWidget {
  const PageLoginBase({super.key});

  @override
  State<PageLoginBase> createState() => _PageLoginBaseState();
}

class _PageLoginBaseState extends State<PageLoginBase> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveContainer(
        mobile: PageLoginMobile(),
        desktop: PageLoginDesktop(),
      ),
    );
  }
}
