import 'package:cached_network_image/cached_network_image.dart';
import 'package:case_study/core/constants/app_colors.dart';
import 'package:case_study/feature/blocs/breed/breed_bloc.dart';
import 'package:case_study/feature/blocs/breed/breed_state.dart';
import 'package:case_study/feature/models/breed_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/init/locator.dart';
import '../../../services/breed_service.dart';
import 'breed_card.dart';

class BreedList extends StatelessWidget {
  const BreedList({super.key});

  void _showPopup(BuildContext context, BreedModel breed) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 340,
                        width: 340,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(breed.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CircleAvatar(radius: 16, backgroundColor: Colors.white, child: Icon(Icons.close_rounded, size: 16)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text("Breed", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.secondaryText)),
                  const Divider(indent: 30, endIndent: 30),
                  Text(breed.name, style: const TextStyle(fontSize: 16, color: Colors.black)),
                  const SizedBox(height: 20),
                  const Text("Sub Breed", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.secondaryText)),
                  const Divider(indent: 30, endIndent: 30),
                  ...breed.subBreeds.map(
                    (subBreedName) => Text(subBreedName, style: const TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: double.infinity,
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () async {
                        final breedService = locator<BreedService>();
                        var image = await breedService.getRandomImage(breed.name);
                        if (context.mounted) {
                          _showImagePopup(context, image);
                        }
                      },
                      child: const Text('Generate'),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: child,
        );
      },
    );
  }

  void _showImagePopup(BuildContext context, String image) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: const BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.all(Radius.circular(2))),
                      width: 32,
                      height: 32,
                      child: const Icon(Icons.close_rounded, size: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<BreedBloc, BreedState>(
        builder: (context, state) {
          if (state is BreedLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BreedLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.only(bottom: 70),
              itemCount: state.breeds.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemBuilder: (context, index) {
                BreedModel breed = state.breeds[index];
                return InkWell(
                  onTap: () {
                    _showPopup(context, breed);
                  },
                  child: BreedCard(
                    breed: breed.name,
                    image: breed.image,
                  ),
                );
              },
            );
          } else if (state is BreedError) {
            print("Error : ${state.message}");
            return Center(child: Text(state.message));
          } else {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No results found'),
                SizedBox(height: 10),
                Text('Try searching with another word'),
              ],
            );
          }
        },
      ),
    );
  }
}
