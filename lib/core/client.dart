import 'package:dio/dio.dart';
import 'package:profile/core/exceptions/auth_exception.dart';
import 'package:profile/core/interceptor.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(
      BaseOptions(baseUrl: "http://192.168.1.80/api/v1", validateStatus: (status) => true),
    );
    dio.interceptors.add(AuthInterceptor());
  }

  late final Dio dio;

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {"login": login, "password": password},
    );

    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw AuthException(message: "Login qilib bo'madi, xullasi nimadur noto'g'ri ketgan.");
    }
  }

  Future<Map<String, dynamic>> fetchMyProfile() async {
    var response = await dio.get('/auth/me');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return data;
    } else {
      throw AuthException(message: "Xullas muammo, katta muammo!");
    }
  }

  Future<List<dynamic>> fetchOnboardingPages() async {
    var response = await dio.get("/onboarding/list");
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("Failed to load onboarding pages");
    }
  }

  Future<List<dynamic>> fetchWelcomePageCategories() async {
    var response = await dio.get('/categories/list?Limit=6');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("Welcome page uchun kategoriyalarni olib kelib bo'lmadi");
    }
  }
}
