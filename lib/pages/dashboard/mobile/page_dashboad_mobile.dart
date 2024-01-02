import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:runtickets/pages/home/mobile/page_home_mobile.dart';
import 'package:runtickets/pages/profile/page_profile_options.dart';
import 'package:runtickets/routes.dart';
import 'package:runtickets/styles/app_colors.dart';

class PageDashboardMobile extends StatefulWidget {
  const PageDashboardMobile({Key? key}) : super(key: key);

  @override
  State<PageDashboardMobile> createState() => _PageDashboardMobileState();
}

class _PageDashboardMobileState extends State<PageDashboardMobile> {
  int currentPageIndex = 0;
  List<Widget> pages = [
    const PageHomeMobile(),
    Container(
      child: Center(child: Text('Buscar'),),
    ),
    Container(
      child: Center(child: Text('Ticket'),),
    ),
    Container(
      child: Center(child: Text('Carrinho'),),
    ),
    const PageProfilePageOptions()
  ];
  Widget buildSvgIcon(String path, double size, int index) {
    return SvgPicture.asset(
      path,
      height: size,
      width: size,
      colorFilter: ColorFilter.mode(
          index == currentPageIndex ? Colors.white : Colors.white, BlendMode.srcIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: ClipRRect(
        // borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: NavigationBar(
          backgroundColor: AppColors.colorPrimary, // Altere para a cor desejada
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
            switch(index){
              case 2:
                context.go(AppRoutes.PAGE_LOGIN);
            }
          },
          surfaceTintColor: Colors.white,
          indicatorColor: Colors.transparent,
          selectedIndex: currentPageIndex,
          destinations:  <Widget>[
            NavigationDestination(
              icon: Badge(
                  isLabelVisible: false,
                  textColor: Colors.white,
                  child: buildSvgIcon('assets/icons/fi-rs-home.svg', 20, 0)),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Badge(
                 isLabelVisible: false,
                  child: buildSvgIcon('assets/icons/fi-rs-search.svg', 20, 1)
              ),
              label: 'Buscar',
            ),
            NavigationDestination(
              icon: Badge(
                label: Text('2'),
                isLabelVisible: false,
                child: buildSvgIcon('assets/icons/fi-rs-ticket.svg', 20, 2),
              ),
              label: 'Ticket',
            ),
            NavigationDestination(
              icon: Badge(
                  isLabelVisible: false,
                  child: buildSvgIcon('assets/icons/fi-rs-shopping-cart.svg', 20, 3)),
              label: 'Carrinho',
            ),
            NavigationDestination(
              icon: Badge(
                  isLabelVisible: false,
                  child: buildSvgIcon('assets/icons/fi-rs-user.svg', 20, 4)),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}