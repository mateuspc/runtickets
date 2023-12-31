import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:runtickets/styles/app_colors.dart';

class PageDashboardMobile extends StatefulWidget {
  const PageDashboardMobile({Key? key}) : super(key: key);

  @override
  State<PageDashboardMobile> createState() => _PageDashboardMobileState();
}

class _PageDashboardMobileState extends State<PageDashboardMobile> {
  int currentPageIndex = 0;

  Widget buildSvgIcon(String path, double size) {
    return SvgPicture.asset(
      path,
      height: size,
      width: size,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Mobile"),
      ),
      body: Center(
        child: Text("Dashboard mobile"),
      ),
      bottomNavigationBar: ClipRRect(
        // borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: NavigationBar(
          backgroundColor: AppColors.colorPrimary, // Altere para a cor desejada
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          surfaceTintColor: Colors.white,
          indicatorColor: Colors.white24,
          selectedIndex: currentPageIndex,
          destinations:  <Widget>[
            NavigationDestination(
              icon: Badge(
                  isLabelVisible: false,
                  textColor: Colors.white,
                  child: buildSvgIcon('assets/icons/fi-rs-home.svg', 20)),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Badge(
                 isLabelVisible: false,
                  child: buildSvgIcon('assets/icons/fi-rs-search.svg', 20)
              ),
              label: 'Buscar',
            ),
            NavigationDestination(
              icon: Badge(
                label: Text('2'),
                isLabelVisible: false,
                child: SvgPicture.asset('assets/icons/fi-rs-ticket.svg'),
              ),
              label: 'Ticket',
            ),
            NavigationDestination(
              icon: Badge(
                  isLabelVisible: false,
                  child: buildSvgIcon('assets/icons/fi-rs-shopping-cart.svg', 20)),
              label: 'Carrinho',
            ),
            NavigationDestination(
              icon: Badge(
                  isLabelVisible: false,
                  child: buildSvgIcon('assets/icons/fi-rs-user.svg', 20)),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}