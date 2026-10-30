// ignore_for_file: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;

void saveCampusPhotoFile(String dataUrlOrPath, String fileName) {
  final anchor = html.AnchorElement(href: dataUrlOrPath)
    ..target = 'blank'
    ..download = fileName;
  html.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
}
