import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/bored_bloc.dart';
import 'package:flutter_application_1/model/bored.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BLoC Example'),
        ),
        body: Center(
          child: BlocProvider(
            create: (context) => BoredBloc(),
            child: MyHomeWidget(),
          ),
        ),
      ),
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  const MyHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BoredBloc>(context).add(LoadingEvent());
    return BlocBuilder<BoredBloc, BoredState>(
      builder: (context, state) {
        if (state is LoadingState) return CircularProgressIndicator();
        if (state is ErrorState) return Text('Что-то пошло не так(((');
        if (state is LoadedState) {
          final Bored data = state.data;
          return Text(
            data.activity,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blueGrey, fontSize: 20),
          );
        }
        return Text('Блок не работает почему-то((((');
      },
    );
  }
}
