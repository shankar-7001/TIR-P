#ifndef CONFIGURATIONDATA_H
#define CONFIGURATIONDATA_H

#include<QQuickItem>

class ConfigurationData: public QQuickItem
    {
    Q_OBJECT
    Q_PROPERTY(int statusBarHeight READ statusBarHeight NOTIFY statusBarHeightChanged)
    Q_PROPERTY(int applicationAreaHeight READ applicationAreaHeight NOTIFY applicationAreaHeightChanged)
    Q_PROPERTY(int screenHeight READ screenHeight NOTIFY screenHeightChanged)
    Q_PROPERTY(int screenWidth READ screenWidth NOTIFY screenWidthChanged)

public:
    ConfigurationData();

    int statusBarHeight() const;
    int applicationAreaHeight() const;
    int screenHeight() const;
    int screenWidth() const;

signals:
    void statusBarHeightChanged();
    void applicationAreaHeightChanged();
    void screenHeightChanged();
    void screenWidthChanged();

private:
    int _statusBarHeight;
    int _applicationAreaHeight;
    int _screenHeight;
    int _screenWidth;
};

#endif // CONFIGURATIONDATA_H
