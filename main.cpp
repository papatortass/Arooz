#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <time.h>
#include <QQmlEngine>
#include <QCoreApplication>




int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);


    QCoreApplication::addLibraryPath(QCoreApplication::applicationDirPath() + "/plugins");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/Arroz/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
