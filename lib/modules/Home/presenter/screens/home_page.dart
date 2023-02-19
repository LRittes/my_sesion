import 'package:birl/birl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_sesion/modules/Home/presenter/controllers/home_controller/sesion_state.dart';
import 'package:my_sesion/modules/Home/presenter/controllers/home_controller/sesion_store.dart';
import 'package:my_sesion/modules/shared/utils/functions/format_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SesionStore _store = SesionStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 48, 12, 96),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedBuilder(
              animation: _store,
              builder: (ctx, child) {
                final state = _store.state;
                if (state is SesionStateFailure) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                if (state is SesionStateLoading) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                  ));
                }

                if (state is SesionStateInitial) {
                  return Container();
                }

                if (state is SesionStateSucess && _store.todaySesion != null) {
                  return TodaySesionCard(
                      description: _store.todaySesion!.description,
                      dates: formatData(_store.todaySesion!.date));
                }
                return Container();
              },
            ),
            SizedBox(
              height: 300,
              child: AnimatedBuilder(
                  animation: _store,
                  builder: ((context, child) {
                    final state = _store.state;
                    if (state is SesionStateFailure) {
                      return Center(
                        child: Text(state.message),
                      );
                    }

                    if (state is SesionStateLoading) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.secondary,
                      ));
                    }

                    if (state is SesionStateInitial) {
                      return Container();
                    }

                    if (state is SesionStateSucess) {
                      return ListView.separated(
                        itemBuilder: ((context, index) => Slidable(
                              startActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (ctx) {},
                                    icon: Icons.update,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ],
                              ),
                              endActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (ctx) => _store
                                        .deleteSesion(state.sesions[index]),
                                    icon: Icons.delete_forever,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.error,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ],
                              ),
                              child: NextSesionCard(
                                description: state.sesions[index].description,
                                date: formatData(state.sesions[index].date)[1],
                                onTap: () {},
                              ),
                            )),
                        separatorBuilder: ((context, index) => const SizedBox(
                              height: 12,
                            )),
                        itemCount: state.sesions.length,
                      );
                    }
                    return Container();
                  })),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Add sesion"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
