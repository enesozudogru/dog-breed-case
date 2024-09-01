import 'package:case_study/feature/services/breed_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:case_study/feature/models/breed_model.dart';
import 'breed_event.dart';
import 'breed_state.dart';

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  final BreedService breedService;
  List<BreedModel> _allBreeds = [];

  BreedBloc(this.breedService) : super(BreedInitial()) {
    on<FetchBreeds>((event, emit) async {
      emit(BreedLoading());
      try {
        _allBreeds = await breedService.allBreedsWithImages();
        emit(BreedLoaded(_allBreeds));
      } catch (e) {
        emit(BreedError("Failed to fetch Breeds $e"));
      }
    });

    on<FilterBreeds>((event, emit) async {
      try {
        emit(BreedLoading());

        if (event.query.isEmpty) {
          emit(BreedLoaded(_allBreeds));
        } else {
          final filteredBreeds = _allBreeds.where((breed) => breed.name.toLowerCase().contains(event.query.toLowerCase())).toList();
          emit(BreedFiltered(filteredBreeds));
        }
      } catch (e) {
        emit(BreedError("Failed to fetch and filter breeds: $e"));
      }
    });


  }
}
