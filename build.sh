#!/data/data/com.termux/files/usr/bin/bash

APPNAME="MyApp"
PACKAGE="com.example.myapp"
WEBURL="https://example.com"

pkg update -y
pkg install nodejs openjdk-17 git unzip -y

npm install -g cordova

cordova create app $PACKAGE $APPNAME

cd app

cordova platform add android

cat > www/index.html << EOF
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>$APPNAME</title>
<style>
body{
margin:0;
padding:0;
}
iframe{
width:100%;
height:100vh;
border:none;
}
</style>
</head>
<body>
<iframe src="$WEBURL"></iframe>
</body>
</html>
EOF

cordova build android

echo "APK selesai dibuat"
echo "Lokasi APK:"
echo "platforms/android/app/build/outputs/apk/debug/"
