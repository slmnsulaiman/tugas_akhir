import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas_project_akhir/helper/dbhelper.dart';

class HomeController extends GetxController {
  final DataHelper dbHelper = Get.find();
  final ImagePicker _picker = ImagePicker();

  RxString imagePath = ''.obs;

  Future<void> uploadPhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    }
  }
}
