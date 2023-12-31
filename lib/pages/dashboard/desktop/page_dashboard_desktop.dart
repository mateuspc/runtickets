import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:runtickets/pages/dashboard/styles/fontSize.dart';
import 'package:runtickets/styles/app_colors.dart';

class Slide {
  Slide({
    required this.title,
    required this.height,
    required this.color,
  });

  final Color color;
  final double height;
  final String title;
}

var slides = List.generate(
  6,
      (index) => Slide(
    title: 'Slide ${index + 1}',
    height: 100.0 + index * 50,
    color: Colors.primaries[index % Colors.primaries.length],
  ),
);

final List<Widget> sliders = slides
    .map(
      (item) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      child: Container(
        color: item.color,
        width: double.infinity,
        height: item.height,
        child: Placeholder(),
      ),
    ),
  ),
)
    .toList();

class PageDashboardDesktop extends StatefulWidget {
  const PageDashboardDesktop({super.key});

  @override
  State<PageDashboardDesktop> createState() => _PageDashboardDesktopState();
}

class _PageDashboardDesktopState extends State<PageDashboardDesktop> {

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            leadingWidth: 150,
            backgroundColor: AppColors.colorPrimary,
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset("assets/logo/logosvg.svg"),
              ),
            ),
            title: Row(
              children: [
                ButtonAppBarDesktop(text: 'Home', onClick: () {  },),
                ButtonAppBarDesktop(text: 'Minhas corridas', onClick: () {  },)
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 35),
                child: IconButton(
                  icon: SvgPicture.asset("assets/icons/fi-rs-shopping-cart.svg"),
                  onPressed: () {  },
                  color: AppColors.colorWhite,
                ),
              )
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            sliver: SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/logo/logo_horizontal_azul.png"),
                    )
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: Stack(
                children: [
                  SizedBox(
                    child: FlutterCarousel(
                      items: sliders,
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 6),
                          viewportFraction: 1.0,
                          showIndicator: false,
                          height: 300.0,
                          onPageChanged: (int index, CarouselPageChangedReason reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 100,
                    right: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: slides.asMap().entries.map((entry) {
                        return Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.white)
                                .withOpacity(_current == entry.key ? 0.9 : 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
class ButtonAppBarDesktop extends StatefulWidget {
  final String text;
  final VoidCallback onClick;
  const ButtonAppBarDesktop({super.key,
    required this.text,
    required this.onClick});

  @override
  State<ButtonAppBarDesktop> createState() => _ButtonAppBarDesktopState();
}

class _ButtonAppBarDesktopState extends State<ButtonAppBarDesktop> {

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: isHovered ? Colors.transparent : Colors.transparent,
          child: InkWell(
            onTap: () {
              // Adicione a lógica para o clique do botão aqui
            },
            onHover: (isHovered) {
              setState(() {
                this.isHovered = isHovered;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSizeTextButton,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

