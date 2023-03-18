import 'package:image_picker/image_picker.dart';

enum GetCameraFrom {
  gallery,
  camera,
}

class ImagePickerUtils {
  static Future<XFile?> getImage(GetCameraFrom source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source == GetCameraFrom.camera
          ? ImageSource.camera
          : ImageSource.gallery,
          maxHeight: 1800,
          maxWidth: 1800,
    );
    return pickedFile;
  }
}
