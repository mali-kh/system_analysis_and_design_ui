// import 'package:flutter_secure_storage/flutter_secure_storage.dart' as SecureStorage;

// class StorageProvider {
//   static final SecureStorage.FlutterSecureStorage secureStorage = new SecureStorage.FlutterSecureStorage();

//   static Future<String?> getAccessToken() {
//     return secureStorage.read(key: 'accessToken');
//   }

//   static Future<String?> getRefreshToken() {
//     return secureStorage.read(key: 'refreshToken');
//   }

//   static Future<String?> getSessionId() {
//     return secureStorage.read(key: 'sessionId');
//   }

//   static Future<String?> getAvatarId() {
//     return secureStorage.read(key: 'avatarId');
//   }

//   static Future<void> writeAvatarId(String avatarId) async {
//     await secureStorage.write(key: 'avatarId', value: avatarId);
//   }

//   static Future<void> writeSessionId(String sessionId) async {
//     await secureStorage.write(key: 'sessionId', value: sessionId);
//   }

//   static Future<String?> readFinger() {
//     return secureStorage.read(key: 'finger');
//   }

//   static Future<void> deleteFinger() async {
//     await secureStorage.delete(key: 'finger');
//   }

//   static Future<void> writeFinger(String pin) async {
//     await secureStorage.write(key: 'finger', value: pin);
//   }

//   static Future<String?> readPin() {
//     return secureStorage.read(key: 'pin');
//   }

//   static Future<void> deletePin() async {
//     await secureStorage.delete(key: 'pin');
//   }

//   static Future<void> writePin(String pin) async {
//     await secureStorage.write(key: 'pin', value: pin);
//   }

//   // ///save accessToken and refreshToken
//   // static Future<void> saveTokens(RefreshTokenResponse token) async {
//   //   await secureStorage.write(key: 'accessToken', value: token.accessToken);
//   //   await secureStorage.write(key: 'refreshToken', value: token.refreshToken);
//   // }

//   ///delete accessToken and refreshToken
//   static Future<void> deleteTokens() async {
//     await secureStorage.delete(key: 'accessToken');
//     await secureStorage.delete(key: 'refreshToken');
//   }
// }
