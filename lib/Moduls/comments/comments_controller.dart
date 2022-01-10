import 'package:get/get.dart';
import 'package:untitled6/Models/Comments.dart';
import 'package:untitled6/native_service/secure_storage.dart';

import 'comments_service.dart';

class CommentController extends GetxController {
  CommentService service = CommentService();
  List<dynamic> commetnStatus = [];
  final loading = false.obs;
  final comment = ''.obs;
  Future<void> showComments(int id) async {
    loading.value = true;
    SecureStorage storage = SecureStorage();
    String? token = await storage.read('token');
    commetnStatus = await service.showComments(id, token!);
    loading.value = false;
  }
  Future<void> commentButton(String comment ,int id) async {
    SecureStorage storage = SecureStorage();
    String? token = await storage.read('token');
    await service.addComment( id,comment, token! );
  }
}