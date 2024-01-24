#include "radiofrequencylist.hpp"
#include "radiofavourite.h"
#include <QSettings>

void RadioFrequencyList::loadFavouriteStatus(){
    QSettings settings;
    settings.beginGroup("FavouriteSettings");
    favourite = settings.value("isFavourite" , false).toBool();
    settings.endGroup();
    emit isFavouriteChanged();
}

void RadioFrequencyList::saveFavouriteStatus(){
    QSettings settings;
    settings.beginGroup("Favourite Settings");
    settings.setValue("isFavourite" , favourite);
    settings.endGroup();
}

FavouriteModel::FavouriteModel(QObject *parent):QAbstractListModel(parent){

}

int FavouriteModel::rowCount(const QModelIndex &parent) const
{
    if(parent.isValid())
        return 0;

    return m_freq.size();
}

QVariant FavouriteModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid())
        return QVariant();

    const FavModel &fav = m_freq[index.row()];

    switch (role) {
    case NameRole:
        return fav.FreqType;
        //break;
    case IsCheckedRole:
        return fav.isChecked;
        //break;
    case IsFavRole:
        return fav.isFav;
    default:
        return QVariant();
        //break;
    }
}
QHash<int,QByteArray> FavouriteModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "FreqType";
    roles[IsCheckedRole] = "isChecked";
    roles[IsFavRole] = "isFav";
    return roles;
}

void FavouriteModel::addFreq(QString name, bool isChecked, bool isFav)
{
    FavModel fav;
    fav.FreqType = name;
    fav.isChecked = isChecked;
    fav.isFav = isFav;

    beginInsertRows(QModelIndex() , rowCount() , rowCount());
    m_freq.append(fav);
    endInsertRows();
}

void FavouriteModel::onFavouriteButtonClicked(QString name, bool currentState)
{
    bool isNameFoundInList = false;
    for (FavModel &fav : m_freq) {
        if (fav.FreqType == name) {
            isNameFoundInList = true;
            fav.isFav = !currentState;
        }
    }

    if(isNameFoundInList != true)
        addFreq(name, false, !currentState);
}

bool FavouriteModel::isCurrentPlayingFreqIsFav(QString name)
{
    for (FavModel &fav : m_freq) {
        if (fav.FreqType == name) {
            if(fav.isFav)
                return true;
        }
    }
    return false;
}
