include "Dependencies.lua"
include "Directory.lua"

workspace "ProjectDefault"
	architecture "x64"
	startproject "App"
	configurations{
		"Debug",
		"Release",
        "Dist"
	}

    filter "system:windows"
    buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus" }
	
group "Engine"
	include "Engine/Engine_Dll.lua"
	include "EngineCore/EngineCore_Lib.lua"

group "Sandbox"
	include "EngineSandbox/EngineSandbox_EXE.lua"

group "Dependencies"
	include "Dependencies/SDL2/SDL2.lua"
	include "Dependencies/SDL_image/SDL_image.lua"
	include "Dependencies/glad/glad.lua"
	include "Dependencies/glfw/glfw.lua"
	include "Dependencies/imgui/imgui.lua"
	include "Dependencies/libpng/libpng.lua"
	include "Dependencies/zlib/zlib.lua"

	include "Dependencies/dlg/dlg.lua"
	include "Dependencies/freetype/freetype.lua"
	include "Dependencies/harfbuzz/harfbuzz.lua"
	include "Dependencies/SDL_ttf/SDL_ttf.lua"
	
group "Dependencies/Examples"
	include "Dependencies/SDL_image/SDL_image_Example.lua"
	include "Dependencies/dlg/dlg_example.lua"
	include "Dependencies/SDL_ttf/SDL_ttf_Example.lua"