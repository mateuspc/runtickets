import 'package:flutter/material.dart';
import 'package:runtickets/pages/dashboard/desktop/page_dashboard_desktop.dart';
import 'package:runtickets/pages/dashboard/mobile/page_dashboad_mobile.dart';
import 'package:runtickets/responsive/responsive_container.dart';

class PageDashboardBase extends StatelessWidget {
  const PageDashboardBase({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveContainer(
      mobile: PageDashboardMobile(),
      desktop: PageDashboardDesktop(),
    );
  }
}
