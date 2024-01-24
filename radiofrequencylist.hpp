#ifndef RADIOFREQUENCYLIST_HPP
#define RADIOFREQUENCYLIST_HPP

#include <QObject>
#include <QList>

class RadioFrequencyList : public QObject{
    Q_OBJECT
    Q_PROPERTY(float currentPlayingFrequency READ getCurrentPlayingFrequency WRITE setCurrentPlayingFrequency NOTIFY currentPlayingFrequencyChanged)
    Q_PROPERTY(QString strCurrentPlayingFrequency READ getStrCurrentPlayingFrequency WRITE setStrCurrentPlayingFrequency NOTIFY strCurrentPlayingFrequencyChanged)
    Q_PROPERTY(bool favourite READ isFavourite WRITE setIsFavourite NOTIFY isFavouriteChanged)
 //   Q_PROPERTY(float currentFreqItem READ getcurrentFreqItem WRITE setCurrentFreqItem NOTIFY currentFreqItemChanged)

private:
    float currentPlayingFrequency;
    QString strCurrentPlayingFrequency;
    bool favourite;
    float currentFreqItem;


public:
    RadioFrequencyList();
    void loadFavouriteStatus();
    void saveFavouriteStatus();
    float getCurrentPlayingFrequency() const;
    void setCurrentPlayingFrequency(float value);

    QString getStrCurrentPlayingFrequency() const;
    void setStrCurrentPlayingFrequency(const QString &value);

    bool isFavourite();
    void setIsFavourite(bool value);

    float getCurrentFreqItem();
    void  setCurrentFreqItem(float value);

signals:
    void currentPlayingFrequencyChanged();
    void strCurrentPlayingFrequencyChanged();
    void isFavouriteChanged();


public slots:
    void onSeekDownClicked();
    void onSeekUpClicked();
    void onListItemClick(QString str);
    void onFavoriteButtonClicked();
};

#endif // RADIOFREQUENCYLIST_HPP

