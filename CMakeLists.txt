cmake_minimum_required(VERSION 3.16)

project(Arroz VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

add_compile_definitions(WEBENGINE_CONFIG=use_proprietary_codecs)

set(CHROMIUM_FLAGS "--widevine-path=\"/Applications/Google\ Chrome.app/Contents/Frameworks/Google\ Chrome\ Framework.framework/Versions/118.0.5993.70/Libraries/WidevineCdm/_platform_specific/mac_arm64/libwidevinecdm.dylib\"")

add_definitions(-DCHROMIUM_FLAGS="${CHROMIUM_FLAGS}")

qt_standard_project_setup()

qt_add_executable(appArroz
    main.cpp
)

qt_add_qml_module(appArroz
    URI Arroz
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES
    QML_FILES ui/leftBar/LeftBar.qml
    QML_FILES ui/WindowContent/WindowContent.qml
    QML_FILES
    QML_FILES
    QML_FILES
    QML_FILES
    QML_FILES ui/WindowContent/Apps/SettingsApp/SettingsApp.qml
    QML_FILES ui/WindowContent/Apps/MusicApp/MusicApp.qml
    RESOURCES ui/WindowContent/Apps/SettingsApp/Icons/wifi.png
    RESOURCES ui/WindowContent/Apps/SettingsApp/Icons/bluetooth.png
    RESOURCES ui/leftBar/Icons/menu.png
    QML_FILES ui/WindowContent/Apps/SettingsApp/CustomSwitch.qml
    RESOURCES ui/WindowContent/Apps/SettingsApp/Icons/display.svg ui/WindowContent/Apps/SettingsApp/Icons/lights.svg ui/WindowContent/Apps/SettingsApp/Icons/quickcontrols.svg
    QML_FILES ui/WindowContent/Apps/SettingsApp/ContentPages/ConnectionsContent.qml
    QML_FILES ui/WindowContent/Apps/SettingsApp/ContentPages/SoftwareContent.qml
    RESOURCES ui/leftBar/Icons/menuopen.png
    RESOURCES ui/WindowContent/Apps/SettingsApp/Icons/bluetooth.svg
    RESOURCES ui/WindowContent/Apps/SettingsApp/Icons/quickcontrols.svg
    RESOURCES ui/WindowContent/Apps/SettingsApp/Icons/software.svg
    RESOURCES ui/WindowContent/Apps/SettingsApp/Icons/Logo.png
    RESOURCES ui/WindowContent/Apps/SettingsApp/Icons/bitcoin.png
    RESOURCES ui/WindowContent/Apps/SettingsApp/Icons/ethereum.png
    RESOURCES ui/WindowContent/Apps/SettingsApp/Icons/bitcoincash.png ui/WindowContent/Apps/SettingsApp/Icons/ethereum.png ui/WindowContent/Apps/SettingsApp/Icons/monero.png
    RESOURCES ui/WindowContent/Apps/SettingsApp/Icons/topography.png
    QML_FILES
    QML_FILES
    RESOURCES ui/WindowContent/Wallpapers/wallpapergrey.webp
    RESOURCES ui/assets/music.svg
    RESOURCES ui/WindowContent/Apps/MusicApp/Icons/spotify_circle.svg
    RESOURCES ui/WindowContent/Apps/MusicApp/Icons/spotify.svg
    RESOURCES
    RESOURCES ui/WindowContent/Apps/MusicApp/Icons/tidal-circle.png ui/WindowContent/Apps/MusicApp/Icons/tidal.png
    RESOURCES ui/WindowContent/Apps/MusicApp/Icons/tunein.svg
    RESOURCES ui/WindowContent/Apps/MusicApp/Icons/applemusic.svg
    QML_FILES ui/WindowContent/Apps/Maps/Maps.qml
    QML_FILES ui/WindowContent/Apps/Maps/FeaturePermissionBar.qml
    QML_FILES ui/WindowContent/Apps/MusicApp/FeaturePermissionBar.qml
    QML_FILES ui/WindowContent/OneAppLayout.qml
    QML_FILES ui/WindowContent/TwoAppsLayout.qml
    QML_FILES ui/WindowContent/ThreeAppsLayout.qml
    QML_FILES ui/WindowContent/Apps/DiagnosticsApp/DiagnosticsApp.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appArroz PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appArroz
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appArroz
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appArroz
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
