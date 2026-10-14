# كيفية البناء على Klencod IDE

## مهم جداً

هذا المشروع **Android Native (Kotlin + Compose)**  
**ليس** مشروع Flutter.

---

## إذا ظهر خطأ Flutter في Klencod

الخطأ الذي رأيته:
```
Setup Flutter
flutter pub get
Expected to find project root...
```

يعني أن Klencod يحاول بناء المشروع كـ Flutter تلقائياً.

### الحل:

1. في إعدادات المشروع على **Klencod IDE**:
   - غيّر نوع المشروع من **Flutter** إلى **Android** أو **Native Android** أو **Gradle**
   - أو عطّل خطوة "Setup Flutter" إن وُجدت

2. استخدم ملف الـ Workflow الموجود:
   ```
   .github/workflows/android-build.yml
   ```
   هذا الملف يبني التطبيق بشكل صحيح باستخدام Gradle + Android SDK.

3. أو شغّل يدوياً:
   ```bash
   chmod +x gradlew
   ./gradlew assembleDebug
   ```

---

## المخرجات

بعد البناء الناجح ستجد الـ APK في:
```
app/build/outputs/apk/debug/app-debug.apk
```

---

## متطلبات Firebase

- ملف `app/google-services.json` موجود مسبقاً (مشروعك chat-118ef)
- Authentication → Anonymous مفعّل
- Firestore مفعّل
- Storage اختياري (للصور والصوت)

