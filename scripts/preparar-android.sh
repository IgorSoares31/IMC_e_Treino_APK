#!/usr/bin/env bash
set -e
M=android/app/src/main/AndroidManifest.xml

# Permissões: GPS, serviço em primeiro plano (GPS com a tela apagada), notificação e vibração
sed -i 's#</manifest>#    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />\n    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />\n    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />\n    <uses-permission android:name="android.permission.FOREGROUND_SERVICE_LOCATION" />\n    <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />\n    <uses-permission android:name="android.permission.VIBRATE" />\n    <uses-feature android:name="android.hardware.location.gps" android:required="false" />\n</manifest>#' "$M"

# Ícone e textos da notificação "Corrida em andamento" (o ícone precisa ser simples, de uma cor só)
mkdir -p android/app/src/main/res/drawable
cat > android/app/src/main/res/drawable/ic_tracking.xml <<'XML'
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="24dp" android:height="24dp"
    android:viewportWidth="24" android:viewportHeight="24">
    <path android:fillColor="#FFFFFFFF"
        android:pathData="M12,2C12,2 5,10 5,15A7,7 0 0 0 19,15C19,10 12,2 12,2Z" />
</vector>
XML
S=android/app/src/main/res/values/strings.xml
sed -i 's|</resources>|    <string name="capacitor_background_geolocation_notification_icon">drawable/ic_tracking</string>\n    <string name="capacitor_background_geolocation_notification_channel_name">Gravação de corrida</string>\n    <string name="capacitor_background_geolocation_notification_color">#1f7a6d</string>\n</resources>|' "$S"

# Número da versão cresce a cada build, para o Android aceitar a atualização por cima
N="${GITHUB_RUN_NUMBER:-1}"
sed -i "s/versionCode 1\b/versionCode $N/; s/versionName \"1.0\"/versionName \"1.$N\"/" android/app/build.gradle
echo "Projeto Android preparado (versão $N)."
