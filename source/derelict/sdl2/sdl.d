/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license ( the "Software" ) to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.sdl2.sdl;

public {
    import derelict.sdl2.types;
    import derelict.sdl2.functions;
}

private {
    import derelict.util.loader;
    import derelict.util.system;

    static if( Derelict_OS_Windows )
        enum libNames = "SDL2.dll";
    else static if( Derelict_OS_Mac )
        enum libNames = "/usr/local/lib/libSDL2.dylib, ../Frameworks/SDL2.framework/SDL2, /Library/Frameworks/SDL2.framework/SDL2, /System/Library/Frameworks/SDL2.framework/SDL2";
    else static if( Derelict_OS_Posix )
        enum libNames = "libSDL2.so, libSDL2-2.0.so, libSDL2-2.0.so.0, /usr/local/lib/libSDL2.so, /usr/local/lib/libSDL2-2.0.so, /usr/local/lib/libSDL2-2.0.so.0";
    else
        static assert( 0, "Need to implement SDL2 libNames for this operating system." );
}

/*
This function is not part of the public interface,  but SDL expects it to be called before any subsystems have been intiailized.
Normally, this happens via linking with libSDLmain, but since that doesn't happen when using Derelict, then the loader must
load this function and call it before the load method returns. Otherwise, bad things can happen.
*/
private extern( C ) nothrow alias da_SDL_SetMainReady = void function();

class DerelictSDL2Loader : SharedLibLoader {
      public this() {
            super( libNames );
      }

      protected override void loadSymbols() {
            bindFunc( cast( void** )&SDL_Init, "SDL_Init" );
            bindFunc( cast( void** )&SDL_InitSubSystem, "SDL_InitSubSystem" );
            bindFunc( cast( void** )&SDL_QuitSubSystem, "SDL_QuitSubSystem" );
            bindFunc( cast( void** )&SDL_WasInit, "SDL_WasInit" );
            bindFunc( cast( void** )&SDL_Quit, "SDL_Quit" );
            bindFunc( cast( void** )&SDL_free, "SDL_free" );
            bindFunc( cast( void** )&SDL_SetAssertionHandler, "SDL_SetAssertionHandler" );
            bindFunc( cast( void** )&SDL_GetAssertionReport, "SDL_GetAssertionReport" );
            bindFunc( cast( void** )&SDL_ResetAssertionReport, "SDL_ResetAssertionReport" );
            bindFunc( cast( void** )&SDL_GetNumAudioDrivers, "SDL_GetNumAudioDrivers" );
            bindFunc( cast( void** )&SDL_GetAudioDriver, "SDL_GetAudioDriver" );
            bindFunc( cast( void** )&SDL_AudioInit, "SDL_AudioInit" );
            bindFunc( cast( void** )&SDL_AudioQuit, "SDL_AudioQuit" );
            bindFunc( cast( void** )&SDL_GetCurrentAudioDriver, "SDL_GetCurrentAudioDriver" );
            bindFunc( cast( void** )&SDL_OpenAudio, "SDL_OpenAudio" );
            bindFunc( cast( void** )&SDL_GetNumAudioDevices, "SDL_GetNumAudioDevices" );
            bindFunc( cast( void** )&SDL_GetAudioDeviceName, "SDL_GetAudioDeviceName" );
            bindFunc( cast( void** )&SDL_OpenAudioDevice, "SDL_OpenAudioDevice" );
            bindFunc( cast( void** )&SDL_GetAudioStatus, "SDL_GetAudioStatus" );
            bindFunc( cast( void** )&SDL_GetAudioDeviceStatus, "SDL_GetAudioDeviceStatus" );
            bindFunc( cast( void** )&SDL_PauseAudio, "SDL_PauseAudio" );
            bindFunc( cast( void** )&SDL_PauseAudioDevice, "SDL_PauseAudioDevice" );
            bindFunc( cast( void** )&SDL_LoadWAV_RW, "SDL_LoadWAV_RW" );
            bindFunc( cast( void** )&SDL_FreeWAV, "SDL_FreeWAV" );
            bindFunc( cast( void** )&SDL_BuildAudioCVT, "SDL_BuildAudioCVT" );
            bindFunc( cast( void** )&SDL_ConvertAudio, "SDL_ConvertAudio" );
            bindFunc( cast( void** )&SDL_MixAudio, "SDL_MixAudio" );
            bindFunc( cast( void** )&SDL_MixAudioFormat, "SDL_MixAudioFormat" );
            bindFunc( cast( void** )&SDL_LockAudio, "SDL_LockAudio" );
            bindFunc( cast( void** )&SDL_LockAudioDevice, "SDL_LockAudioDevice" );
            bindFunc( cast( void** )&SDL_UnlockAudio, "SDL_UnlockAudio" );
            bindFunc( cast( void** )&SDL_UnlockAudioDevice, "SDL_UnlockAudioDevice" );
            bindFunc( cast( void** )&SDL_CloseAudio, "SDL_CloseAudio" );
            bindFunc( cast( void** )&SDL_CloseAudioDevice, "SDL_CloseAudioDevice" );
            //            bindFunc( cast( void** )&SDL_AudioDeviceConnected, "SDL_AudioDeviceConnected" );
            bindFunc( cast( void** )&SDL_SetClipboardText, "SDL_SetClipboardText" );
            bindFunc( cast( void** )&SDL_GetClipboardText, "SDL_GetClipboardText" );
            bindFunc( cast( void** )&SDL_HasClipboardText, "SDL_HasClipboardText" );
            bindFunc( cast( void** )&SDL_GetCPUCount, "SDL_GetCPUCount" );
            bindFunc( cast( void** )&SDL_GetCPUCacheLineSize, "SDL_GetCPUCacheLineSize" );
            bindFunc( cast( void** )&SDL_HasRDTSC, "SDL_HasRDTSC" );
            bindFunc( cast( void** )&SDL_HasAltiVec, "SDL_HasAltiVec" );
            bindFunc( cast( void** )&SDL_HasMMX, "SDL_HasMMX" );
            bindFunc( cast( void** )&SDL_Has3DNow, "SDL_Has3DNow" );
            bindFunc( cast( void** )&SDL_HasSSE, "SDL_HasSSE" );
            bindFunc( cast( void** )&SDL_HasSSE2, "SDL_HasSSE2" );
            bindFunc( cast( void** )&SDL_HasSSE3, "SDL_HasSSE3" );
            bindFunc( cast( void** )&SDL_HasSSE41, "SDL_HasSSE41" );
            bindFunc( cast( void** )&SDL_HasSSE42, "SDL_HasSSE42" );
            bindFunc( cast( void** )&SDL_GetSystemRAM, "SDL_GetSystemRAM" );
            bindFunc( cast( void** )&SDL_SetError, "SDL_SetError" );
            bindFunc( cast( void** )&SDL_GetError, "SDL_GetError" );
            bindFunc( cast( void** )&SDL_ClearError, "SDL_ClearError" );
            bindFunc( cast( void** )&SDL_PumpEvents, "SDL_PumpEvents" );
            bindFunc( cast( void** )&SDL_PeepEvents, "SDL_PeepEvents" );
            bindFunc( cast( void** )&SDL_HasEvent, "SDL_HasEvent" );
            bindFunc( cast( void** )&SDL_HasEvents, "SDL_HasEvents" );
            bindFunc( cast( void** )&SDL_FlushEvent, "SDL_FlushEvent" );
            bindFunc( cast( void** )&SDL_FlushEvents, "SDL_FlushEvents" );
            bindFunc( cast( void** )&SDL_PollEvent, "SDL_PollEvent" );
            bindFunc( cast( void** )&SDL_WaitEvent, "SDL_WaitEvent" );
            bindFunc( cast( void** )&SDL_WaitEventTimeout, "SDL_WaitEventTimeout" );
            bindFunc( cast( void** )&SDL_PushEvent, "SDL_PushEvent" );
            bindFunc( cast( void** )&SDL_SetEventFilter, "SDL_SetEventFilter" );
            bindFunc( cast( void** )&SDL_GetEventFilter, "SDL_GetEventFilter" );
            bindFunc( cast( void** )&SDL_AddEventWatch, "SDL_AddEventWatch" );
            bindFunc( cast( void** )&SDL_DelEventWatch, "SDL_DelEventWatch" );
            bindFunc( cast( void** )&SDL_FilterEvents, "SDL_FilterEvents" );
            bindFunc( cast( void** )&SDL_EventState, "SDL_EventState" );
            bindFunc( cast( void** )&SDL_RegisterEvents, "SDL_RegisterEvents" );
            bindFunc( cast( void** )&SDL_GameControllerAddMapping, "SDL_GameControllerAddMapping" );
            bindFunc( cast( void** )&SDL_GameControllerMappingForGUID, "SDL_GameControllerMappingForGUID" );
            bindFunc( cast( void** )&SDL_GameControllerMapping, "SDL_GameControllerMapping" );
            bindFunc( cast( void** )&SDL_IsGameController, "SDL_IsGameController" );
            bindFunc( cast( void** )&SDL_GameControllerNameForIndex, "SDL_GameControllerNameForIndex" );
            bindFunc( cast( void** )&SDL_GameControllerOpen, "SDL_GameControllerOpen" );
            bindFunc( cast( void** )&SDL_GameControllerName, "SDL_GameControllerName" );
            bindFunc( cast( void** )&SDL_GameControllerGetAttached, "SDL_GameControllerGetAttached" );
            bindFunc( cast( void** )&SDL_GameControllerGetJoystick, "SDL_GameControllerGetJoystick" );
            bindFunc( cast( void** )&SDL_GameControllerEventState, "SDL_GameControllerEventState" );
            bindFunc( cast( void** )&SDL_GameControllerUpdate, "SDL_GameControllerUpdate" );
            bindFunc( cast( void** )&SDL_GameControllerGetAxisFromString, "SDL_GameControllerGetAxisFromString" );
            bindFunc( cast( void** )&SDL_GameControllerGetStringForAxis, "SDL_GameControllerGetStringForAxis" );
            bindFunc( cast( void** )&SDL_GameControllerGetBindForAxis, "SDL_GameControllerGetBindForAxis" );
            bindFunc( cast( void** )&SDL_GameControllerGetAxis, "SDL_GameControllerGetAxis" );
            bindFunc( cast( void** )&SDL_GameControllerGetButtonFromString, "SDL_GameControllerGetButtonFromString" );
            bindFunc( cast( void** )&SDL_GameControllerGetStringForButton, "SDL_GameControllerGetStringForButton" );
            bindFunc( cast( void** )&SDL_GameControllerGetBindForButton, "SDL_GameControllerGetBindForButton" );
            bindFunc( cast( void** )&SDL_GameControllerGetButton, "SDL_GameControllerGetButton" );
            bindFunc( cast( void** )&SDL_GameControllerClose, "SDL_GameControllerClose" );
            bindFunc( cast( void** )&SDL_RecordGesture, "SDL_RecordGesture" );
            bindFunc( cast( void** )&SDL_SaveAllDollarTemplates, "SDL_SaveAllDollarTemplates" );
            bindFunc( cast( void** )&SDL_SaveDollarTemplate, "SDL_SaveDollarTemplate" );
            bindFunc( cast( void** )&SDL_LoadDollarTemplates, "SDL_LoadDollarTemplates" );
            bindFunc( cast( void** )&SDL_NumHaptics, "SDL_NumHaptics" );
            bindFunc( cast( void** )&SDL_HapticName, "SDL_HapticName" );
            bindFunc( cast( void** )&SDL_HapticOpen, "SDL_HapticOpen" );
            bindFunc( cast( void** )&SDL_HapticOpened, "SDL_HapticOpened" );
            bindFunc( cast( void** )&SDL_HapticIndex, "SDL_HapticIndex" );
            bindFunc( cast( void** )&SDL_MouseIsHaptic, "SDL_MouseIsHaptic" );
            bindFunc( cast( void** )&SDL_HapticOpenFromMouse, "SDL_HapticOpenFromMouse" );
            bindFunc( cast( void** )&SDL_JoystickIsHaptic, "SDL_JoystickIsHaptic" );
            bindFunc( cast( void** )&SDL_HapticOpenFromJoystick, "SDL_HapticOpenFromJoystick" );
            bindFunc( cast( void** )&SDL_HapticClose, "SDL_HapticClose" );
            bindFunc( cast( void** )&SDL_HapticNumEffects, "SDL_HapticNumEffects" );
            bindFunc( cast( void** )&SDL_HapticNumEffectsPlaying, "SDL_HapticNumEffectsPlaying" );
            bindFunc( cast( void** )&SDL_HapticQuery, "SDL_HapticQuery" );
            bindFunc( cast( void** )&SDL_HapticNumAxes, "SDL_HapticNumAxes" );
            bindFunc( cast( void** )&SDL_HapticEffectSupported, "SDL_HapticEffectSupported" );
            bindFunc( cast( void** )&SDL_HapticNewEffect, "SDL_HapticNewEffect" );
            bindFunc( cast( void** )&SDL_HapticUpdateEffect, "SDL_HapticUpdateEffect" );
            bindFunc( cast( void** )&SDL_HapticRunEffect, "SDL_HapticRunEffect" );
            bindFunc( cast( void** )&SDL_HapticStopEffect, "SDL_HapticStopEffect" );
            bindFunc( cast( void** )&SDL_HapticDestroyEffect, "SDL_HapticDestroyEffect" );
            bindFunc( cast( void** )&SDL_HapticGetEffectStatus, "SDL_HapticGetEffectStatus" );
            bindFunc( cast( void** )&SDL_HapticSetGain, "SDL_HapticSetGain" );
            bindFunc( cast( void** )&SDL_HapticSetAutocenter, "SDL_HapticSetAutocenter" );
            bindFunc( cast( void** )&SDL_HapticPause, "SDL_HapticPause" );
            bindFunc( cast( void** )&SDL_HapticUnpause, "SDL_HapticUnpause" );
            bindFunc( cast( void** )&SDL_HapticStopAll, "SDL_HapticStopAll" );
            bindFunc( cast( void** )&SDL_HapticRumbleSupported, "SDL_HapticRumbleSupported" );
            bindFunc( cast( void** )&SDL_HapticRumbleInit, "SDL_HapticRumbleInit" );
            bindFunc( cast( void** )&SDL_HapticRumblePlay, "SDL_HapticRumblePlay" );
            bindFunc( cast( void** )&SDL_HapticRumbleStop, "SDL_HapticRumbleStop" );
            bindFunc( cast( void** )&SDL_SetHintWithPriority, "SDL_SetHintWithPriority" );
            bindFunc( cast( void** )&SDL_SetHint, "SDL_SetHint" );
            bindFunc( cast( void** )&SDL_GetHint, "SDL_GetHint" );
            bindFunc( cast( void** )&SDL_AddHintCallback, "SDL_AddHintCallback" );
            bindFunc( cast( void** )&SDL_DelHintCallback, "SDL_DelHintCallback" );
            bindFunc( cast( void** )&SDL_ClearHints, "SDL_ClearHints" );
            //            bindFunc( cast( void** )&SDL_RedetectInputDevices, "SDL_RedetectInputDevices" );
            //            bindFunc( cast( void** )&SDL_GetNumInputDevices, "SDL_GetNumInputDevices" );
            //            bindFunc( cast( void** )&SDL_GetInputDeviceName, "SDL_GetInputDeviceName" );
            //            bindFunc( cast( void** )&SDL_IsDeviceDisconnected, "SDL_IsDeviceDisconnected" );
            bindFunc( cast( void** )&SDL_NumJoysticks, "SDL_NumJoysticks" );
            bindFunc( cast( void** )&SDL_JoystickNameForIndex, "SDL_JoystickNameForIndex" );
            bindFunc( cast( void** )&SDL_JoystickOpen, "SDL_JoystickOpen" );
            bindFunc( cast( void** )&SDL_JoystickName, "SDL_JoystickName" );
            bindFunc( cast( void** )&SDL_JoystickGetDeviceGUID, "SDL_JoystickGetDeviceGUID" );
            bindFunc( cast( void** )&SDL_JoystickGetGUID, "SDL_JoystickGetGUID" );
            bindFunc( cast( void** )&SDL_JoystickGetGUIDString, "SDL_JoystickGetGUIDString" );
            bindFunc( cast( void** )&SDL_JoystickGetGUIDFromString, "SDL_JoystickGetGUIDFromString" );
            bindFunc( cast( void** )&SDL_JoystickGetAttached, "SDL_JoystickGetAttached" );
            bindFunc( cast( void** )&SDL_JoystickInstanceID, "SDL_JoystickInstanceID" );
            bindFunc( cast( void** )&SDL_JoystickNumAxes, "SDL_JoystickNumAxes" );
            bindFunc( cast( void** )&SDL_JoystickNumBalls, "SDL_JoystickNumBalls" );
            bindFunc( cast( void** )&SDL_JoystickNumHats, "SDL_JoystickNumHats" );
            bindFunc( cast( void** )&SDL_JoystickNumButtons, "SDL_JoystickNumButtons" );
            bindFunc( cast( void** )&SDL_JoystickUpdate, "SDL_JoystickUpdate" );
            bindFunc( cast( void** )&SDL_JoystickEventState, "SDL_JoystickEventState" );
            bindFunc( cast( void** )&SDL_JoystickGetAxis, "SDL_JoystickGetAxis" );
            bindFunc( cast( void** )&SDL_JoystickGetHat, "SDL_JoystickGetHat" );
            bindFunc( cast( void** )&SDL_JoystickGetBall, "SDL_JoystickGetBall" );
            bindFunc( cast( void** )&SDL_JoystickGetButton, "SDL_JoystickGetButton" );
            bindFunc( cast( void** )&SDL_JoystickClose, "SDL_JoystickClose" );
            bindFunc( cast( void** )&SDL_GetKeyboardFocus, "SDL_GetKeyboardFocus" );
            bindFunc( cast( void** )&SDL_GetKeyboardState, "SDL_GetKeyboardState" );
            bindFunc( cast( void** )&SDL_GetModState, "SDL_GetModState" );
            bindFunc( cast( void** )&SDL_SetModState, "SDL_SetModState" );
            bindFunc( cast( void** )&SDL_GetKeyFromScancode, "SDL_GetKeyFromScancode" );
            bindFunc( cast( void** )&SDL_GetScancodeFromKey, "SDL_GetScancodeFromKey" );
            bindFunc( cast( void** )&SDL_GetScancodeName, "SDL_GetScancodeName" );
            bindFunc( cast( void** )&SDL_GetScancodeFromName, "SDL_GetScancodeFromName" );
            bindFunc( cast( void** )&SDL_GetKeyName, "SDL_GetKeyName" );
            bindFunc( cast( void** )&SDL_GetKeyFromName, "SDL_GetKeyFromName" );
            bindFunc( cast( void** )&SDL_StartTextInput, "SDL_StartTextInput" );
            bindFunc( cast( void** )&SDL_IsTextInputActive, "SDL_IsTextInputActive" );
            bindFunc( cast( void** )&SDL_StopTextInput, "SDL_StopTextInput" );
            bindFunc( cast( void** )&SDL_SetTextInputRect, "SDL_SetTextInputRect" );
            bindFunc( cast( void** )&SDL_HasScreenKeyboardSupport, "SDL_HasScreenKeyboardSupport" );
            bindFunc( cast( void** )&SDL_IsScreenKeyboardShown, "SDL_IsScreenKeyboardShown" );
            bindFunc( cast( void** )&SDL_LoadObject, "SDL_LoadObject" );
            bindFunc( cast( void** )&SDL_LoadFunction, "SDL_LoadFunction" );
            bindFunc( cast( void** )&SDL_UnloadObject, "SDL_UnloadObject" );
            bindFunc( cast( void** )&SDL_LogSetAllPriority, "SDL_LogSetAllPriority" );
            bindFunc( cast( void** )&SDL_LogSetPriority, "SDL_LogSetPriority" );
            bindFunc( cast( void** )&SDL_LogGetPriority, "SDL_LogGetPriority" );
            bindFunc( cast( void** )&SDL_LogResetPriorities, "SDL_LogResetPriorities" );
            bindFunc( cast( void** )&SDL_Log, "SDL_Log" );
            bindFunc( cast( void** )&SDL_LogVerbose, "SDL_LogVerbose" );
            bindFunc( cast( void** )&SDL_LogDebug, "SDL_LogDebug" );
            bindFunc( cast( void** )&SDL_LogInfo, "SDL_LogInfo" );
            bindFunc( cast( void** )&SDL_LogWarn, "SDL_LogWarn" );
            bindFunc( cast( void** )&SDL_LogError, "SDL_LogError" );
            bindFunc( cast( void** )&SDL_LogCritical, "SDL_LogCritical" );
            bindFunc( cast( void** )&SDL_LogMessage, "SDL_LogMessage" );
            bindFunc( cast( void** )&SDL_LogMessageV, "SDL_LogMessageV" );
            bindFunc( cast( void** )&SDL_LogGetOutputFunction, "SDL_LogGetOutputFunction" );
            bindFunc( cast( void** )&SDL_LogSetOutputFunction, "SDL_LogSetOutputFunction" );
            bindFunc( cast( void** )&SDL_ShowMessageBox, "SDL_ShowMessageBox" );
            bindFunc( cast( void** )&SDL_ShowSimpleMessageBox, "SDL_ShowSimpleMessageBox" );
            bindFunc( cast( void** )&SDL_GetMouseFocus, "SDL_GetMouseFocus" );
            bindFunc( cast( void** )&SDL_GetMouseState, "SDL_GetMouseState" );
            bindFunc( cast( void** )&SDL_GetRelativeMouseState, "SDL_GetRelativeMouseState" );
            bindFunc( cast( void** )&SDL_WarpMouseInWindow, "SDL_WarpMouseInWindow" );
            bindFunc( cast( void** )&SDL_SetRelativeMouseMode, "SDL_SetRelativeMouseMode" );
            bindFunc( cast( void** )&SDL_GetRelativeMouseMode, "SDL_GetRelativeMouseMode" );
            bindFunc( cast( void** )&SDL_CreateCursor, "SDL_CreateCursor" );
            bindFunc( cast( void** )&SDL_CreateColorCursor, "SDL_CreateColorCursor" );
            bindFunc( cast( void** )&SDL_CreateSystemCursor, "SDL_CreateSystemCursor" );
            bindFunc( cast( void** )&SDL_SetCursor, "SDL_SetCursor" );
            bindFunc( cast( void** )&SDL_GetCursor, "SDL_GetCursor" );
            bindFunc( cast( void** )&SDL_GetDefaultCursor, "SDL_GetDefaultCursor" );
            bindFunc( cast( void** )&SDL_FreeCursor, "SDL_FreeCursor" );
            bindFunc( cast( void** )&SDL_ShowCursor, "SDL_ShowCursor" );
            bindFunc( cast( void** )&SDL_GetPixelFormatName, "SDL_GetPixelFormatName" );
            bindFunc( cast( void** )&SDL_PixelFormatEnumToMasks, "SDL_PixelFormatEnumToMasks" );
            bindFunc( cast( void** )&SDL_MasksToPixelFormatEnum, "SDL_MasksToPixelFormatEnum" );
            bindFunc( cast( void** )&SDL_AllocFormat, "SDL_AllocFormat" );
            bindFunc( cast( void** )&SDL_FreeFormat, "SDL_FreeFormat" );
            bindFunc( cast( void** )&SDL_AllocPalette, "SDL_AllocPalette" );
            bindFunc( cast( void** )&SDL_SetPixelFormatPalette, "SDL_SetPixelFormatPalette" );
            bindFunc( cast( void** )&SDL_SetPaletteColors, "SDL_SetPaletteColors" );
            bindFunc( cast( void** )&SDL_FreePalette, "SDL_FreePalette" );
            bindFunc( cast( void** )&SDL_MapRGB, "SDL_MapRGB" );
            bindFunc( cast( void** )&SDL_MapRGBA, "SDL_MapRGBA" );
            bindFunc( cast( void** )&SDL_GetRGB, "SDL_GetRGB" );
            bindFunc( cast( void** )&SDL_GetRGBA, "SDL_GetRGBA" );
            bindFunc( cast( void** )&SDL_CalculateGammaRamp, "SDL_CalculateGammaRamp" );
            bindFunc( cast( void** )&SDL_GetPlatform, "SDL_GetPlatform" );
            bindFunc( cast( void** )&SDL_GetPowerInfo, "SDL_GetPowerInfo" );
            bindFunc( cast( void** )&SDL_HasIntersection, "SDL_HasIntersection" );
            bindFunc( cast( void** )&SDL_IntersectRect, "SDL_IntersectRect" );
            bindFunc( cast( void** )&SDL_UnionRect, "SDL_UnionRect" );
            bindFunc( cast( void** )&SDL_EnclosePoints, "SDL_EnclosePoints" );
            bindFunc( cast( void** )&SDL_IntersectRectAndLine, "SDL_IntersectRectAndLine" );
            bindFunc( cast( void** )&SDL_GetNumRenderDrivers, "SDL_GetNumRenderDrivers" );
            bindFunc( cast( void** )&SDL_GetRenderDriverInfo, "SDL_GetRenderDriverInfo" );
            bindFunc( cast( void** )&SDL_CreateWindowAndRenderer, "SDL_CreateWindowAndRenderer" );
            bindFunc( cast( void** )&SDL_CreateRenderer, "SDL_CreateRenderer" );
            bindFunc( cast( void** )&SDL_CreateSoftwareRenderer, "SDL_CreateSoftwareRenderer" );
            bindFunc( cast( void** )&SDL_GetRendererInfo, "SDL_GetRendererInfo" );
            bindFunc( cast( void** )&SDL_CreateTexture, "SDL_CreateTexture" );
            bindFunc( cast( void** )&SDL_CreateTextureFromSurface, "SDL_CreateTextureFromSurface" );
            bindFunc( cast( void** )&SDL_QueryTexture, "SDL_QueryTexture" );
            bindFunc( cast( void** )&SDL_SetTextureColorMod, "SDL_SetTextureColorMod" );
            bindFunc( cast( void** )&SDL_GetTextureColorMod, "SDL_GetTextureColorMod" );
            bindFunc( cast( void** )&SDL_SetTextureAlphaMod, "SDL_SetTextureAlphaMod" );
            bindFunc( cast( void** )&SDL_GetTextureAlphaMod, "SDL_GetTextureAlphaMod" );
            bindFunc( cast( void** )&SDL_SetTextureBlendMode, "SDL_SetTextureBlendMode" );
            bindFunc( cast( void** )&SDL_GetTextureBlendMode, "SDL_GetTextureBlendMode" );
            bindFunc( cast( void** )&SDL_UpdateTexture, "SDL_UpdateTexture" );
            bindFunc( cast( void** )&SDL_UpdateYUVTexture, "SDL_UpdateYUVTexture" );
            bindFunc( cast( void** )&SDL_LockTexture, "SDL_LockTexture" );
            bindFunc( cast( void** )&SDL_UnlockTexture, "SDL_UnlockTexture" );
            bindFunc( cast( void** )&SDL_RenderTargetSupported, "SDL_RenderTargetSupported" );
            bindFunc( cast( void** )&SDL_SetRenderTarget, "SDL_SetRenderTarget" );
            bindFunc( cast( void** )&SDL_GetRenderTarget, "SDL_GetRenderTarget" );
            bindFunc( cast( void** )&SDL_RenderSetLogicalSize, "SDL_RenderSetLogicalSize" );
            bindFunc( cast( void** )&SDL_RenderGetLogicalSize, "SDL_RenderGetLogicalSize" );
            bindFunc( cast( void** )&SDL_RenderSetViewport, "SDL_RenderSetViewport" );
            bindFunc( cast( void** )&SDL_RenderGetViewport, "SDL_RenderGetViewport" );
            bindFunc( cast( void** )&SDL_RenderSetScale, "SDL_RenderSetScale" );
            bindFunc( cast( void** )&SDL_RenderGetScale, "SDL_RenderGetScale" );
            bindFunc( cast( void** )&SDL_SetRenderDrawColor, "SDL_SetRenderDrawColor" );
            bindFunc( cast( void** )&SDL_GetRenderDrawColor, "SDL_GetRenderDrawColor" );
            bindFunc( cast( void** )&SDL_SetRenderDrawBlendMode, "SDL_SetRenderDrawBlendMode" );
            bindFunc( cast( void** )&SDL_GetRenderDrawBlendMode, "SDL_GetRenderDrawBlendMode" );
            bindFunc( cast( void** )&SDL_RenderClear, "SDL_RenderClear" );
            bindFunc( cast( void** )&SDL_RenderDrawPoint, "SDL_RenderDrawPoint" );
            bindFunc( cast( void** )&SDL_RenderDrawPoints, "SDL_RenderDrawPoints" );
            bindFunc( cast( void** )&SDL_RenderDrawLine, "SDL_RenderDrawLine" );
            bindFunc( cast( void** )&SDL_RenderDrawLines, "SDL_RenderDrawLines" );
            bindFunc( cast( void** )&SDL_RenderDrawRect, "SDL_RenderDrawRect" );
            bindFunc( cast( void** )&SDL_RenderDrawRects, "SDL_RenderDrawRects" );
            bindFunc( cast( void** )&SDL_RenderFillRect, "SDL_RenderFillRect" );
            bindFunc( cast( void** )&SDL_RenderFillRects, "SDL_RenderFillRects" );
            bindFunc( cast( void** )&SDL_RenderCopy, "SDL_RenderCopy" );
            bindFunc( cast( void** )&SDL_RenderCopyEx, "SDL_RenderCopyEx" );
            bindFunc( cast( void** )&SDL_RenderReadPixels, "SDL_RenderReadPixels" );
            bindFunc( cast( void** )&SDL_RenderPresent, "SDL_RenderPresent" );
            bindFunc( cast( void** )&SDL_DestroyTexture, "SDL_DestroyTexture" );
            bindFunc( cast( void** )&SDL_DestroyRenderer, "SDL_DestroyRenderer" );
            bindFunc( cast( void** )&SDL_GL_BindTexture, "SDL_GL_BindTexture" );
            bindFunc( cast( void** )&SDL_GL_UnbindTexture, "SDL_GL_UnbindTexture" );
            bindFunc( cast( void** )&SDL_RWFromFile, "SDL_RWFromFile" );
            bindFunc( cast( void** )&SDL_RWFromFP, "SDL_RWFromFP" );
            bindFunc( cast( void** )&SDL_RWFromMem, "SDL_RWFromMem" );
            bindFunc( cast( void** )&SDL_RWFromConstMem, "SDL_RWFromConstMem" );
            bindFunc( cast( void** )&SDL_AllocRW, "SDL_AllocRW" );
            bindFunc( cast( void** )&SDL_FreeRW, "SDL_FreeRW" );
            bindFunc( cast( void** )&SDL_ReadU8, "SDL_ReadU8" );
            bindFunc( cast( void** )&SDL_ReadLE16, "SDL_ReadLE16" );
            bindFunc( cast( void** )&SDL_ReadBE16, "SDL_ReadBE16" );
            bindFunc( cast( void** )&SDL_ReadLE32, "SDL_ReadLE32" );
            bindFunc( cast( void** )&SDL_ReadBE32, "SDL_ReadBE32" );
            bindFunc( cast( void** )&SDL_ReadLE64, "SDL_ReadLE64" );
            bindFunc( cast( void** )&SDL_ReadBE64, "SDL_ReadBE64" );
            bindFunc( cast( void** )&SDL_WriteU8, "SDL_WriteU8" );
            bindFunc( cast( void** )&SDL_WriteLE16, "SDL_WriteLE16" );
            bindFunc( cast( void** )&SDL_WriteBE16, "SDL_WriteBE16" );
            bindFunc( cast( void** )&SDL_WriteLE32, "SDL_WriteLE32" );
            bindFunc( cast( void** )&SDL_WriteBE32, "SDL_WriteBE32" );
            bindFunc( cast( void** )&SDL_WriteLE64, "SDL_WriteLE64" );
            bindFunc( cast( void** )&SDL_WriteBE64, "SDL_WriteBE64" );
            bindFunc( cast( void** )&SDL_CreateShapedWindow, "SDL_CreateShapedWindow" );
            bindFunc( cast( void** )&SDL_IsShapedWindow, "SDL_IsShapedWindow" );
            bindFunc( cast( void** )&SDL_SetWindowShape, "SDL_SetWindowShape" );
            bindFunc( cast( void** )&SDL_GetShapedWindowMode, "SDL_GetShapedWindowMode" );
            bindFunc( cast( void** )&SDL_CreateRGBSurface, "SDL_CreateRGBSurface" );
            bindFunc( cast( void** )&SDL_CreateRGBSurfaceFrom, "SDL_CreateRGBSurfaceFrom" );
            bindFunc( cast( void** )&SDL_FreeSurface, "SDL_FreeSurface" );
            bindFunc( cast( void** )&SDL_SetSurfacePalette, "SDL_SetSurfacePalette" );
            bindFunc( cast( void** )&SDL_LockSurface, "SDL_LockSurface" );
            bindFunc( cast( void** )&SDL_UnlockSurface, "SDL_UnlockSurface" );
            bindFunc( cast( void** )&SDL_LoadBMP_RW, "SDL_LoadBMP_RW" );
            bindFunc( cast( void** )&SDL_SaveBMP_RW, "SDL_SaveBMP_RW" );
            bindFunc( cast( void** )&SDL_SetSurfaceRLE, "SDL_SetSurfaceRLE" );
            bindFunc( cast( void** )&SDL_SetColorKey, "SDL_SetColorKey" );
            bindFunc( cast( void** )&SDL_GetColorKey, "SDL_GetColorKey" );
            bindFunc( cast( void** )&SDL_SetSurfaceColorMod, "SDL_SetSurfaceColorMod" );
            bindFunc( cast( void** )&SDL_GetSurfaceColorMod, "SDL_GetSurfaceColorMod" );
            bindFunc( cast( void** )&SDL_SetSurfaceAlphaMod, "SDL_SetSurfaceAlphaMod" );
            bindFunc( cast( void** )&SDL_GetSurfaceAlphaMod, "SDL_GetSurfaceAlphaMod" );
            bindFunc( cast( void** )&SDL_SetSurfaceBlendMode, "SDL_SetSurfaceBlendMode" );
            bindFunc( cast( void** )&SDL_GetSurfaceBlendMode, "SDL_GetSurfaceBlendMode" );
            bindFunc( cast( void** )&SDL_SetClipRect, "SDL_SetClipRect" );
            bindFunc( cast( void** )&SDL_GetClipRect, "SDL_GetClipRect" );
            bindFunc( cast( void** )&SDL_ConvertSurface, "SDL_ConvertSurface" );
            bindFunc( cast( void** )&SDL_ConvertSurfaceFormat, "SDL_ConvertSurfaceFormat" );
            bindFunc( cast( void** )&SDL_ConvertPixels, "SDL_ConvertPixels" );
            bindFunc( cast( void** )&SDL_FillRect, "SDL_FillRect" );
            bindFunc( cast( void** )&SDL_FillRects, "SDL_FillRects" );
            bindFunc( cast( void** )&SDL_UpperBlit, "SDL_UpperBlit" );
            bindFunc( cast( void** )&SDL_LowerBlit, "SDL_LowerBlit" );
            bindFunc( cast( void** )&SDL_SoftStretch, "SDL_SoftStretch" );
            bindFunc( cast( void** )&SDL_UpperBlitScaled, "SDL_UpperBlitScaled" );
            bindFunc( cast( void** )&SDL_LowerBlitScaled, "SDL_LowerBlitScaled" );
            bindFunc( cast( void** )&SDL_GetWindowWMInfo, "SDL_GetWindowWMInfo" );
            bindFunc( cast( void** )&SDL_GetTicks, "SDL_GetTicks" );
            bindFunc( cast( void** )&SDL_GetPerformanceCounter, "SDL_GetPerformanceCounter" );
            bindFunc( cast( void** )&SDL_GetPerformanceFrequency, "SDL_GetPerformanceFrequency" );
            bindFunc( cast( void** )&SDL_Delay, "SDL_Delay" );
            bindFunc( cast( void** )&SDL_AddTimer, "SDL_AddTimer" );
            bindFunc( cast( void** )&SDL_RemoveTimer, "SDL_RemoveTimer" );
            bindFunc( cast( void** )&SDL_GetNumTouchDevices, "SDL_GetNumTouchDevices" );
            bindFunc( cast( void** )&SDL_GetTouchDevice, "SDL_GetTouchDevice" );
            bindFunc( cast( void** )&SDL_GetNumTouchFingers, "SDL_GetNumTouchFingers" );
            bindFunc( cast( void** )&SDL_GetTouchFinger, "SDL_GetTouchFinger" );
            bindFunc( cast( void** )&SDL_GetVersion, "SDL_GetVersion" );
            bindFunc( cast( void** )&SDL_GetRevision, "SDL_GetRevision" );
            bindFunc( cast( void** )&SDL_GetRevisionNumber, "SDL_GetRevisionNumber" );
            bindFunc( cast( void** )&SDL_GetNumVideoDrivers, "SDL_GetNumVideoDrivers" );
            bindFunc( cast( void** )&SDL_GetVideoDriver, "SDL_GetVideoDriver" );
            bindFunc( cast( void** )&SDL_VideoInit, "SDL_VideoInit" );
            bindFunc( cast( void** )&SDL_VideoQuit, "SDL_VideoQuit" );
            bindFunc( cast( void** )&SDL_GetCurrentVideoDriver, "SDL_GetCurrentVideoDriver" );
            bindFunc( cast( void** )&SDL_GetNumVideoDisplays, "SDL_GetNumVideoDisplays" );
            bindFunc( cast( void** )&SDL_GetDisplayName, "SDL_GetDisplayName" );
            bindFunc( cast( void** )&SDL_GetDisplayBounds, "SDL_GetDisplayBounds" );
            bindFunc( cast( void** )&SDL_GetNumDisplayModes, "SDL_GetNumDisplayModes" );
            bindFunc( cast( void** )&SDL_GetDisplayMode, "SDL_GetDisplayMode" );
            bindFunc( cast( void** )&SDL_GetDesktopDisplayMode, "SDL_GetDesktopDisplayMode" );
            bindFunc( cast( void** )&SDL_GetCurrentDisplayMode, "SDL_GetCurrentDisplayMode" );
            bindFunc( cast( void** )&SDL_GetClosestDisplayMode, "SDL_GetClosestDisplayMode" );
            bindFunc( cast( void** )&SDL_GetWindowDisplayIndex, "SDL_GetWindowDisplayIndex" );
            bindFunc( cast( void** )&SDL_SetWindowDisplayMode, "SDL_SetWindowDisplayMode" );
            bindFunc( cast( void** )&SDL_GetWindowDisplayMode, "SDL_GetWindowDisplayMode" );
            bindFunc( cast( void** )&SDL_GetWindowPixelFormat, "SDL_GetWindowPixelFormat" );
            bindFunc( cast( void** )&SDL_CreateWindow, "SDL_CreateWindow" );
            bindFunc( cast( void** )&SDL_CreateWindowFrom, "SDL_CreateWindowFrom" );
            bindFunc( cast( void** )&SDL_GetWindowID, "SDL_GetWindowID" );
            bindFunc( cast( void** )&SDL_GetWindowFromID, "SDL_GetWindowFromID" );
            bindFunc( cast( void** )&SDL_GetWindowFlags, "SDL_GetWindowFlags" );
            bindFunc( cast( void** )&SDL_SetWindowTitle, "SDL_SetWindowTitle" );
            bindFunc( cast( void** )&SDL_GetWindowTitle, "SDL_GetWindowTitle" );
            bindFunc( cast( void** )&SDL_SetWindowIcon, "SDL_SetWindowIcon" );
            bindFunc( cast( void** )&SDL_SetWindowData, "SDL_SetWindowData" );
            bindFunc( cast( void** )&SDL_GetWindowData, "SDL_GetWindowData" );
            bindFunc( cast( void** )&SDL_SetWindowPosition, "SDL_SetWindowPosition" );
            bindFunc( cast( void** )&SDL_GetWindowPosition, "SDL_GetWindowPosition" );
            bindFunc( cast( void** )&SDL_SetWindowSize, "SDL_SetWindowSize" );
            bindFunc( cast( void** )&SDL_GetWindowSize, "SDL_GetWindowSize" );
            bindFunc( cast( void** )&SDL_SetWindowMinimumSize, "SDL_SetWindowMinimumSize" );
            bindFunc( cast( void** )&SDL_GetWindowMinimumSize, "SDL_GetWindowMinimumSize" );
            bindFunc( cast( void** )&SDL_SetWindowMaximumSize, "SDL_SetWindowMaximumSize" );
            bindFunc( cast( void** )&SDL_GetWindowMaximumSize, "SDL_GetWindowMaximumSize" );
            bindFunc( cast( void** )&SDL_SetWindowBordered, "SDL_SetWindowBordered" );
            bindFunc( cast( void** )&SDL_ShowWindow, "SDL_ShowWindow" );
            bindFunc( cast( void** )&SDL_HideWindow, "SDL_HideWindow" );
            bindFunc( cast( void** )&SDL_RaiseWindow, "SDL_RaiseWindow" );
            bindFunc( cast( void** )&SDL_MaximizeWindow, "SDL_MaximizeWindow" );
            bindFunc( cast( void** )&SDL_MinimizeWindow, "SDL_MinimizeWindow" );
            bindFunc( cast( void** )&SDL_RestoreWindow, "SDL_RestoreWindow" );
            bindFunc( cast( void** )&SDL_SetWindowFullscreen, "SDL_SetWindowFullscreen" );
            bindFunc( cast( void** )&SDL_GetWindowSurface, "SDL_GetWindowSurface" );
            bindFunc( cast( void** )&SDL_UpdateWindowSurface, "SDL_UpdateWindowSurface" );
            bindFunc( cast( void** )&SDL_UpdateWindowSurfaceRects, "SDL_UpdateWindowSurfaceRects" );
            bindFunc( cast( void** )&SDL_SetWindowGrab, "SDL_SetWindowGrab" );
            bindFunc( cast( void** )&SDL_GetWindowGrab, "SDL_GetWindowGrab" );
            bindFunc( cast( void** )&SDL_SetWindowBrightness, "SDL_SetWindowBrightness" );
            bindFunc( cast( void** )&SDL_GetWindowBrightness, "SDL_GetWindowBrightness" );
            bindFunc( cast( void** )&SDL_SetWindowGammaRamp, "SDL_SetWindowGammaRamp" );
            bindFunc( cast( void** )&SDL_GetWindowGammaRamp, "SDL_GetWindowGammaRamp" );
            bindFunc( cast( void** )&SDL_DestroyWindow, "SDL_DestroyWindow" );
            bindFunc( cast( void** )&SDL_IsScreenSaverEnabled, "SDL_IsScreenSaverEnabled" );
            bindFunc( cast( void** )&SDL_EnableScreenSaver, "SDL_EnableScreenSaver" );
            bindFunc( cast( void** )&SDL_DisableScreenSaver, "SDL_DisableScreenSaver" );
            bindFunc( cast( void** )&SDL_GL_LoadLibrary, "SDL_GL_LoadLibrary" );
            bindFunc( cast( void** )&SDL_GL_GetProcAddress, "SDL_GL_GetProcAddress" );
            bindFunc( cast( void** )&SDL_GL_UnloadLibrary, "SDL_GL_UnloadLibrary" );
            bindFunc( cast( void** )&SDL_GL_ExtensionSupported, "SDL_GL_ExtensionSupported" );
            bindFunc( cast( void** )&SDL_GL_SetAttribute, "SDL_GL_SetAttribute" );
            bindFunc( cast( void** )&SDL_GL_GetAttribute, "SDL_GL_GetAttribute" );
            bindFunc( cast( void** )&SDL_GL_CreateContext, "SDL_GL_CreateContext" );
            bindFunc( cast( void** )&SDL_GL_MakeCurrent, "SDL_GL_MakeCurrent" );
            bindFunc( cast( void** )&SDL_GL_GetCurrentWindow, "SDL_GL_GetCurrentWindow" );
            bindFunc( cast( void** )&SDL_GL_GetCurrentContext, "SDL_GL_GetCurrentContext" );
            bindFunc( cast( void** )&SDL_GL_SetSwapInterval, "SDL_GL_SetSwapInterval" );
            bindFunc( cast( void** )&SDL_GL_GetSwapInterval, "SDL_GL_GetSwapInterval" );
            bindFunc( cast( void** )&SDL_GL_SwapWindow, "SDL_GL_SwapWindow" );
            bindFunc( cast( void** )&SDL_GL_DeleteContext, "SDL_GL_DeleteContext" );
            bindFunc( cast( void** )&SDL_GL_GetDrawableSize, "SDL_GL_GetDrawableSize" );
            bindFunc( cast( void** )&SDL_GetBasePath, "SDL_GetBasePath", false );
            bindFunc( cast( void** )&SDL_GetPrefPath, "SDL_GetPrefPath", false );

            // SDL_init will fail if SDL_SetMainReady has not been called.
            // Since there's no SDL_main on the D side, it needs to be handled
            // manually. My understanding that this is fine on the platforms
            // that D is currently available on. If we ever get on to Android
            // or iPhone, though, this will need to be versioned.
            // I've wrapped it in a try/catch because it seem the function is
            // not always exported on Linux. See issue #153
            // https://github.com/aldacron/Derelict3/issues/153
            import derelict.util.exception;
            try {
                  da_SDL_SetMainReady setReady;
                  bindFunc( cast( void** )&setReady, "SDL_SetMainReady" );
                  setReady();
            } catch(  DerelictException de  ) {}
      }
}

__gshared DerelictSDL2Loader DerelictSDL2;

shared static this() {
    DerelictSDL2 = new DerelictSDL2Loader();
}
