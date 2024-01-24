#include "configurationdata.h"
#include "configurationdatabase.h"

ConfigurationData::ConfigurationData() :
    _statusBarHeight(STATUS_BAR_HEIGHT),
    _screenHeight(APPLICATION_AREA_HEIGHT),
    _screenWidth(APPLICATION_AREA_WIDTH)
{
    _applicationAreaHeight = _screenHeight - _statusBarHeight;
}

int ConfigurationData::statusBarHeight() const {
    return _statusBarHeight;
}

int ConfigurationData::applicationAreaHeight() const {
    return _applicationAreaHeight;
}

int ConfigurationData::screenHeight() const {
    return _screenHeight;
}

int ConfigurationData::screenWidth() const {
    return _screenWidth;
}

