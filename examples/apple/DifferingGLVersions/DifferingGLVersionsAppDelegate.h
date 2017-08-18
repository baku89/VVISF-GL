#import <Cocoa/Cocoa.h>
#import <OpenGL/OpenGL.h>
#import <CoreVideo/CoreVideo.h>
#include "VVGL.hpp"
#import "VVGLBufferGLView.h"




using namespace VVGL;




@interface DifferingGLVersionsAppDelegate : NSObject <NSApplicationDelegate>	{
	CVDisplayLinkRef			displayLink;
	
	VVGLContextRef				legacyGLCtx;
	VVGLContextRef				modernGLCtx;
	
	VVGLBufferPoolRef			legacyBufferPool;
	VVGLBufferPoolRef			modernBufferPool;
	
	IBOutlet VVGLBufferGLView	*legacyBufferView;
	IBOutlet VVGLBufferGLView	*modernBufferView;
	
	VVGLSceneRef				legacyGLScene;
	VVGLSceneRef				modernGLScene;
	
	NSDate						*date;	//	used to fade the texture in repeatedly
	VVGLBufferRef				vao;
}

- (void) initLegacyGL;
- (void) initModernGL;

- (void) renderCallback;

@property (retain,readwrite) NSDate *date;
@property (assign,readwrite,setter=setVAO:) VVGLBufferRef vao;

@end




CVReturn displayLinkCallback(CVDisplayLinkRef displayLink, const CVTimeStamp *inNow, const CVTimeStamp *inOutputTime, CVOptionFlags flagsIn, CVOptionFlags *flagsOut, void *displayLinkContext);
