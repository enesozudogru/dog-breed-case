import 'package:case_study/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/breed/breed_bloc.dart';
import '../../blocs/breed/breed_state.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {

    return  BlocListener<BreedBloc, BreedState>(
      listener: (context, state) {
        if (state is BreedLoaded) {
          GoRouter.of(context).go("/home");
        } else if (state is BreedError) {
          print(state.message);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: BlocBuilder<BreedBloc, BreedState>(
            builder: (context, state) {
              if (state is BreedLoading) {
                return Image.asset('assets/images/splash-icon.png');
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
