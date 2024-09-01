import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';

import '../../core/base/base_api_service.dart';
import '../../core/constants/app_urls.dart';
import '../models/breed_model.dart';

class BreedService extends BaseApiService {
  final dio = Dio();

  @override
  Future<List<BreedModel>> allBreedsWithImages() async {
    final response = await dio.get('${AppUrls.baseUrl}breeds/list/all');
    if (response.statusCode == 200 && response.data['status'] == "success") {
      Map<String, dynamic> jsonMap = response.data['message'];
      List<BreedModel> breedList = jsonMap.entries.map((entry) {
        return BreedModel.fromJson(entry.key, entry.value);
      }).toList();

      await _cacheImagesForBreeds(breedList);
      return breedList;
    } else {
      return [];
    }
  }

  Future<void> _cacheImagesForBreeds(List<BreedModel> breeds) async {
    final futures = breeds.map((breed) async {
      try {
        var imageUrl = await _cacheImage(breed.name);
        breed.image = imageUrl;
      } catch (e) {
        print('Failed to cache image for ${breed.name}');
      }
    });
    await Future.wait(futures);
  }

  Future<String> _cacheImage(String breedName) async {
    final imageUrl = await getRandomImage(breedName);
    try {
      await CachedNetworkImageProvider(imageUrl).evict();
      return imageUrl;
    } catch (e) {
      print('Failed to cache image for $breedName');
      rethrow;
    }
  }

  @override
  Future<String> getRandomImage(String breedName) async {
    final response = await dio.get('${AppUrls.baseUrl}breed/$breedName/images/random');
    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw Exception('Failed to load image');
    }
  }
}
