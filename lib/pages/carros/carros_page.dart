import 'dart:async';

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carros_bloc.dart';
import 'package:carros/pages/carros/carros_listview.dart';
import 'package:carros/utils/event_bus.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';

class CarrosPage extends StatefulWidget {
  final String tipo;

  CarrosPage(this.tipo);

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin<CarrosPage> {

  StreamSubscription<Event> subscription;

  String get tipo => widget.tipo;

  final _bloc = CarrosBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _bloc.fetch(tipo);

    // Escutando uma stream
    final bus = EventBus.get(context);
    subscription = bus.stream.listen((Event e){
      print("Event $e");
      CarroEvent carroEvent = e;
      if(carroEvent.tipo == tipo) {
        _bloc.fetch(tipo);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return TextError("Não foi possível buscar os carros");
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Carro> carros = snapshot.data;

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CarrosListView(carros),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _bloc.fetch(tipo);
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
    subscription.cancel();
  }
}
