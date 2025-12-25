import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:google_sign_in/google_sign_in.dart';

class ApiService {
  // Deteksi platform otomatis untuk base URL
  static String getBaseUrl() {
    if (kIsWeb) {
      // Web: gunakan localhost
      return "http://localhost:3000/api";
    } else if (Platform.isAndroid) {
      // Android: Pakai IP komputer untuk HP fisik
      // Ganti IP ini dengan IP komputer Anda (lihat ipconfig)
      return "http://192.168.0.191:3000/api";
    } else {
      // iOS Simulator, Desktop: gunakan localhost
      return "http://localhost:3000/api";
    }
  }

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: getBaseUrl(),
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
          'Login gagal dengan status code ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print('DioException type: ${e.type}');
      print('DioException message: ${e.message}');
      print('DioException response: ${e.response}');

      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Koneksi timeout - Backend mungkin tidak jalan');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception(
          'Tidak dapat terhubung ke server. CORS error atau backend tidak accessible',
        );
      } else if (e.response != null) {
        throw Exception(
          'Login gagal: ${e.response?.data['message'] ?? e.message}',
        );
      } else {
        throw Exception('Error: ${e.message}');
      }
    } catch (e) {
      print('General error: $e');
      throw Exception('Login gagal: $e');
    }
  }

  // Method untuk register
  Future<Map<String, dynamic>> register(
    String namaLengkap,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      print('Register data: nama=$namaLengkap, email=$email');

      final response = await _dio.post(
        '/auth/register',
        data: {
          "nama_lengkap": namaLengkap,
          "email": email,
          "password": password,
          "confirm_password": confirmPassword,
        },
      );

      print('Register response status: ${response.statusCode}');
      print('Register response data: ${response.data}');
      print('Register response data type: ${response.data.runtimeType}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Pastikan response.data adalah Map
        if (response.data is Map<String, dynamic>) {
          return response.data;
        } else {
          // Jika bukan Map, wrap dalam Map
          return {
            'success': true,
            'message': 'Registrasi berhasil',
            'data': response.data,
          };
        }
      } else {
        throw Exception(
          'Register gagal dengan status code ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print('Register DioException type: ${e.type}');
      print('Register DioException message: ${e.message}');
      print('Register DioException response: ${e.response}');
      print('Register DioException response data: ${e.response?.data}');

      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Koneksi timeout - Backend mungkin tidak jalan');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception('Tidak dapat terhubung ke server');
      } else if (e.response != null) {
        // Parse error message dari backend
        String errorMessage = 'Register gagal';
        if (e.response?.data != null) {
          if (e.response?.data is Map && e.response?.data['message'] != null) {
            errorMessage = e.response?.data['message'];
          } else if (e.response?.data is String) {
            errorMessage = e.response?.data;
          }
        }
        throw Exception(
          'Register gagal: $errorMessage. Periksa apakah email sudah terdaftar atau database backend bermasalah.',
        );
      } else {
        throw Exception('Error: ${e.message}');
      }
    } catch (e) {
      print('Register general error: $e');
      throw Exception('Register gagal: $e');
    }
  }

  // Method untuk mendapatkan daftar favorit/simpan user
  Future<List<dynamic>> getFavorites(int userId, String? token) async {
    try {
      // Set Authorization header jika ada token
      if (token != null && token.isNotEmpty) {
        _dio.options.headers['Authorization'] = 'Bearer $token';
      }

      final response = await _dio.get('/masakYuk/simpan/$userId');

      if (response.statusCode == 200) {
        return response.data['data'] ?? [];
      } else {
        throw Exception('Gagal mengambil favorit');
      }
    } catch (e) {
      print('Get favorites error: $e');
      throw Exception('Gagal mengambil favorit: $e');
    }
  }

  // Method untuk menambah favorit/simpan
  Future<Map<String, dynamic>> addFavorite(
    int userId,
    int resepId,
    String? token,
  ) async {
    try {
      // Set Authorization header jika ada token
      if (token != null && token.isNotEmpty) {
        _dio.options.headers['Authorization'] = 'Bearer $token';
      }

      final response = await _dio.post(
        '/masakYuk/simpan',
        data: {"id_user": userId, "id_resep": resepId},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Gagal menambah favorit');
      }
    } catch (e) {
      print('Add favorite error: $e');
      throw Exception('Gagal menambah favorit: $e');
    }
  }

  // Method untuk menghapus favorit/simpan
  Future<Map<String, dynamic>> removeFavorite(
    int idSimpan,
    String? token,
  ) async {
    try {
      // Set Authorization header jika ada token
      if (token != null && token.isNotEmpty) {
        _dio.options.headers['Authorization'] = 'Bearer $token';
      }

      final response = await _dio.delete('/masakYuk/simpan/$idSimpan');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Gagal menghapus favorit');
      }
    } catch (e) {
      print('Remove favorite error: $e');
      throw Exception('Gagal menghapus favorit: $e');
    }
  }

  // ========== RESEP API ==========

  // Method untuk mendapatkan list resep dari backend
  Future<Map<String, dynamic>> getResepList({
    int limit = 10,
    int offset = 0,
    String? token,
  }) async {
    try {
      final options = Options();
      if (token != null && token.isNotEmpty) {
        options.headers = {'Authorization': 'Bearer $token'};
      }

      final response = await _dio.get(
        '/masakYuk/resep',
        queryParameters: {'limit': limit, 'offset': offset},
        options: options,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Gagal mengambil data resep');
      }
    } catch (e) {
      print('Get resep list error: $e');
      throw Exception('Gagal mengambil data resep: $e');
    }
  }

  // ========== GOOGLE SIGN IN ==========

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    // serverClientId: Web Client ID untuk mendapatkan idToken yang bisa diverifikasi backend
    serverClientId:
        '576275898436-d4vu41fuiffvnrthqgthc1m6fpau8k0k.apps.googleusercontent.com',
  );

  Future<Map<String, dynamic>?> signInWithGoogle() async {
    try {
      print('🔐 Memulai Google Sign In...');

      // Sign out dulu untuk paksa tampilkan account picker
      await _googleSignIn.signOut();

      // 1. Trigger Google Sign In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print('❌ User membatalkan sign in');
        return null; // User cancelled
      }

      print('✅ User dipilih: ${googleUser.email}');

      // 2. Get authentication details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // 3. Get the ID token
      final String? idToken = googleAuth.idToken;

      if (idToken == null) {
        print('❌ Gagal mendapatkan ID token dari Google');
        throw Exception(
          'Failed to get ID token. Pastikan SHA-1 sudah dikonfigurasi di Google Cloud Console',
        );
      }

      print('✅ ID Token berhasil didapat');
      print('🔑 Token (50 char): ${idToken.substring(0, 50)}...');

      // 4. Send token to backend
      print('📤 Mengirim token ke backend: ${getBaseUrl()}/auth/google');

      final response = await _dio.post(
        '/auth/google',
        data: {'token': idToken},
      );

      if (response.statusCode == 200) {
        print('✅ Google login berhasil!');
        print('📦 Response: ${response.data}');
        return response.data;
      } else {
        print('❌ Backend error: status ${response.statusCode}');
        throw Exception('Google login failed: ${response.data}');
      }
    } on DioException catch (e) {
      print('❌ DioException in Google Sign In');
      print('   Type: ${e.type}');
      print('   Message: ${e.message}');
      print('   Response data: ${e.response?.data}');
      print('   Status code: ${e.response?.statusCode}');

      String errorMsg = 'Google login error';
      if (e.response?.data != null && e.response?.data['message'] != null) {
        errorMsg = e.response?.data['message'];
      } else if (e.type == DioExceptionType.connectionError) {
        errorMsg =
            'Tidak dapat terhubung ke backend. Pastikan server berjalan di ${getBaseUrl()}';
      } else if (e.type == DioExceptionType.connectionTimeout) {
        errorMsg = 'Koneksi timeout. Pastikan backend berjalan';
      }

      throw Exception(errorMsg);
    } catch (error) {
      print('❌ Error signing in with Google: $error');

      // Berikan error message yang lebih spesifik
      if (error.toString().contains('PlatformException')) {
        if (error.toString().contains('sign_in_failed') ||
            error.toString().contains('SIGN_IN_FAILED')) {
          throw Exception(
            'Google Sign In gagal. Pastikan:\n'
            '1. SHA-1 fingerprint sudah dikonfigurasi di Google Cloud Console\n'
            '2. Package name di Google Console = com.example.masakyuk\n'
            '3. OAuth Client ID sudah dibuat untuk Android\n\n'
            'Error: $error',
          );
        } else if (error.toString().contains('network_error')) {
          throw Exception('Error jaringan. Periksa koneksi internet Anda');
        }
      }

      throw Exception('Google sign in failed: $error');
    }
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }

  // Logout lengkap: sign out dari Google dan clear semua data
  Future<void> logout() async {
    try {
      print('🚪 Logging out...');

      // 1. Sign out dari Google
      await _googleSignIn.signOut();
      await _googleSignIn
          .disconnect(); // Disconnect untuk force account picker next time

      print('✅ Logout berhasil');
    } catch (e) {
      print('❌ Error saat logout: $e');
      throw Exception('Logout failed: $e');
    }
  }
}
