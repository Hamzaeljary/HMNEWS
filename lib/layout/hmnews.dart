import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmnews/cubit/cubit.dart';
import 'package:hmnews/cubit/states.dart';
import '../Modules/Search/search_screen.dart';
import '../components/component.dart';

class hmnews extends StatelessWidget {
  const hmnews({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => newsCubit()
        ..getSports()
        ..getScience()
        ..getHacker()
        ..getCrypto(),
      child: BlocConsumer<newsCubit, newsStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          var cb = newsCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text('HMNEWS'),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                         navgate(context, SearchScreen());
                    },
            )],
              ),
              body: cb.lscreens[cb.indexItems],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cb.indexItems,
                onTap: (index) {
                  cb.changeBottomNavigationBarItem(index);
                },
                items: cb.bottomItems,
              ));
        },
      ),
    );
  }
}
