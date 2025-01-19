import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prodata_task/core/initilaize/app_init.dart';
import 'package:flutter_prodata_task/core/navigation/route_manager.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/location_bloc.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/place_bloc.dart';

void main() async {
  runApp(const MyApp());
  await AppInit.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocationBloc()),
        BlocProvider(create: (context) => PlaceBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: RouteManager.instance.router,
      ),
    );
  }
}
