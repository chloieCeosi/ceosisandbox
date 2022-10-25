import '../models/photoModel.dart';

abstract class PhotoRepositoryInterface {
  Future<List<PhotoModel>> getAllPhotos();
  Future<PhotoModel> getPhoto(String id);
  Future<List<PhotoModel>> getFilterPhoto(String id);
}
