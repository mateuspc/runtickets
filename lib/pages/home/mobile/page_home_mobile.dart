import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import 'models/corrida_evento.dart';

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

class PageHomeMobile extends StatefulWidget {
  const PageHomeMobile({super.key});

  @override
  State<PageHomeMobile> createState() => _PageHomeMobileState();
}

class _PageHomeMobileState extends State<PageHomeMobile> {
  int _current = 0;
  final ScrollController _scrollController = ScrollController();
  bool _isScrolledDown = false;

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


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final isScrolledDown = _scrollController.hasClients &&
          _scrollController.offset > 0;

      if (_isScrolledDown != isScrolledDown) {
        setState(() {
          _isScrolledDown = isScrolledDown;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          DividerSpaceSliver(),
          SliverAppBar(
            title: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/logo/logo_horizontal_azul.png"),
                  )),
            ),
            floating: true,
            elevation: _scrollController.hasClients &&
                    _scrollController.offset > 0
                ? 0 // Se o usuário rolar para baixo, a elevação é definida como 0
                : 10, // Caso contrário, a elevação padrão é usada
            backgroundColor: _scrollController.hasClients &&
                    _scrollController.offset > 10
                ? Colors
                    .white // Se o usuário rolar para baixo, a cor de fundo é branca
                : Colors
                    .transparent, // Caso contrário, a cor de fundo é transparente
          ),
          DividerSpaceSliver(),
          SliverToBoxAdapter(
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
                        height: 150.0,
                        onPageChanged:
                            (int index, CarouselPageChangedReason reason) {
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
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Próximas corridas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          DividerSpaceSliver(),
          SliverToBoxAdapter(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
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
          )
        ],
      ),
    );
  }

  SliverToBoxAdapter DividerSpaceSliver() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 20,
      ),
    );
  }
}
