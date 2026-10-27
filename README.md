# Gavxar Clinic - Bemor Ilovasi

Production-oriented Flutter app for patients of Gavxar Clinic.

## Features
- Login / Register
- Home with quick actions & profile
- Doctors list (from API)
- Book appointment (sends to backend)
- My appointments
- Profile
- Smooth iOS-like UI & animations

## Run locally
```bash
flutter pub get
flutter run
```

## GitHub Actions Build
Workflow is configured. Push to `main` or manually trigger to build release APK.

**For signed production builds:**
1. Create Android keystore
2. Add these secrets in GitHub repo Settings → Secrets:
   - KEYSTORE_BASE64
   - KEYSTORE_PASSWORD
   - KEY_ALIAS
   - KEY_PASSWORD
3. Update the workflow to use them (I can help with that).

Clinic: Gavxar Clinic
