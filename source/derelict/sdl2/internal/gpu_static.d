/*

Boost Software License - Version 1.0 - August 17th,2003

Permission is hereby granted,free of charge,to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license(the "Software") to use,reproduce,display,distribute,
execute,and transmit the Software,and to prepare derivative works of the
Software,and to permit third-parties to whom the Software is furnished to
do so,all subject to the following:

The copyright notices in the Software and this entire statement,including
the above license grant,this restriction and the following disclaimer,
must be included in all copies of the Software,in whole or in part,and
all derivative works of the Software,unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS",WITHOUT WARRANTY OF ANY KIND,EXPRESS OR
IMPLIED,INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE,TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY,WHETHER IN CONTRACT,TORT OR OTHERWISE,
ARISING FROM,OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.sdl2.internal.gpu_static;

import derelict.sdl2.config;
static if(staticGPU) {
    import core.stdc.config,
           core.stdc.stdarg;
    import derelict.sdl2.internal.gpu_types,
           derelict.sdl2.internal.sdl_types;

    extern(C) @nogc nothrow {
        SDL_version GPU_GetLinkedVersion();
        uint GPU_GetInitWindow();
        void GPU_SetPreInitFlags(GPU_InitFlagEnum);
        GPU_InitFlagEnum GPU_GetPreInitFlags();
        void GPU_SetRequiredFeatures(GPU_FeatureEnum);
        GPU_FeatureEnum GPU_GetRequiredFeatures();
        void GPU_GetDefaultRendererOrder(int*,GPU_RendererID*);
        void GPU_GetRendererOrder(int*,GPU_RendererID);
        void GPU_SetRendererOrder(int*,GPU_RendererID);
        GPU_Target* GPU_Init(ushort,ushort,GPU_WindowFlagEnum);
        GPU_Target* GPU_InitRenderer(GPU_RendererEnum,ushort,ushort,GPU_WindowFlagEnum);
        GPU_Target* GPU_InitRendererByID(GPU_RendererID,ushort,ushort,GPU_WindowFlagEnum);
        GPU_bool GPU_IsFeatureEnabled(GPU_FeatureEnum);
        void GPU_CloseCurrentRenderer();
        void GPU_Quit();
        void GPU_SetDebugLevel(GPU_DebugLevelEnum);
        GPU_DebugLevelEnum GPU_GetDebugLevel();
        void GPU_LogInfo(const(char)*,...);
        void GPU_LogWarning(const(char)*,...);
        void GPU_LogError(const(char)*,...);
        void GPU_SetLogCallback(LogCallback);
        void GPU_PushErrorCode(const(char)*,GPU_ErrorEnum,const(char)*,...);
        GPU_ErrorObject GPU_PopErrorCode();
        const(char)* GPU_GetErrorString(GPU_ErrorEnum);
        void GPU_SetErrorQueueMax(uint);
        GPU_RendererID GPU_MakeRendererID(const(char)*,GPU_RendererEnum,int,int);
        GPU_RendererID GPU_GetRendererID(GPU_RendererEnum);
        int GPU_GetNumRegisteredRenderers();
        void GPU_GetRegisteredRendererList(GPU_RendererID*);
        void GPU_RegisterRenderer(GPU_RendererID,RendererConstructor,RendererDestructor);
        GPU_RendererEnum GPU_ReserveNextRendererEnum();
        int GPU_GetNumActiveRenderers();
        void GPU_GetActiveRendererList(GPU_RendererID*);
        GPU_Renderer* GPU_GetCurrentRenderer();
        void GPU_SetCurrentRenderer(GPU_RendererID);
        GPU_Renderer* GPU_GetRenderer(GPU_RendererID);
        void GPU_FreeRenderer(GPU_Renderer*);
        void GPU_ResetRendererState();
        void GPU_SetCoordinateMode(GPU_bool);
        GPU_bool GPU_GetCoordinateMode();
        void GPU_SetDefaultAnchor(float,float);
        void GPU_GetDefaultAnchor(float*,float*);
        GPU_Target* GPU_GetContextTarget();
        GPU_Target* GPU_GetWindowTarget(uint);
        GPU_Target* GPU_CreateTargetFromWindow(uint);
        void GPU_MakeCurrent(GPU_Target*,uint);
        GPU_bool GPU_SetWindowResolution(ushort,ushort);
        GPU_bool GPU_SetFullscreen(GPU_bool,GPU_bool);
        GPU_bool GPU_GetFullscreen();
        void GPU_SetShapeBlending(GPU_bool);
        GPU_BlendMode GPU_GetBlendModeFromPreset(GPU_BlendPresetEnum);
        void GPU_SetShapeBlendFunction(GPU_BlendFuncEnum,GPU_BlendFuncEnum,GPU_BlendFuncEnum,GPU_BlendFuncEnum);
        void GPU_SetShapeBlendEquation(GPU_BlendEqEnum,GPU_BlendEqEnum);
        void GPU_SetShapeBlendMode(GPU_BlendPresetEnum);
        float GPU_SetLineThickness(float);
        float GPU_GetLineThickness();
        GPU_Target* GPU_CreateAliasTarget(GPU_Target*);
        GPU_Target* GPU_LoadTarget(GPU_Image*);
        void GPU_FreeTarget(GPU_Target*);
        void GPU_SetVirtualResolution(GPU_Target*,ushort,ushort);
        void GPU_GetVirtualResolution(GPU_Target*,ushort*,ushort*);
        void GPU_GetVirtualCoords(GPU_Target*,float*,float*,float,float);
        void GPU_UnsetVirtualResolution(GPU_Target*);
        GPU_Rect GPU_MakeRect(float,float,float,float);
        SDL_Color GPU_MakeColor(ubyte,ubyte,ubyte,ubyte);
        void GPU_SetViewport(GPU_Target*,GPU_Rect);
        void GPU_UnsetViewport(GPU_Target*);
        GPU_Camera GPU_GetDefaultCamera();
        GPU_Camera GPU_GetCamera(GPU_Target*);
        GPU_Camera GPU_SetCamera(GPU_Target*,GPU_Camera);
        void GPU_EnableCamera(GPU_Target*,GPU_bool);
        GPU_bool GPU_IsCameraEnabled(GPU_Target*);
        SDL_Color GPU_GetPixel(GPU_Target*,short,short);
        GPU_Rect GPU_SetClipRect(GPU_Target*,GPU_Rect);
        GPU_Rect GPU_SetClip(short,short,ushort,ushort);
        void GPU_UnsetClip(GPU_Target*);
        GPU_bool GPU_IntersectRect(GPU_Rect,GPU_Rect,GPU_Rect*);
        GPU_bool GPU_IntersectClipRect(GPU_Target*,GPU_Rect);
        void GPU_SetTargetColor(GPU_Target*,SDL_Color);
        void GPU_SetTargetRGB(GPU_Target*,ubyte,ubyte,ubyte);
        void GPU_SetTargetRGBA(GPU_Target*,ubyte,ubyte,ubyte,ubyte);
        void GPU_UnsetTargetColor(GPU_Target*);
        SDL_Surface* GPU_LoadSurface(const(char*));
        SDL_Surface* GPU_LoadSurface_RW(SDL_RWops*,GPU_bool);
        GPU_bool GPU_SaveSurface(SDL_Surface*,const(char)*,GPU_FileFormatEnum);
        GPU_bool GPU_SaveSurface_RW(SDL_Surface*,SDL_RWops*,GPU_bool,GPU_FileFormatEnum);
        GPU_Image* GPU_CreateImage(ushort,ushort,GPU_FormatEnum);
        GPU_Image* GPU_CreateImageUsingTexture(uint,GPU_bool);
        GPU_Image* GPU_LoadImage(const(char)*);
        GPU_Image* GPU_LoadImage_RW(SDL_RWops*,GPU_bool);
        GPU_Image* GPU_CreateAliasImage(GPU_Image*);
        GPU_Image* GPU_CopyImage(GPU_Image*);
        void GPU_FreeImage(GPU_Image*);
        void GPU_SetImageVirtualResolution(GPU_Image*,ushort,ushort);
        void GPU_UnsetImageVirtualResolution(GPU_Image*);
        void GPU_UpdateImage(GPU_Image*,const(GPU_Rect)*,SDL_Surface*,const(GPU_Rect)*);
        void GPU_UpdateImageBytes(GPU_Image*,const(GPU_Rect)*,const(ubyte)*,int);
        GPU_bool GPU_ReplaceImage(GPU_Image*,SDL_Surface*,const(GPU_Rect)*);
        GPU_bool GPU_SaveImage(GPU_Image*,const(char)*,GPU_FileFormatEnum);
        GPU_bool GPU_SaveImage_RW(GPU_Image*,SDL_RWops*,GPU_bool,GPU_FileFormatEnum);
        void GPU_GenerateMipmaps(GPU_Image*);
        void GPU_SetColor(GPU_Image*,SDL_Color);
        void GPU_SetRGB(GPU_Image*,ubyte,ubyte,ubyte);
        void GPU_SetRGBA(GPU_Image*,ubyte,ubyte,ubyte,ubyte);
        GPU_bool GPU_GetBlending(GPU_Image*);
        void GPU_SetBlending(GPU_Image*,GPU_bool);
        void GPU_SetBlendFunction(GPU_Image*,GPU_BlendFuncEnum,GPU_BlendFuncEnum,GPU_BlendFuncEnum,GPU_BlendFuncEnum);
        void GPU_SetBlendEquation(GPU_Image*,GPU_BlendEqEnum,GPU_BlendEqEnum);
        void GPU_SetBlendMode(GPU_Image*,GPU_BlendPresetEnum);
        void GPU_SetImageFilter(GPU_Image*,GPU_FilterEnum);
        void GPU_SetAnchor(GPU_Image*,float,float);
        void GPU_GetAnchor(GPU_Image*,float*,float*);
        GPU_SnapEnum GPU_GetSnapMode(GPU_Image*);
        void GPU_SetSnapMode(GPU_Image*,GPU_SnapEnum);
        void GPU_SetWrapMode(GPU_Image*,GPU_WrapEnum,GPU_WrapEnum);
        GPU_Image* GPU_CopyImageFromSurface(SDL_Surface*);
        GPU_Image* GPU_CopyImageFromTarget(GPU_Target*);
        SDL_Surface* GPU_CopySurfaceFromTarget(GPU_Target*);
        SDL_Surface* GPU_CopySurfaceFromImage(GPU_Image*);
        float GPU_VectorLength(float*);
        void GPU_VectorNormalize(float*);
        float GPU_VectorDot(float*,float*);
        void GPU_VectorCross(float*,float*,float*);
        void GPU_VectorCopy(float*,float*);
        void GPU_VectorApplyMatrix(float*,float*);
        void GPU_MatrixCopy(float*,float*);
        void GPU_MatrixIdentity(float*);
        void GPU_MatrixOrtho(float*,float,float,float,float,float,float);
        void GPU_MatrixFrustum(float*,float,float,float,float,float,float);
        void GPU_MatrixPerspective(float*,float,float,float,float);
        void GPU_MatrixLookAt(float*,float,float,float,float,float,float,float,float,float);
        void GPU_MatrixTranslate(float*,float,float,float);
        void GPU_MatrixScale(float*,float,float,float);
        void GPU_MatrixRotate(float*,float,float,float,float);
        void GPU_MatrixMultiply(float*,const(float)*,const(float)*);
        void GPU_MultiplyAndAssign(float*,float*);
        const(char)* GPU_GetMatrixString(float*);
        float* GPU_GetCurrentMatrix();
        float* GPU_GetModelView();
        float* GPU_GetProjection();
        void GPU_GetModelViewProjection(float*);
        void GPU_MatrixMode(int);
        void GPU_PushMatrix();
        void GPU_PopMatrix();
        void GPU_LoadIdentity();
        void GPU_Ortho(float,float,float,float,float,float);
        void GPU_Frustum(float,float,float,float,float,float);
        void GPU_Translate(float,float,float);
        void GPU_Scale(float,float,float);
        void GPU_Rotate(float,float,float,float);
        void GPU_MultMatrix(float*);
        void GPU_Clear(GPU_Target*);
        void GPU_ClearColor(GPU_Target*,SDL_Color);
        void GPU_ClearRGB(GPU_Target*,ubyte,ubyte,ubyte);
        void GPU_ClearRGBA(GPU_Target*,ubyte,ubyte,ubyte,ubyte);
        void GPU_Blit(GPU_Image*,GPU_Rect*,GPU_Target*,float,float);
        void GPU_BlitRotate(GPU_Image*,GPU_Rect*,GPU_Target*,float,float,float);
        void GPU_BlitScale(GPU_Image*,GPU_Rect*,GPU_Target*,float,float,float,float);
        void GPU_BlitTransform(GPU_Image*,GPU_Rect*,GPU_Target*,float,float,float,float,float);
        void GPU_BlitTransformX(GPU_Image*,GPU_Rect*,GPU_Target*,float,float,float,float,float,float,float);
        void GPU_BlitRect(GPU_Image*,GPU_Rect*,GPU_Target*,GPU_Rect*);
        void GPU_BlitRectX(GPU_Image*,GPU_Rect*,GPU_Target*,GPU_Rect*,float,float,float,GPU_FlipEnum);
        void GPU_TriangleBatch(GPU_Image*,GPU_Target*,ushort,float*,uint,ushort*,GPU_BatchFlagEnum);
        void GPU_TriangleBatchX(GPU_Image*,GPU_Target*,ushort,void*,uint,ushort*,GPU_BatchFlagEnum);
        void GPU_FlushBlitBuffer();
        void GPU_Flip(GPU_Target*);
        void GPU_Pixel(GPU_Target*,float,float,SDL_Color);
        void GPU_Line(GPU_Target*,float,float,float,float,SDL_Color);
        void GPU_Arc(GPU_Target*,float,float,float,float,float,SDL_Color);
        void GPU_ArcFilled(GPU_Target*,float,float,float,float,float,SDL_Color);
        void GPU_Circle(GPU_Target*,float,float,float,SDL_Color);
        void GPU_CircleFilled(GPU_Target*,float,float,float,SDL_Color);
        void GPU_Ellipse(GPU_Target*,float,float,float,float,float,SDL_Color);
        void GPU_EllipseFilled(GPU_Target*,float,float,float,float,float,SDL_Color);
        void GPU_Sector(GPU_Target*,float,float,float,float,float,float,SDL_Color);
        void GPU_SectorFilled(GPU_Target*,float,float,float,float,float,float,SDL_Color);
        void GPU_Tri(GPU_Target*,float,float,float,float,float,float,SDL_Color);
        void GPU_TriFilled(GPU_Target*,float,float,float,float,float,float,SDL_Color);
        void GPU_Rectangle(GPU_Target*,float,float,float,float,SDL_Color);
        void GPU_Rectangle2(GPU_Target*,GPU_Rect,SDL_Color);
        void GPU_RectangleFilled(GPU_Target*,float,float,float,float,SDL_Color);
        void GPU_RectangleFilled2(GPU_Target*,GPU_Rect,SDL_Color);
        void GPU_RectangleRound(GPU_Target*,float,float,float,float,float,SDL_Color);
        void GPU_RectangleRound2(GPU_Target*,GPU_Rect,float,SDL_Color);
        void GPU_RectangleRoundFilled(GPU_Target*,float,float,float,float,float,SDL_Color);
        void GPU_RectangleRoundFilled2(GPU_Target*,GPU_Rect,float,SDL_Color);
        void GPU_Polygon(GPU_Target*,uint,float*,SDL_Color);
        void GPU_PolygonFilled(GPU_Target*,uint,float*,SDL_Color);
        uint GPU_CreateShaderProgram();
        void GPU_FreeShaderProgram(uint);
        uint GPU_CompileShader_RW(GPU_ShaderEnum,SDL_RWops*,GPU_bool);
        uint GPU_CompileShader(GPU_ShaderEnum,const(char)*);
        uint GPU_LoadShader(GPU_ShaderEnum,const(char)*);
        uint GPU_LinkShaders(uint,uint);
        uint GPU_LinkManyShaders(uint*,int);
        void GPU_FreeShader(uint);
        void GPU_AttachShader(uint,uint);
        void GPU_DetachShader(uint,uint);
        GPU_bool GPU_LinkShaderProgram(uint);
        uint GPU_GetCurrentShaderProgram();
        GPU_bool GPU_IsDefaultShaderProgram(uint);
        void GPU_ActivateShaderProgram(uint,GPU_ShaderBlock*);
        void GPU_DeactivateShaderProgram();
        const(char)* GPU_GetShaderMessage();
        int GPU_GetAttributeLocation(uint,const(char)*);
        GPU_AttributeFormat GPU_MakeAttributeFormat(int,GPU_TypeEnum,GPU_bool,int,int);
        GPU_Attribute GPU_MakeAttribute(int,void*,GPU_AttributeFormat);
        int GPU_GetUniformLocation(uint,const(char)*);
        GPU_ShaderBlock GPU_LoadShaderBlock(uint,const(char)*,const(char)*,const(char)*,const(char)*);
        void GPU_SetShaderBlock(GPU_ShaderBlock);
        GPU_ShaderBlock GPU_GetShaderBlock();
        void GPU_SetShaderImage(GPU_Image*,int,int);
        void GPU_GetUniformiv(uint,int,int*);
        void GPU_SetUniformi(int,int);
        void GPU_SetUniformiv(int,int,int,int*);
        void GPU_GetUniformuiv(uint,int,uint*);
        void GPU_SetUniformui(int,uint);
        void GPU_SetUniformuiv(int,int,int,uint*);
        void GPU_GetUniformfv(uint,int,float*);
        void GPU_SetUniformf(int,float);
        void GPU_SetUniformfv(int,int,int,float*);
        void GPU_GetUniformMatrixfv(uint,int,float*);
        void GPU_SetUniformMatrixfv(int,int,int,int,GPU_bool,float*);
        void GPU_SetAttributef(int,float);
        void GPU_SetAttributei(int,int);
        void GPU_SetAttributeui(int,uint);
        void GPU_SetAttributefv(int,int,float*);
        void GPU_SetAttributeiv(int,int,int*);
        void GPU_SetAttributeuiv(int,int,uint*);
        void GPU_SetAttributeSource(int,GPU_Attribute);
    }
}