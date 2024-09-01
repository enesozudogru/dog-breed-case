abstract class BreedEvent {}

class FetchBreeds extends BreedEvent {}

class FilterBreeds extends BreedEvent {
  final String query;

  FilterBreeds(this.query);
}
