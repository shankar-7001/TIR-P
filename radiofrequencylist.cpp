#include "radiofrequencylist.hpp"

#include <QDebug>


QString RadioFrequencyList::getStrCurrentPlayingFrequency() const
{
    return strCurrentPlayingFrequency;
}

void RadioFrequencyList::setStrCurrentPlayingFrequency(const QString &value)
{
    strCurrentPlayingFrequency = value;
}

RadioFrequencyList::RadioFrequencyList()
{
    currentPlayingFrequency = 98.3f;
    strCurrentPlayingFrequency = "FM " + QString::number(currentPlayingFrequency);
    qDebug() << strCurrentPlayingFrequency; 
    loadFavouriteStatus();
}


float RadioFrequencyList::getCurrentPlayingFrequency() const
{
    return currentPlayingFrequency;
}

void RadioFrequencyList::setCurrentPlayingFrequency(float value)
{
    currentPlayingFrequency = value;
    strCurrentPlayingFrequency = "FM " + QString::number(currentPlayingFrequency);
    emit strCurrentPlayingFrequencyChanged();
}

void RadioFrequencyList::onSeekDownClicked()
{
    if(85.0 < currentPlayingFrequency){
        currentPlayingFrequency = currentPlayingFrequency - 0.1f;
        strCurrentPlayingFrequency = "FM " + QString::number(currentPlayingFrequency);
        qDebug() << strCurrentPlayingFrequency;
        emit strCurrentPlayingFrequencyChanged();
    }
    if(currentPlayingFrequency <= 85.0f){
        currentPlayingFrequency = 105.1f;
    }
    else{
        qDebug() << "85 < Frequency";
    }
}

void RadioFrequencyList::onSeekUpClicked()
{
    if(currentPlayingFrequency < 105.1){
        currentPlayingFrequency = currentPlayingFrequency + 0.1f;
        strCurrentPlayingFrequency = "FM " + QString::number(currentPlayingFrequency);
        qDebug() << strCurrentPlayingFrequency;
        emit strCurrentPlayingFrequencyChanged();
    }
    if(currentPlayingFrequency > 105.1){
        currentPlayingFrequency = 85.0;
    }
    else{
        qDebug() << "currentPlayingFrequency < 105";
    }
}

void RadioFrequencyList::onListItemClick(QString str)
{
    QString numericPart = str.mid(3); // Assuming "FM " is always at the beginning

        // Convert the numeric part to a float
    bool conversionOk;
    float floatValue = numericPart.toFloat(&conversionOk);
    if(conversionOk){
        setCurrentPlayingFrequency(floatValue);
    }
}

bool RadioFrequencyList::isFavourite(){
    return favourite;
}

void RadioFrequencyList::setIsFavourite(bool value){
    if(favourite != value){
        favourite = value;
        saveFavouriteStatus();
        emit isFavouriteChanged();
    }
}

void RadioFrequencyList::onFavoriteButtonClicked(){
    setIsFavourite(!favourite);
    qDebug() << "Favourite Button Clicked";
}
