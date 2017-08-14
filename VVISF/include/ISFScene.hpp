#ifndef ISFScene_hpp
#define ISFScene_hpp

#include "ISFDoc.hpp"
#if ISF_TARGET_MAC
#import <TargetConditionals.h>
#endif




namespace VVISF
{


using namespace std;




class ISFScene;
using ISFSceneRef = shared_ptr<ISFScene>;




class ISFScene : public VVGLScene	{
	private:
		bool			throwExceptions = false;	//	NO by default
		
		mutex			propertyLock;	//	locks the below two vars
		//bool			loadingInProgress = false;
		ISFDocRef		doc = nullptr;	//	the ISFDoc being used
		
		//	access to these vars should be restricted by the 'renderLock' var inherited from VVGLScene
		VVGL::Size		renderSize = orthoSize;	//	the last size at which i was requested to render a buffer (used to produce vals from normalized point inputs that need a render size to be used)
		Timestamper		timestamper;	//	used to generate time values, some of which get passed to the ISF scene
		uint32_t		renderFrameIndex = 0;	//	used to pass FRAMEINDEX to shaders
		double			renderTime = 0.;	//	this is the render time that gets passed to the ISF
		double			renderTimeDelta = 0.;	//	this is the render time delta (frame duration) which gets passed to the ISF
		uint32_t		passIndex = 1;	//	used to store the index of the rendered pass, which gets passed to the shader
		string			*compiledInputTypeString = nullptr;	//	a sequence of characters, either "2" or "R" or "C", one character for each input image. describes whether the shader was compiled to work with 2D textures or RECT textures or cube textures.
		
		//	access to these vars should be restricted by the 'renderLock' var inherited from VVGLScene
		VVGLCachedAttrib	vertexAttrib = VVGLCachedAttrib("VERTEXDATA");	//	caches the location of the attribute in the compiled GL program for the vertex input
		VVGLCachedUni		renderSizeUni = VVGLCachedUni("RENDERSIZE");	//	caches the location of the uniform in the compiled GL program for the render size
		VVGLCachedUni		passIndexUni = VVGLCachedUni("PASSINDEX");	//	caches the location of the uniform in the compiled GL program for the pass index
		VVGLCachedUni		timeUni = VVGLCachedUni("TIME");	//	caches the location of the uniform in the compiled GL program for the time
		VVGLCachedUni		timeDeltaUni = VVGLCachedUni("TIMEDELTA");	//	caches the location of the uniform in the compiled GL program for the time delta
		VVGLCachedUni		dateUni = VVGLCachedUni("DATE");	//	caches the location of the uniform in the compiled GL program for the date
		VVGLCachedUni		renderFrameIndexUni = VVGLCachedUni("FRAMEINDEX");	//	caches the location of the uniform in the compiled GL program for the frame index
		
		//	access to these vars should be restricted by the 'renderLock' var inherited from VVGLScene
		//VVGLBufferRef		geoXYVBO = nullptr;
#if ISF_TARGET_GL3PLUS || ISF_TARGET_GLES3
		VVGLBufferRef		vao = nullptr;
#elif ISF_TARGET_GLES
		VVGLBufferRef		vbo = nullptr;
#endif
		GLBufferQuadXY		vboContents;	//	the VBO owned by VAO is described by this var- we check this, and if there's a delta then we have to upload new data to the VBO
		
		//	these vars describe some non-default/non-standard options for more unusual situations
		bool				alwaysRenderToFloat = false;	//	false by default- if true, all interim buffers generated by the ISF will be float32 per component.  set this before loading the doc.
		bool				persistentToIOSurface = false;	//	false by default- if true, persistent buffers generated by the ISF will be backed by IOSurfaces (so they can be re-used if the underlying GL context changes to one in a different sharegroup).  set this before loading the doc.
		VVGLBufferPoolRef	privatePool = nullptr;	//	by default this is null and the scene will try to use the global buffer pool to create interim resources (temp/persistent buffers).  if non-null, the scene will use this pool to create interim resources.
		VVGLBufferCopierRef	privateCopier = nullptr;	//	by default this is null and the scene will try to use the global buffer copier to create interim resources.  if non-null, the scene will use this copier to create interim resources.
	
	public:
		ISFScene();
		ISFScene(const VVGLContextRef & inCtx);
		//ISFScene(const VVGLContext * inSharedCtx=nullptr, const VVGL::Size & inSize={640.,480.});
		virtual ~ISFScene();
		
		virtual void prepareToBeDeleted();
		
		void useFile(const string & inPath);
		string getFilePath();
		string getFileName();
		string getFileDescription();
		string getFileCredit();
		ISFFileType getFileType();
		vector<string> getFileCategories();
		
		void setAlwaysRenderToFloat(const bool & n) { alwaysRenderToFloat=n; }
		bool getAlwaysRenderToFloat() { return alwaysRenderToFloat; }
		void setPersistentToIOSurface(const bool & n) { persistentToIOSurface=n; }
		bool getPersistentToIOSurface() { return persistentToIOSurface; }
		void setPrivatePool(const VVGLBufferPoolRef & n) { privatePool=n; }
		VVGLBufferPoolRef getPrivatePool() { return privatePool; }
		void setPrivateCopier(const VVGLBufferCopierRef & n) { privateCopier=n; }
		VVGLBufferCopierRef getPrivateCopier() { return privateCopier; }
		
		void setBufferForInputNamed(const VVGLBufferRef & inBuffer, const string & inName);
		void setFilterInputBuffer(const VVGLBufferRef & inBuffer);
		void setBufferForInputImageKey(const VVGLBufferRef & inBuffer, const string & inString);
		void setBufferForAudioInputKey(const VVGLBufferRef & inBuffer, const string & inString);
		VVGLBufferRef getBufferForImageInput(const string & inKey);
		VVGLBufferRef getBufferForAudioInput(const string & inKey);
		VVGLBufferRef getPersistentBufferNamed(const string & inKey);
		VVGLBufferRef getTempBufferNamed(const string & inKey);
		
		void setValueForInputNamed(const ISFVal & inVal, const string & inName);
		ISFVal valueForInputNamed(const string & inName);
		
		virtual VVGLBufferRef createAndRenderABuffer(const VVGL::Size & inSize=VVGL::Size(640.,480.), const VVGLBufferPoolRef & inPoolRef=nullptr);
		virtual VVGLBufferRef createAndRenderABuffer(const VVGL::Size & inSize, const double & inRenderTime, const VVGLBufferPoolRef & inPoolRef=nullptr);
		
		void renderToBuffer(const VVGLBufferRef & inTargetBuffer, const VVGL::Size & inRenderSize, const double & inRenderTime, map<int32_t,VVGLBufferRef> * outPassDict);
		void renderToBuffer(const VVGLBufferRef & inTargetBuffer, const VVGL::Size & inRenderSize, const double & inRenderTime);
		void renderToBuffer(const VVGLBufferRef & inTargetBuffer, const VVGL::Size & inRenderSize, map<int32_t,VVGLBufferRef> * outPassDict);
		void renderToBuffer(const VVGLBufferRef & inTargetBuffer, const VVGL::Size & inRenderSize);
		void renderToBuffer(const VVGLBufferRef & inTargetBuffer);
		
		virtual void setSize(const VVGL::Size & n);
		VVGL::Size getSize() const { return orthoSize; }
		VVGL::Size getRenderSize() const { return renderSize; }
		inline Timestamp getTimestamp() { return timestamper.nowTime(); }
		inline void setThrowExceptions(const bool & n) { throwExceptions=n; }
		
		//virtual void renderToBuffer(const VVGLBufferRef & inTargetBuffer, const VVGL::Size & inRenderSize=VVGL::Size(640.,480.), const double & inRenderTime=timestamper.nowTime().getTimeInSeconds(), map<string,VVGLBufferRef> * outPassDict=nullptr);
		
		ISFAttrRef getInputNamed(const string & inName);
		vector<ISFAttrRef> getInputs();
		vector<ISFAttrRef> getInputs(const ISFValType & inType);
		vector<ISFAttrRef> getImageInputs();
		vector<ISFAttrRef> getAudioInputs();
		vector<ISFAttrRef> getImageImports();
		
		inline ISFDocRef getDoc() { lock_guard<mutex> lock(propertyLock); return doc; }
		
		virtual void setVertexShaderString(const string & n);
		virtual void setFragmentShaderString(const string & n);
		
	protected:
#if ISF_TARGET_GL3PLUS || ISF_TARGET_GLES3
		inline VVGLBufferRef getVAO() const { return vao; }
		inline void setVAO(const VVGLBufferRef & n) { vao = n; }
#elif ISF_TARGET_GLES
		inline VVGLBufferRef getVBO() const { return vbo; }
		inline void setVBO(const VVGLBufferRef & n) { vbo = n; }
#endif
		void _setUpRenderCallback();
		virtual void _renderPrep();
		virtual void _initialize();
		virtual void _renderCleanup();
		virtual void _render(const VVGLBufferRef & inTargetBuffer, const VVGL::Size & inSize, const double & inTime, map<int32_t,VVGLBufferRef> * outPassDict);
};




}




#endif /* ISFScene_hpp */
