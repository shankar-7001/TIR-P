#ifndef RADIOFAVOURITE_H
#define RADIOFAVOURITE_H
#include "radiofrequencylist.hpp"
#include <QObject>
#include <QAbstractListModel>
#include <QString>

class FavouriteModel: public QAbstractListModel{
    Q_OBJECT

public:
    enum ItemRoles{
        NameRole = Qt::UserRole + 1,
        IsCheckedRole,
        IsFavRole,
    };

    struct FavModel{
        QString FreqType = "FreqName";
        bool isChecked = false;
        bool isFav=false;
    };

    explicit FavouriteModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    //rowCount - function returns the number of rows
    //const QModelIndex &parent - It is a ref to QModelIndex object which represents the parent item. This function is expected to return number of rows under this parent index.
    //const override - qualifier indicates that this function does not modify the object it is called on. The override specifier is used to explicitly declare that this function
    //                 is intended to override a virtual function in a base class

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    //QVariant data - This function returns a QVariant object, which can hold a value of any type that can be represented in Qt
    //const QModelIndex &index - This parameter is a reference to a QModelIndex object, representing the index of the item for which you want to retrieve the data
    //int role - Parameter specifies type of data retrieved.
    //Qt::DisplayRole - commonly used for displaying data

    QHash<int, QByteArray> roleNames() const override;
    //QHash<int, QByteArray> roleNames()- This function returns a QHash object that maps integer values (representing roles) to QByteArray objects

    void addFreq(QString name, bool isChecked, bool isFav);

private:
    QList<FavModel>m_freq;

public slots:
    void onFavouriteButtonClicked(QString name, bool currentState);
    bool isCurrentPlayingFreqIsFav(QString name);

};

#endif // RADIOFAVOURITE_H
