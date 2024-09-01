class BreedModel {
  final String name;
  String image;
  final List<String> subBreeds;

  BreedModel({
    required this.name,
    required this.image,
    required this.subBreeds,
  });

  factory BreedModel.fromJson(String name, dynamic subBreedsJson) {
    List<String> subBreeds = [];
    if (subBreedsJson is List) {
      subBreeds = List<String>.from(subBreedsJson.map((e) => e.toString()));
    }

    return BreedModel(
      name: name,
      image: "",
      subBreeds: subBreeds,
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "subBreeds": subBreeds,
      };
}
