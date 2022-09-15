import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmnews/components/component.dart';
import 'package:hmnews/cubit/cubit.dart';
import 'package:hmnews/cubit/states.dart';
class crypto_screen extends StatelessWidget{
  const crypto_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit,newsStates>(
      listener: (context, state) {  },
      builder: (context,state) {
        var lcrpt = newsCubit.get(context).crypto;
        return  buildARTList(lcrpt,context);
      },
    );
  }
}
