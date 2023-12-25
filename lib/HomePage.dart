import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubits/InternetCubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Test'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.Get) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Internet Connected'),
                    backgroundColor: Colors.lightGreen),
              );
            } else if (state == InternetState.Lost) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Internet Disonnected'),
                    backgroundColor: Colors.red),
              );
            }
          },
          builder: (context, state) {
            if (state == InternetState.Get) {
              return Text(
                'Connected',
                style: TextStyle(fontSize: 18),
              );
            } else if (state == InternetState.Lost) {
              return Text(
                'Not Connected',
                style: TextStyle(fontSize: 18),
              );
            }
            return Text(
              'Loading...',
              style: TextStyle(fontSize: 18),
            );
          },
        ),
        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {

        // ),
      ),
    );
  }
}
