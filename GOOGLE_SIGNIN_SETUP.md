# 🔐 Google Sign-In Setup untuk MasakYuk

## ✅ Status Implementasi

### Yang Sudah Selesai:
- ✅ Package `google_sign_in: ^6.2.1` sudah ditambahkan
- ✅ Method `signInWithGoogle()` di `api_services.dart`
- ✅ Handler `_loginWithGoogle()` di `login_page.dart`
- ✅ UI Button "Masuk dengan Google" sudah ada
- ✅ Integrasi dengan backend endpoint `/api/auth/google`
- ✅ Save JWT token & user data ke SharedPreferences

### Yang Perlu Dikonfigurasi:

## 📱 Konfigurasi Android

### 1. Dapatkan SHA-1 Fingerprint

Jalankan command ini di terminal (dari root project):

```powershell
cd android
./gradlew signingReport
```

**Atau** untuk Windows PowerShell:

```powershell
cd android
.\gradlew.bat signingReport
```

Cari output yang mirip seperti ini (biasanya di bagian **Variant: debug**):

```
Variant: debug
Config: debug
Store: C:\Users\YourName\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AA:BB:CC:...
SHA1: A1:B2:C3:D4:E5:F6:... ← COPY INI
SHA-256: ...
```

**COPY** nilai **SHA1** tersebut (contoh: `A1:B2:C3:D4:E5:F6:...`)

---

### 2. Setup Google Cloud Console

1. **Buka** [Google Cloud Console](https://console.cloud.google.com/)
2. **Pilih/Buat Project** bernama "MasakYuk" (atau nama project backend Anda)
3. **Navigasi ke**: APIs & Services → Credentials
4. **Klik**: "+ CREATE CREDENTIALS" → "OAuth client ID"
5. Jika diminta, configure OAuth consent screen:
   - User Type: **External**
   - App name: **MasakYuk**
   - User support email: **email Anda**
   - Developer contact: **email Anda**
   - Save and Continue (skip scopes)
   - Add test users jika perlu
   - Save

6. **Buat OAuth Client ID untuk Android**:
   - Application type: **Android**
   - Name: **MasakYuk Android**
   - Package name: `com.example.masakyuk` (sesuai `android/app/build.gradle.kts`)
   - SHA-1 certificate fingerprint: **Paste SHA-1 dari step 1**
   - **CREATE**

7. **[OPTIONAL] Buat juga untuk Web** (jika mau test di Chrome):
   - Application type: **Web application**
   - Name: **MasakYuk Web**
   - Authorized JavaScript origins:
     - `http://localhost`
     - `http://localhost:8080`
   - **CREATE**

---

### 3. Update `api_services.dart` dengan Client ID (OPTIONAL)

Jika Google Sign-In meminta Client ID secara eksplisit, update kode:

```dart
final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ['email', 'profile'],
  clientId: '407408718192.apps.googleusercontent.com', // ← Tambahkan ini
);
```

**CATATAN**: Untuk Android, biasanya tidak perlu menambahkan `clientId` karena akan otomatis detect dari `google-services.json`. Tapi untuk Web WAJIB ditambahkan.

---

### 4. Download `google-services.json` (OPTIONAL tapi RECOMMENDED)

Jika backend Anda juga menggunakan Firebase:

1. **Buka** [Firebase Console](https://console.firebase.google.com/)
2. **Buat/Pilih Project** "MasakYuk"
3. **Tambahkan Android App**:
   - Package name: `com.example.masakyuk`
   - App nickname: MasakYuk
   - SHA-1: Paste SHA-1 dari step 1
4. **Download** file `google-services.json`
5. **Simpan** file tersebut ke: `android/app/google-services.json`

6. **Update** `android/build.gradle.kts`:

```kotlin
dependencies {
    classpath("com.android.tools.build:gradle:8.1.0")
    classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.8.0")
    classpath("com.google.gms:google-services:4.4.0") // ← TAMBAHKAN INI
}
```

7. **Update** `android/app/build.gradle.kts` (di paling atas):

```kotlin
plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // ← TAMBAHKAN INI
}
```

---

## 🚀 Testing

### 1. Clean & Build

```powershell
flutter clean
flutter pub get
flutter run
```

### 2. Test Login dengan Google

1. **Klik** tombol "Masuk dengan Google" di halaman login
2. **Pilih** akun Google Anda
3. **Allow** permissions
4. Jika berhasil, akan redirect ke MainPage

### 3. Check Console Logs

Di VS Code Debug Console, perhatikan:

```
Google ID Token: eyJhbGc... ← ID Token yang dikirim ke backend
Google login response: {success: true, token: ..., user: ...} ← Response dari backend
Token: jwt_token_here ← JWT token disimpan
User: {id_user: 123, name: ..., email: ...} ← User data
```

---

## 🐛 Troubleshooting

### Error: `PlatformException(sign_in_failed)`

**Penyebab**: SHA-1 fingerprint tidak cocok atau belum dikonfigurasi di Google Cloud Console

**Solusi**:
1. Pastikan SHA-1 di Google Cloud Console sama dengan hasil `gradlew signingReport`
2. Tunggu 5-10 menit setelah update SHA-1 (propagation time)
3. Uninstall app dari emulator dan install ulang

---

### Error: `ApiException: 10`

**Penyebab**: Package name tidak cocok

**Solusi**:
- Pastikan package name di Google Cloud Console = `com.example.masakyuk`
- Cek di `android/app/build.gradle.kts` → `applicationId`

---

### Error: `DEVELOPER_ERROR`

**Penyebab**: Client ID atau OAuth consent screen belum selesai

**Solusi**:
1. Pastikan OAuth consent screen sudah dikonfigurasi
2. Tambahkan email Anda sebagai test user
3. Pastikan app tidak dalam "Testing" mode (atau tambahkan test users)

---

### Error: Backend tidak menerima token

**Penyebab**: Backend endpoint salah atau CORS issue

**Solusi**:
1. Pastikan backend running di `http://localhost:3000` (atau IP yang benar)
2. Test endpoint manual dengan Postman:
   ```
   POST http://10.0.2.2:3000/api/auth/google
   Content-Type: application/json
   
   {
     "token": "ID_TOKEN_DARI_GOOGLE"
   }
   ```
3. Cek CORS di backend (`app.js` atau `server.js`):
   ```javascript
   app.use(cors({
     origin: true, // Allow all origins for development
     credentials: true
   }));
   ```

---

### Test di Device Fisik

Jika test di **device fisik** (bukan emulator):

1. **Cari IP komputer Anda**:
   ```powershell
   ipconfig
   ```
   Cari `IPv4 Address` (contoh: `192.168.1.10`)

2. **Update `api_services.dart`** (sementara):
   ```dart
   static String getBaseUrl() {
     if (kIsWeb) {
       return "http://localhost:3000/api";
     } else if (Platform.isAndroid) {
       return "http://192.168.1.10:3000/api"; // ← Ganti dengan IP Anda
     } else {
       return "http://localhost:3000/api";
     }
   }
   ```

3. **Pastikan firewall** tidak memblok port 3000

4. **Test backend** dari browser HP: `http://192.168.1.10:3000/api`

---

## 📝 Info Penting

### Backend Endpoint

```
POST http://10.0.2.2:3000/api/auth/google (Android Emulator)
POST http://localhost:3000/api/auth/google (Web/iOS Simulator)
POST http://192.168.x.x:3000/api/auth/google (Physical Device)
```

### Request Body

```json
{
  "token": "GOOGLE_ID_TOKEN"
}
```

### Expected Response

```json
{
  "success": true,
  "message": "Google login successful",
  "token": "JWT_TOKEN_HERE",
  "user": {
    "id_user": 123,
    "name": "User Name",
    "email": "user@email.com"
  }
}
```

### Data yang Disimpan di SharedPreferences

```dart
prefs.setString('token', response['token']);       // JWT token untuk API calls
prefs.setInt('id_user', response['user']['id_user']); // User ID
prefs.setString('email', response['user']['email']);  // Email
prefs.setString('name', response['user']['name']);    // Nama lengkap
```

---

## ✅ Checklist Setup

- [ ] SHA-1 fingerprint sudah didapat (`gradlew signingReport`)
- [ ] OAuth client ID Android sudah dibuat di Google Cloud Console
- [ ] SHA-1 sudah ditambahkan ke Google Cloud Console
- [ ] Package name cocok: `com.example.masakyuk`
- [ ] OAuth consent screen sudah dikonfigurasi
- [ ] Test user sudah ditambahkan (jika app masih Testing mode)
- [ ] `flutter pub get` sudah dijalankan
- [ ] Backend running dan endpoint `/api/auth/google` siap
- [ ] CORS di backend sudah dikonfigurasi
- [ ] Test login Google di app berhasil
- [ ] Token dan user data tersimpan di SharedPreferences

---

## 🎉 Next Steps

Setelah Google Sign-In berhasil:

1. ✅ User bisa login dengan Google
2. ✅ JWT token disimpan untuk API calls lain
3. ✅ User data (id_user, email, name) tersimpan
4. ✅ Bisa langsung pakai fitur favorit/simpan resep

Selamat mencoba! 🚀
