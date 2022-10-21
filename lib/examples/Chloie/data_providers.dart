import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Chloie/models/photoModel.dart';
import 'package:sandbox/examples/Chloie/notifier.dart';
import 'package:sandbox/examples/Chloie/screens/photo_list_screen.dart';

final photoDataProvider = FutureProvider<List<PhotoModel>>((ref) async {
  return ref.read(photoRepositoryProvider).getAllPhotos();
});

final singlePhotoDataProvider =
    FutureProvider.family.autoDispose<PhotoModel, int>(
  (ref, id) async {
    return ref.read(photoRepositoryProvider).getPhoto(id.toString());
  },
);
final filterPhotoDataProvider =
    FutureProvider.family.autoDispose<List<PhotoModel>, String>(
  (ref, albumId) async {
    return ref
        .watch(photoRepositoryProvider)
        .getFilterPhoto(albumId.toString());
  },
);
// final filterPhotoProvider = StateNotifierProvider.autoDispose<PhotosNotifier,
//     AsyncValue<List<PhotoModel>>>((ref) {
//   return PhotosNotifier();
// });
final filterPhotoProvider =
    StateNotifierProvider<PhotosFilterNotifier, String>((ref) {
  return PhotosFilterNotifier();
});
