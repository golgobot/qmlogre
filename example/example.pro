CONFIG += qt
CONFIG += warn_off
QT += qml quick
TEMPLATE = app
TARGET = qmlogre

LIBS +=

UI_DIR = ./.ui
OBJECTS_DIR = ./.obj
MOC_DIR = ./.moc
SOURCES += main.cpp \
    cameranodeobject.cpp \
    exampleapp.cpp \
    ogreitem.cpp \
    ogrenode.cpp \
    ogrecamerawrapper.cpp \
    ogreengine.cpp


HEADERS += cameranodeobject.h \
    exampleapp.h \
    ogreitem.h \
    ogrenode.h \
    ogrecamerawrapper.h \
    ogreengine.h

OTHER_FILES += \
    resources/example.qml


OGREDIR = $$OGRE_HOME
message(Using Ogre libraries in $$OGREDIR)
INCLUDEPATH += $$OGREDIR/include/OGRE

ARCH = $$ARCH
contains(ARCH, "ARM") {
    message(Building for ARM architecture)
    DEFINES += JIBO_GLES2
    INCLUDEPATH += $$OGREDIR/include/OGRE/RenderSystems/GLES2
}
contains(ARCH, "x86") {
    DEFINES += JIBO_GL
    INCLUDEPATH += $$OGREDIR/include/OGRE/RenderSystems/GL
}
#QMAKE_LFLAGS += -F$$OGREDIR/lib/release
LIBS += -L$$OGREDIR/lib \
        -lOgreMain

RESOURCES += resources/resources.qrc

# Copy all resources to build folder
Resources.path = $$OUT_PWD/resources
Resources.files = resources/*.zip

# Copy all config files to build folder
Config.path = $$OUT_PWD
Config.files = config/*

# make install
INSTALLS += Resources Config

DISTFILES += \
    plugins.cfg \
    resource.cfg
