import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:runtickets/pages/dashboard/styles/fontSize.dart';
import 'package:runtickets/pages/home/mobile/models/corrida_evento.dart';
import 'package:runtickets/responsive/mixins.dart';
import 'package:runtickets/styles/app_colors.dart';

final List<CorridaEvento> anuncios = [
  CorridaEvento(
      "Corrida de Amadores", "Sábado", "Parque Central", "assets/image1.jpg"),
  CorridaEvento("Corrida Beneficente", "Domingo", "Praça da Cidade",
      "assets/image2.jpg"),
  CorridaEvento("Maratona Noturna", "Terça-feira", "Marginal do Rio",
      "assets/image3.jpg"),
  CorridaEvento("Corrida da Saúde", "Quinta-feira", "Bosque Municipal",
      "assets/image4.jpg"),
  CorridaEvento("Corrida da Amizade", "Sexta-feira", "Pista de Atletismo",
      "assets/image5.jpg"),
  CorridaEvento(
      "Corrida do Bairro", "Sábado", "Ruas do Bairro", "assets/image6.jpg"),
  CorridaEvento("Corrida da Natureza", "Domingo", "Trilhas na Floresta",
      "assets/image7.jpg"),
];


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

class PageDashboardDesktop extends StatefulWidget{
  const PageDashboardDesktop({super.key});

  @override
  State<PageDashboardDesktop> createState() => _PageDashboardDesktopState();
}

class _PageDashboardDesktopState extends State<PageDashboardDesktop> with Responsive{

  int _current = 0;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

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
            padding: EdgeInsets.symmetric(horizontal: size.width < 1000 ? 60 : 100, vertical: 15),
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
              padding: EdgeInsets.only(left: size.width < 1000 ? 60 : 100, right: size.width < 1000 ? 60 : 100),
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width < 1000 ? 60 : 120, vertical: 15),
              child: Text(
                'Próximas corridas ${size.width}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          DividerSpaceSliver(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width < 1000 ? 60 : 100, vertical: 15),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCountResponsive(size),
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: anuncios.length,
                itemBuilder: (BuildContext context, int index) {
                  CorridaEvento anuncio = anuncios[index];
                  return Card(
                    elevation: 3.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          anuncio.imagem,
                          height: 120.0,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                anuncio.titulo,
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4.0),
                              Text("Dia: ${anuncio.dia}"),
                              Text("Local: ${anuncio.local}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  int crossAxisCountResponsive(Size size) {
    return size.width < 800 ? 2
                    : size.width < 1100
                    ? 3 : size.width < 1280
                    ? 4 : 5;
  }
}

SliverToBoxAdapter DividerSpaceSliver() {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: 20,
    ),
  );
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

