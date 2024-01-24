#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "configurationdata.h"
#include "radiofrequencylist.hpp"
#include "radiofavourite.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);



    qmlRegisterType<ConfigurationData>("RadioManager" , 1 , 0 , "ConfigurationData");
    qmlRegisterType<RadioFrequencyList>("ClassRadioFrequencyList" , 1 , 0 ,"RadioFrequencyList");
    qmlRegisterType<FavouriteModel>("ClassFavoriteFreqList" , 1 , 0 , "FavouriteModel");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QQmlContext* rootContext = engine.rootContext();
    return app.exec();
}
