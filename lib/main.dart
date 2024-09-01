import 'package:case_study/core/init/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/init/locator.dart';
import 'feature/blocs/breed/breed_bloc.dart';
import 'feature/blocs/breed/breed_event.dart';
import 'feature/router/app_router.dart';
import 'feature/services/breed_service.dart';

void main() {

  setupLocator();
  final breedService = locator<BreedService>();
  runApp(BlocProvider(
    create: (context) => BreedBloc(breedService)..add(FetchBreeds()),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: LightTheme.theme,
      title: "Case Study",
      debugShowCheckedModeBanner: false,
    );
  }
}
