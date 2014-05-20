TEMPLATE = app

QT += qml quick

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

ios {
  QMAKE_TARGET_BUNDLE_PREFIX = "net.vplay.plugins"
  TARGET = FacebookSample

  # Used to add a custom URL scheme
  QMAKE_INFO_PLIST = $$PWD/ios/FacebookSample-Info.plist

  LIBS += -F$$PWD/ios/FacebookSDK -framework FacebookSDK
}

android {
  LIBS += -lFacebookPlugin
}

# Default rules for deployment.
include(deployment.pri)

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += \
    android/AndroidManifest.xml
