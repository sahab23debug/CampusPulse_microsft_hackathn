import 'file_saver_stub.dart'
    if (dart.library.html) 'file_saver_web.dart' as platform_saver;

/// Universal file saver for captured photos and geotag watermarks
class CampusFileSaver {
  static void downloadPhoto(String urlOrData, String fileName) {
    platform_saver.saveCampusPhotoFile(urlOrData, fileName);
  }
}
