#-------------------------------------------------
#
# Project created by QtCreator 2018-09-11T16:33:13
#
#-------------------------------------------------

QT		 += core gui widgets opengl multimedia

TARGET = ISFEditor
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000	 # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++14

VERSION = 2.9.7.3




# let's try a precompiled header to reduce compilation time
PRECOMPILED_HEADER = $$_PRO_FILE_PWD_/precompiled.pch
CONFIG += precompile_header

# theoretically, this should enable some degree of multiprocessing in MSVC, but i need to test it...
*msvc* {
	QMAKE_CXXFLAGS += -MP
}




# these libs require a VVGL_SDK define
DEFINES += VVGL_SDK_QT




SOURCES += \
	../../common/GLBufferQVideoSurface.cpp \
	../../common/GLBufferQWidget.cpp \
	../../common/ISFGLBufferQWidget.cpp \
	DocWindow.cpp \
	ISFController.cpp \
	JSONGUI/JGMCArray.cpp \
	JSONGUI/JGMObject.cpp \
	JSONGUI/JGMTop.cpp \
	JSONGUI/JSONGUIBasicInfoWidget.cpp \
	JSONGUI/JSONGUIGroupInputWidget.cpp \
	JSONGUI/JSONGUIGroupPassWidget.cpp \
	JSONGUI/JSONGUIInputAudioFFTWidget.cpp \
	JSONGUI/JSONGUIInputAudioWidget.cpp \
	JSONGUI/JSONGUIInputBoolWidget.cpp \
	JSONGUI/JSONGUIInputColorWidget.cpp \
	JSONGUI/JSONGUIInputEventWidget.cpp \
	JSONGUI/JSONGUIInputFloatWidget.cpp \
	JSONGUI/JSONGUIInputImageWidget.cpp \
	JSONGUI/JSONGUIInputLongWidget.cpp \
	JSONGUI/JSONGUIInputPoint2DWidget.cpp \
	JSONGUI/JSONGUIPassWidget.cpp \
	JSONScrollWidget.cpp \
	LoadingWindow.cpp \
	main.cpp \
	MainWindow.cpp \
	misc_classes/MediaFile.cpp \
	misc_classes/VideoSourceMenuItem.cpp \
	misc_ui/ISFUIItem.cpp \
	misc_ui/SimpleSourceCodeEditor/SimpleSourceCodeEditor.cpp \
	misc_ui/SimpleSourceCodeEditor/FindDialog.cpp \
	misc_ui/SimpleSourceCodeEditor/FindOpts.cpp \
	misc_ui/SimpleSourceCodeEditor/Highlighter.cpp \
	misc_ui/SimpleSourceCodeEditor/LineNumberArea.cpp \
	OutputWindow.cpp \
	VideoSource/DynamicVideoSource.cpp \
	VideoSource/ImgVideoSource.cpp \
	VideoSource/InterAppVideoSource.cpp \
	VideoSource/MovieVideoSource.cpp \
	VideoSource/VideoSource.cpp \
	VideoSource/WebCamVideoSource.cpp \
	misc_classes/LevenshteinCalc.cpp \
	misc_classes/RemoteImageClient.cpp \
	misc_classes/RemoteImageClient_Mac.cpp \
	misc_ui/ISFFileListView.cpp \
	misc_classes/LoadingWindowFileListModel.cpp \
	JSONGUI/JSONGUIInputWidget.cpp \
	JSONGUI/JSONScrollEventFilter.cpp \
	AudioController.cpp \
	Audio/ISFAudioBufferList.cpp \
	VideoOutput/InterAppOutput.cpp \
	VideoOutput/VideoOutput.cpp \
    ISFConverter/GLSLSandboxConverter.cpp \
    ISFConverter/ShadertoyConverter.cpp \
	misc_classes/StringUtilities.cpp \
	VideoSource/ISFVideoSource.cpp \
    ../../common/VVGLRenderQThread.cpp \
    misc_ui/QPassiveWheelComboBox.cpp \
    AutoUpdater/AutoUpdater.cpp


HEADERS += \
	../../common/GLBufferQVideoSurface.h \
	../../common/GLBufferQWidget.h \
	../../common/ISFGLBufferQWidget.h \
	DocWindow.h \
	ISFController.h \
	JSONGUI/JGMCArray.h \
	JSONGUI/JGMDefs.h \
	JSONGUI/JGMObject.h \
	JSONGUI/JGMTop.h \
	JSONGUI/JSONGUIBasicInfoWidget.h \
	JSONGUI/JSONGUIGroupInputWidget.h \
	JSONGUI/JSONGUIGroupPassWidget.h \
	JSONGUI/JSONGUIInputAudioFFTWidget.h \
	JSONGUI/JSONGUIInputAudioWidget.h \
	JSONGUI/JSONGUIInputBoolWidget.h \
	JSONGUI/JSONGUIInputColorWidget.h \
	JSONGUI/JSONGUIInputEventWidget.h \
	JSONGUI/JSONGUIInputFloatWidget.h \
	JSONGUI/JSONGUIInputImageWidget.h \
	JSONGUI/JSONGUIInputLongWidget.h \
	JSONGUI/JSONGUIInputPoint2DWidget.h \
	JSONGUI/JSONGUIPassWidget.h \
	JSONGUI/QLabelClickable.h \
	JSONScrollWidget.h \
	LoadingWindow.h \
	MainWindow.h \
	misc_classes/MediaFile.h \
	misc_classes/VideoSourceMenuItem.h \
	misc_ui/ISFUIItem.h \
	misc_ui/SimpleSourceCodeEditor/SimpleSourceCodeEditor.h \
	misc_ui/SimpleSourceCodeEditor/FindDialog.h \
	misc_ui/SimpleSourceCodeEditor/FindOpts.h \
	misc_ui/SimpleSourceCodeEditor/Highlighter.h \
	misc_ui/SimpleSourceCodeEditor/LineNumberArea.h \
	OutputWindow.h \
	misc_ui/QDoubleSlider.h \
	VideoSource/DynamicVideoSource.h \
	VideoSource/ImgVideoSource.h \
	VideoSource/InterAppVideoSource.h \
	VideoSource/MovieVideoSource.h \
	VideoSource/VideoSource.h \
	VideoSource/WebCamVideoSource.h \
	misc_classes/LevenshteinCalc.h \
	misc_classes/RemoteImageClient.h \
	misc_classes/RemoteImageClient_Mac.h \
	misc_ui/ISFFileListView.h \
	misc_classes/LoadingWindowFileListModel.h \
	JSONGUI/JSONGUIInputWidget.h \
	JSONGUI/QLabelDrag.h \
	JSONGUI/JSONScrollEventFilter.h \
	AudioController.h \
	Audio/ISFAudioBufferList.h \
	VideoOutput/InterAppOutput.h \
	VideoOutput/VideoOutput.h \
    ISFConverter/GLSLSandboxConverter.h \
    ISFConverter/ShadertoyConverter.h \
    misc_classes/StringUtilities.h \
	misc_ui/MouseEventISFWidget.h \
	VideoSource/ISFVideoSource.h \
    ../../common/VVGLRenderQThread.h \
    misc_ui/QPassiveWheelComboBox.h \
    AutoUpdater/AutoUpdater.h


# platform-specific classes
mac {
	SOURCES += ../../common/SyphonVVBufferPoolAdditions.mm \
		VideoSource/InterAppVideoSource_Mac.mm \
		VideoOutput/InterAppOutput_Mac.mm
	HEADERS += ../../common/SyphonVVBufferPoolAdditions.h \
		VideoSource/InterAppVideoSource_Mac.h \
		VideoOutput/InterAppOutput_Mac.h
}
win32	{
	SOURCES += VideoSource/InterAppVideoSource_Win.cpp \
		VideoOutput/InterAppOutput_Win.cpp \
		Spout/SpoutCopy.cpp \
		Spout/SpoutDirectX.cpp \
		Spout/SpoutGLDXinterop.cpp \
		Spout/SpoutGLextensions.cpp \
		Spout/SpoutMemoryShare.cpp \
		Spout/SpoutReceiver.cpp \
		Spout/SpoutSDK.cpp \
		Spout/SpoutSender.cpp \
		Spout/SpoutSenderNames.cpp \
		Spout/SpoutSharedMemory.cpp \
		VideoSource/SpoutSourcesWatcher.cpp
	HEADERS += VideoSource/InterAppVideoSource_Win.h \
		VideoOutput/InterAppOutput_Win.h \
		Spout/Spout.h \
		Spout/SpoutCommon.h \
		Spout/SpoutCopy.h \
		Spout/SpoutDirectX.h \
		Spout/SpoutGLDXinterop.h \
		Spout/SpoutGLextensions.h \
		Spout/SpoutMemoryShare.h \
		Spout/SpoutReceiver.h \
		Spout/SpoutSDK.h \
		Spout/SpoutSender.h \
		Spout/SpoutSenderNames.h \
		Spout/SpoutSharedMemory.h \
		VideoSource/SpoutSourcesWatcher.h
}


FORMS += \
		MainWindow.ui \
	LoadingWindow.ui \
	OutputWindow.ui \
	DocWindow.ui \
	misc_ui/SimpleSourceCodeEditor/FindDialog.ui \
	JSONGUI/JSONGUIGroupInputWidget.ui \
	JSONGUI/JSONGUIBasicInfoWidget.ui \
	JSONGUI/JSONGUIGroupPassWidget.ui \
	JSONGUI/JSONGUIInputAudioWidget.ui \
	JSONGUI/JSONGUIInputAudioFFTWidget.ui \
	JSONGUI/JSONGUIInputBoolWidget.ui \
	JSONGUI/JSONGUIInputColorWidget.ui \
	JSONGUI/JSONGUIInputEventWidget.ui \
	JSONGUI/JSONGUIInputFloatWidget.ui \
	JSONGUI/JSONGUIInputImageWidget.ui \
	JSONGUI/JSONGUIInputLongWidget.ui \
	JSONGUI/JSONGUIInputPoint2DWidget.ui \
	JSONGUI/JSONGUIPassWidget.ui \
    ISFConverter/GLSLSandboxConverter.ui \
    ISFConverter/ShadertoyConverter.ui

RESOURCES += \
	misc_ui/SimpleSourceCodeEditor/shaderLanguagefiles.qrc \
	resources.qrc \
    ISFConverter/shadertoy_textures/shadertoy_textures.qrc \
    src_ISFs/src_isfs.qrc




# additions for VVGL lib
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../../VVGL/release/ -lVVGL
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../../VVGL/debug/ -lVVGL
else:unix: LIBS += -L$$OUT_PWD/../../VVGL/ -lVVGL

# additions for VVISF lib
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../../VVISF/release/ -lVVISF
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../../VVISF/debug/ -lVVISF
else:unix: LIBS += -L$$OUT_PWD/../../VVISF/ -lVVISF

INCLUDEPATH += $$_PRO_FILE_PWD_/../../../../VVGL/include
INCLUDEPATH += $$_PRO_FILE_PWD_/../../../../VVISF/include
INCLUDEPATH += $$_PRO_FILE_PWD_/../../common
INCLUDEPATH += $$_PRO_FILE_PWD_/../../
INCLUDEPATH += $$_PRO_FILE_PWD_/VideoSource
#DEPENDPATH += $$PWD/../../VVGL
#DEPENDPATH += $$PWD/../../VVISF
INCLUDEPATH += $$_PRO_FILE_PWD_/Audio
INCLUDEPATH += $$_PRO_FILE_PWD_/JSONGUI
INCLUDEPATH += $$_PRO_FILE_PWD_/misc_classes
INCLUDEPATH += $$_PRO_FILE_PWD_/misc_ui
INCLUDEPATH += $$_PRO_FILE_PWD_/misc_ui/SimpleSourceCodeEditor
INCLUDEPATH += $$_PRO_FILE_PWD_/Syphon
INCLUDEPATH += $$_PRO_FILE_PWD_/Spout
INCLUDEPATH += $$_PRO_FILE_PWD_/VideoOutput
INCLUDEPATH += $$_PRO_FILE_PWD_/ISFConverter
INCLUDEPATH += $$_PRO_FILE_PWD_/AutoUpdater




# make sure the rpath includes both ways of getting libs
QMAKE_RPATHDIR = @executable_path/../Frameworks
QMAKE_RPATHDIR += @loader_path/../Frameworks




# additions for GLEW
#unix: LIBS += -L/usr/local/lib/ -lGLEW
#INCLUDEPATH += /usr/local/include
#DEPENDPATH += /usr/local/include
#unix: PRE_TARGETDEPS += /usr/local/lib/libGLEW.a
unix: LIBS += -L$$_PRO_FILE_PWD_/../../../../external/GLEW/mac_x86_64/ -lGLEW
win32: LIBS += -L$$_PRO_FILE_PWD_/../../../../external/GLEW/win_x64/ -lglew32 -lopengl32
INCLUDEPATH += $$_PRO_FILE_PWD_/../../../../external/GLEW/include
DEPENDPATH += $$_PRO_FILE_PWD_/../../../../external/GLEW/include
unix: PRE_TARGETDEPS += $$_PRO_FILE_PWD_/../../../../external/GLEW/mac_x86_64/libGLEW.dylib
win32: PRE_TARGETDEPS += $$_PRO_FILE_PWD_/../../../../external/GLEW/win_x64/glew32.dll




# mac-only additions for syphon
mac {
	LIBS += -framework Foundation -framework Cocoa -framework AppKit

	SYPHON_FRAMEWORK_PATH=$$_PRO_FILE_PWD_/Syphon
	QMAKE_CXXFLAGS += -F $$SYPHON_FRAMEWORK_PATH
	QMAKE_LFLAGS += -F $$SYPHON_FRAMEWORK_PATH
	LIBS += -framework Syphon
	#LIBS += -F$$SYPHON_FRAMEWORK_PATH
	LIBS += -L$$SYPHON_FRAMEWORK_PATH

	# syphon needs a CGLContextObj, which means we need to get an NSOpenGLContext from a QOpenGLContext, the headers for which are only accessible by manually including this path so the QtPlatformHeaders directory is picked up.
	INCLUDEPATH += $$QMAKESPEC/../../include/
	
	QMAKE_TARGET_BUNDLE_PREFIX = com.vidvox
	#QMAKE_DEVELOPMENT_TEAM = XXXX
	#QMAKE_PROVISIONING_PROFILE = XXXXX
}

# win-only additions for spout
win32	{
	LIBS += -luser32
	LIBS += -lGdi32
}




fftreal_dir = ../fftreal

INCLUDEPATH += $${fftreal_dir}

# Dynamic linkage against FFTReal DLL
mac {
	# Link to fftreal framework
	
	LIBS += -framework fftreal
	
	QMAKE_CXXFLAGS += -F $${fftreal_dir}
	QMAKE_LFLAGS += -F $${fftreal_dir}
	#LIBS += -F$${fftreal_dir}
	LIBS += -L$${fftreal_dir}
} else {
	#LIBS += -L..$${spectrum_build_dir}
	#LIBS += -lfftreal
	#LIBS += -L$$_PRO_FILE_PWD_/../../debug -lfftreal
}

# additions for fftreal lib
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../fftreal/release/ -lfftreal
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../fftreal/debug/ -lfftreal
#else:unix: LIBS += -L$$OUT_PWD/../../VVGL/ -lVVGL




# this logs every qmake var when qmake is run
#for(var, $$list($$enumerate_vars())) {
#	message($$var)
#	message($$eval($$var))
#}




# this enables ARC.	 it's commented out because ARC is a PITA to use with c++
#QMAKE_CXXFLAGS += -fobjc-arc




# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target




# macs need some assembly for deployment
mac {
	QMAKE_INFO_PLIST = Info.plist
	
	
	framework_dir = $$OUT_PWD/$$TARGET\.app/Contents/Frameworks
	
	CONFIG(debug, debug|release)	{
		# intentionally blank, debug builds don't need any work (build & run works just fine)
		
		
	}
	# release builds need to have the libs bundled up and macdeployqt executed on the output app package to relink them
	else	{
		QMAKE_POST_LINK += echo "****************************";
		QMAKE_POST_LINK += mkdir -pv $$framework_dir;
		QMAKE_POST_LINK += cp -vaRf $$_PRO_FILE_PWD_/../../../../external/GLEW/mac_x86_64/libGLEW*.dylib $$framework_dir;
		QMAKE_POST_LINK += cp -vaRf $$OUT_PWD/../../VVGL/libVVGL*.dylib $$framework_dir;
		QMAKE_POST_LINK += cp -vaRf $$OUT_PWD/../../VVISF/libVVISF*.dylib $$framework_dir;
		QMAKE_POST_LINK += cp -vaRf $$_PRO_FILE_PWD_/Syphon/Syphon.framework $$framework_dir;
		QMAKE_POST_LINK += cp -vaRf $$OUT_PWD/../fftreal/fftreal.framework $$framework_dir;
		
		#QMAKE_POST_LINK += codesign -f -s "KH97KZU7A7" "$$framework_dir/Syphon.framework";
		#QMAKE_POST_LINK += codesign -f -s "KH97KZU7A7" "$$framework_dir/fftreal.framework";
		#QMAKE_POST_LINK += codesign -f -s "KH97KZU7A7" "$$framework_dir/libVVGL.1.0.0.dylib";
		#QMAKE_POST_LINK += codesign -f -s "KH97KZU7A7" "$$framework_dir/libVVISF.1.0.0.dylib";
		
		#QMAKE_POST_LINK += macdeployqt $$OUT_PWD/$$TARGET\.app -codesign="KH97KZU7A7";
		QMAKE_POST_LINK += macdeployqt $$OUT_PWD/$$TARGET\.app;
		
		# copy the built app to the appropriate 'packages' directory in the ISFEditor_installer project directory
		QMAKE_POST_LINK += rm -Rf "$$_PRO_FILE_PWD_/../ISFEditor_installer/packages/com.vidvox.ISFEditor.mac/data/$$TARGET\.app";
		QMAKE_POST_LINK += mkdir -v "$$_PRO_FILE_PWD_/../ISFEditor_installer/packages/com.vidvox.ISFEditor.mac/data"
		QMAKE_POST_LINK += cp -vaRf "$$OUT_PWD/$$TARGET\.app" "$$_PRO_FILE_PWD_/../ISFEditor_installer/packages/com.vidvox.ISFEditor.mac/data/$$TARGET\.app";
	}
}
win32	{
	CONFIG(debug, debug|release)	{
		#	intentionally blank, debug builds don't need any work (build & run works just fine)
	}
	else	{
		MY_DEPLOY_DIR = $$shell_quote($$shell_path("$${OUT_PWD}/release"))

		QMAKE_POST_LINK += copy $$shell_quote($$shell_path($$OUT_PWD/../../VVGL/release/VVGL.dll)) $${MY_DEPLOY_DIR} $$escape_expand(\n)
		QMAKE_POST_LINK += copy $$shell_quote($$shell_path($$OUT_PWD/../../VVISF/release/VVISF.dll)) $${MY_DEPLOY_DIR} $$escape_expand(\n)
		QMAKE_POST_LINK += copy $$shell_quote($$shell_path($$OUT_PWD/../../../../external/GLEW/win_x64/glew32.dll)) $${MY_DEPLOY_DIR} $$escape_expand(\n)
		QMAKE_POST_LINK += copy $$shell_quote($$shell_path($$OUT_PWD/../fftreal/release/fftreal.dll)) $${MY_DEPLOY_DIR} $$escape_expand(\n)

		MY_WINDEPLOYQT = $$shell_quote($$shell_path($$[QT_INSTALL_BINS]/windeployqt))
		MY_TARGET_EXE = $$shell_quote($$shell_path("$${OUT_PWD}/release/$${TARGET}.exe"))
		QMAKE_POST_LINK += $${MY_WINDEPLOYQT} --compiler-runtime --verbose 3 $${MY_TARGET_EXE} $$escape_expand(\n)
	}
}
#else	{
#	linux-g++*: {
#		# Provide relative path from application to fftreal library
#		QMAKE_LFLAGS += -Wl,--rpath=\\\$\$ORIGIN
#	}
#}




