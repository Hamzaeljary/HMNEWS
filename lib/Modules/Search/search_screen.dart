import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmnews/components/component.dart';
import 'package:hmnews/cubit/cubit.dart';

import '../../cubit/states.dart';

class SearchScreen extends StatelessWidget {
  var srController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit ,newsStates>(
         listener:(context, state){} ,
         builder:(context ,state){
           var lsearch = newsCubit.get(context).search;
           return Scaffold(
             appBar: AppBar(),
             body: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: TextFormField(
                     controller: srController,
                     keyboardType:TextInputType.text,
                     onChanged: (value){
                            newsCubit.get(context).getSearch(value);
                     },
                     validator:(String? value){
                       if(value!.isEmpty)
                       {
                         print('search is not empty !');
                       }
                       return null;
                     } ,
                     decoration: const InputDecoration(
                       icon: Icon(Icons.search),
                       hintText: 'write here what you are looking for?',
                       labelText: 'Search *',
                     ),
                   ),
                 ),
                 Expanded(child: buildARTList(lsearch, context , search : true,),),
               ],
             ),
           );
         } ,
    );
  }
}
