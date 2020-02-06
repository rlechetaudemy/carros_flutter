import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carros_bloc.dart';
import 'package:carros/pages/carros/carros_listview.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CarrosSearchPage extends StatefulWidget {
  CarrosSearchPage();

  @override
  _CarrosSearchPageState createState() => _CarrosSearchPageState();
}

class _CarrosSearchPageState extends State<CarrosSearchPage> {
  final _bloc = CarrosBloc();

  final _tSearch = TextEditingController();

  final _onChangedStream = PublishSubject<String>();

  @override
  void initState() {
    super.initState();

    _onChangedStream.stream
        .debounceTime(Duration(milliseconds: 400))
        .listen(onSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Busca"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          AppText(
            "Nome",
            "Digite o nome do carro para buscar",
            controller: _tSearch,
            onChanged: (query) => _onChangedStream.add(query),
          ),
          StreamBuilder(
            stream: _bloc.stream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return TextError("Não foi possível buscar os carros");
              }

              if (!snapshot.hasData) {
                return Expanded(
                  child: Center(
                    child: Text("Faça a busca",style: TextStyle(fontSize: 22),),
                  ),
                );
              }

              List<Carro> carros = snapshot.data;

              return Expanded(child: CarrosListView(carros));
            },
          ),
        ],
      ),
    );
  }

  void onSearch(String query) {
    _bloc.search(query);
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
    _onChangedStream.close();
  }
}
