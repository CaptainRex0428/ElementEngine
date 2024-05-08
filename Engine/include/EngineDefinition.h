#pragma once

#ifdef _WINDOWS
#ifdef ENGINE_DLL_EXPORT
#define ENGINE_API __declspec(dllexport)
#else
#define ENGINE_API __declspec(dllimport)
#endif // _DLL_EXPORT
#endif // _WINDOWS