import 'package:case_study/feature/models/breed_model.dart';

abstract class BreedState {}

class BreedInitial extends BreedState {}

class BreedLoading extends BreedState {}

class BreedLoaded extends BreedState {
  final List<BreedModel> breeds;

  BreedLoaded(this.breeds);

}

class BreedFiltered extends BreedState {
  final List<BreedModel> filteredBreeds;

  BreedFiltered(this.filteredBreeds);
}

class BreedError extends BreedState {
  final String message;
  BreedError(this.message);
}
