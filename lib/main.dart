import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hmnews/Modules/Search/search_screen.dart';
import 'package:hmnews/cubit/cubit.dart';
import 'package:hmnews/layout/hmnews.dart';
import 'package:hmnews/network/remote/dio_helper.dart';
import 'cubit/states.dart';
void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => newsCubit()
          ..getSports()
          ..getScience()
          ..getHacker()
          ..getCrypto(),)
      ],
      child: BlocConsumer<newsCubit , newsStates>(
        listener: (context , state) {},
        builder: (context , state) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,//loading
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )
              ),
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.blueAccent,
                elevation: 20.0,
              ) ,
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.white,
                  )
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor:HexColor('333739'),
              primarySwatch: Colors.deepOrange,//loading
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )
              ),
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ) ,
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w900,
                  )
              ),
            ),
            home:hmnews(),
          );
        },
      ),
    );
  }
}

