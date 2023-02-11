import 'package:flutter/material.dart';
import 'package:my_sesion/modules/Home/presenter/controllers/home_controller/sesion_state.dart';
import 'package:my_sesion/modules/Home/presenter/controllers/home_controller/sesion_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SesionStore _store = SesionStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: _store,
          builder: ((context, child) {
            final state = _store.state;
            if (state is SesionStateFailure) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is SesionStateLoading) {
              return const CircularProgressIndicator();
            }

            if (state is SesionStateInitial) {
              return Container();
            }

            if (state is SesionStateSucess) {
              return ListView.separated(
                itemBuilder: ((context, index) =>
                    Text(state.sesions[index].description)),
                separatorBuilder: ((context, index) => const SizedBox(
                      height: 12,
                    )),
                itemCount: state.sesions.length,
              );
            }
            return Container();
          })),
    );
  }
}
