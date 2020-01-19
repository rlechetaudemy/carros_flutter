import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carro_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class CarrosListView extends StatelessWidget {
  final List<Carro> carros;

  CarrosListView(this.carros);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          Carro c = carros[index];

          return Card(
            color: Colors.grey[100],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: CachedNetworkImage(
                      imageUrl:
                      c.urlFoto ??
                          "http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png",
                      width: 250,
                    ),
                  ),
                  Text(
                    c.nome,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "descrição...",
                    style: TextStyle(fontSize: 16),
                  ),
                  ButtonBarTheme(
                    data: ButtonBarThemeData(),
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('DETALHES'),
                          onPressed: () => _onClickCarro(context,c),
                        ),
                        FlatButton(
                          child: const Text('SHARE'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _onClickCarro(context,Carro c) {
    push(context, CarroPage(c));
  }
}
