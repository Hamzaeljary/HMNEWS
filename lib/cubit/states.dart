import 'package:hmnews/cubit/cubit.dart';
import 'package:hmnews/cubit/states.dart';

abstract class newsStates{}

class NewsInitialStates extends newsStates {}

class ChangeBottomNavigationBarItemStates extends newsStates{}

class NewsGetSportsLoadingStates extends newsStates{}

class NewsGetSportsSuccessStates extends newsStates{}

class AppChangeModeState extends newsStates{}

class NewsGetSportsErrorStates extends newsStates{

  final String error;

  NewsGetSportsErrorStates(this.error);

}


class NewsGetScienceLoadingStates extends newsStates{}

class NewsGetScienceSuccessStates extends newsStates{}

class NewsGetScienceErrorStates extends newsStates{

  final String error;

  NewsGetScienceErrorStates(this.error);

}

class NewsGetHackersLoadingStates extends newsStates{}

class NewsGetHackersSuccessStates extends newsStates{}

class NewsGetHackersErrorStates extends newsStates{

  final String error;

  NewsGetHackersErrorStates(this.error);

}


class NewsGetCryptoLoadingStates extends newsStates{}

class NewsGetCryptoSuccessStates extends newsStates{}

class NewsGetCryptoErrorStates extends newsStates{

  final String error;

  NewsGetCryptoErrorStates(this.error);

}

class NewsGetSearchLoadingStates extends newsStates{}

class NewsGetSearchSuccessStates extends newsStates{}

class NewsGetSearchErrorStates extends newsStates{

  final String error;

  NewsGetSearchErrorStates(this.error);

}
