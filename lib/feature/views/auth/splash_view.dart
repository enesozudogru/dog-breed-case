import 'package:case_study/core/constants/app_colors.dart';
import 'package:case_study/feature/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/init/locator.dart';
import '../../blocs/breed/breed_bloc.dart';
import '../../blocs/breed/breed_event.dart';
import '../../blocs/breed/breed_state.dart';
import '../../services/breed_service.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final breedService = locator<BreedService>();

    return BlocProvider(
      create: (context) => BreedBloc(breedService)..add(FetchBreeds()),
      child: Container(
        color: AppColors.background,
        child: BlocBuilder<BreedBloc, BreedState>(
          builder: (context, state) {
            if (state is BreedLoading) {
              return Center(child: Image.asset('assets/images/splash-icon.png'));
            } else if (state is BreedLoaded) {
              return const HomeView();
            } else if (state is BreedError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Image.asset('assets/images/splash-icon.png'));
          },
        ),
      ),
    );
  }
}
