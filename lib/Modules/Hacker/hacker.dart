import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmnews/components/component.dart';
import 'package:hmnews/cubit/cubit.dart';
import 'package:hmnews/cubit/states.dart';
class hacker_screen extends StatelessWidget {
  const hacker_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit,newsStates>(
      listener: (context, state) {  },
      builder: (context,state) {
        var lhckr = newsCubit.get(context).hacker;
        return  buildARTList(lhckr,context);
      },
    );
  }
}