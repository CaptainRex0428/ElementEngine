project "SDL2"
	language          "C++"           
	cppdialect        "C++20"                      
	
	files {
		-- All platforms.
		-- Header files.                                    -- C files.
		"SDL/include/*.h",									    
														    
		"SDL/src/audio/disk/*.h",                               "SDL/src/atomic/*.c",
		"SDL/src/audio/dummy/*.h",						        "SDL/src/audio/disk/*.c",
		"SDL/src/audio/*.h",								    "SDL/src/audio/dummy/*.c",
		"SDL/src/dynapi/*.h",								    "SDL/src/audio/*.c",
		"SDL/src/events/blank_cursor.h",					    "SDL/src/cpuinfo/*.c",
		"SDL/src/events/default_cursor.h",				        "SDL/src/dynapi/*.c",
		"SDL/src/events/SDL_clipboardevents_c.h",			    "SDL/src/events/*.c",
		"SDL/src/events/SDL_displayevents_c.h",			        "SDL/src/file/*.c",
		"SDL/src/events/SDL_dropevents_c.h",				    "SDL/src/haptic/*.c",
		"SDL/src/events/SDL_events_c.h",					    "SDL/src/joystick/hidapi/*.c",
		"SDL/src/events/SDL_gesture_c.h",					    "SDL/src/joystick/*.c",
		"SDL/src/events/SDL_keyboard_c.h",				        "SDL/src/libm/*.c",
		"SDL/src/events/SDL_mouse_c.h",					        "SDL/src/power/*.c",
		"SDL/src/events/SDL_sysevents.h",					    "SDL/src/render/opengl/*.c",
		"SDL/src/events/SDL_touch_c.h",					        "SDL/src/render/opengles2/*.c",
		"SDL/src/events/SDL_windowevents_c.h",			        "SDL/src/render/SDL_render.c",
		"SDL/src/haptic/SDL_syshaptic.h",					    "SDL/src/render/SDL_yuv_sw.c",
		"SDL/src/joystick/hidapi/*.h",					        "SDL/src/render/software/*.c",
		"SDL/src/joystick/hidapi/SDL_hidapijoystick_c.h",		"SDL/src/*.c",
		"SDL/src/joystick/SDL_hidapijoystick_c.h",		        "SDL/src/sensor/dummy/SDL_dummysensor.c",
		"SDL/src/joystick/SDL_joystick_c.h",				    "SDL/src/sensor/SDL_sensor.c",
		"SDL/src/joystick/SDL_sysjoystick.h",				    "SDL/src/stdlib/*.c",
		"SDL/src/libm/*.h",								        "SDL/src/thread/generic/SDL_syscond.c",
		"SDL/src/render/opengl/*.h",						    "SDL/src/thread/*.c",
		"SDL/src/render/opengles/*.h",					        "SDL/src/thread/windows/SDL_sysmutex.c",
		"SDL/src/render/SDL_yuv_sw_c.h",					    "SDL/src/thread/windows/SDL_syssem.c",
		"SDL/src/render/software/*.h",					        "SDL/src/thread/windows/SDL_systhread.c",
		"SDL/src/render/SDL_sysrender.h",					    "SDL/src/thread/windows/SDL_systls.c",
		"SDL/src/SDL_dataqueue.h",						        "SDL/src/timer/*.c",
		"SDL/src/SDL_error_c.h",							    "SDL/src/timer/windows/SDL_systimer.c",
		"SDL/src/sensor/dummy/*.h",						        "SDL/src/video/dummy/*.c",
		"SDL/src/sensor/*.h",								    "SDL/src/video/*.c",
		"SDL/src/thread/*.h",								    "SDL/src/video/yuv2rgb/*.c",
		"SDL/src/timer/*.h",
		"SDL/src/video/dummy/*.h",
		"SDL/src/video/*.h",
	}

	includedirs
	{
		"SDL/include"
	}

	links 
	{
	}

	flags {
		"NoRuntimeChecks", -- Only used on Visual Studio.
		"NoBufferSecurityCheck"
	}

	vectorextensions  "SSE"               -- Necessary to run x32.

	location (LocationDir)
	targetdir (TargetDir)
	objdir (ObjectDir)

	

	filter "system:windows"
		kind          "SharedLib"
		staticruntime "off"
		systemversion "latest"

		inlining  "Explicit"

		defines 
		{
			"_WINDOWS"
		}

		files {
			-- Windows specific files.
			-- Header files.                                -- C files.
			"SDL/include/SDL_config_windows.h",				    
														    
			"SDL/src/audio/directsound/*.h",                    "SDL/src/audio/directsound/*.c",
			"SDL/src/audio/wasapi/*.h",						    "SDL/src/audio/winmm/*.c",
			"SDL/src/audio/winmm/*.h",						    "SDL/src/audio/wasapi/*.c",
			"SDL/src/windows/SDL_directx.h",		  		    "SDL/src/core/windows/*.c",
			"SDL/src/core/windows/*.h",						    "SDL/src/filesystem/windows/*.c",
			"SDL/src/haptic/windows/*.h",					    "SDL/src/haptic/windows/*.c",
			"SDL/src/joystick/windows/*.h",					    "SDL/src/joystick/windows/*.c",
			"SDL/src/render/direct3d11/SDL_shaders_d3d11.h",    "SDL/src/hidapi/windows/*.c",
			"SDL/src/render/direct3d/*.h",					    "SDL/src/loadso/windows/*.c",
			"SDL/src/render/SDL_d3dmath.h",					    "SDL/src/power/windows/*.c",
			"SDL/src/thread/windows/*.h",					    "SDL/src/render/direct3d11/*.c",
			"SDL/src/video/windows/SDL_vkeys.h",			    "SDL/src/render/direct3d/*.c",
			"SDL/src/video/windows/SDL_windowsclipboard.h",	    "SDL/src/render/SDL_d3dmath.c",
			"SDL/src/video/windows/SDL_windowsevents.h",	    "SDL/src/video/windows/*.c",
			"SDL/src/video/windows/SDL_windowsframebuffer.h",
			"SDL/src/video/windows/SDL_windowskeyboard.h",
			"SDL/src/video/windows/SDL_windowsmessagebox.h",
			"SDL/src/video/windows/SDL_windowsmodes.h",
			"SDL/src/video/windows/SDL_windowsmouse.h",
			"SDL/src/video/windows/SDL_windowsopengl.h",
			"SDL/src/video/windows/SDL_windowsshape.h",
			"SDL/src/video/windows/SDL_windowsvideo.h",
			"SDL/src/video/windows/SDL_windowsvulkan.h",
			"SDL/src/video/windows/SDL_windowswindow.h",
			"SDL/src/video/windows/wmmsg.h"
		}

		links {
			"setupapi",
			"winmm",
			"imm32",
			"version",
			"opengl32.lib"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} "..DynamicDir)
		}

	filter "system:macosx"
		kind          "StaticLib"
		staticruntime "on"

	filter "system:linux"
		kind          "StaticLib"
		staticruntime "on"

	filter "configurations:Debug"
		defines 
		{
			"_DEBUG"
		}
		runtime       "Debug"
		symbols       "On"

	filter "configurations:Release"
		defines 
		{
			"NDEBUG"
		}
		runtime       "Release"
		optimize      "Speed"


	filter "configurations:Dist"
		defines 
		{
			"NDEBUG"             
		}
		runtime       "Release"
		optimize      "On"


project "SDL2main"
	kind          "StaticLib"
	language      "C"
	
	systemversion "latest"

	flags 
	{
		"NoRuntimeChecks",
		"NoBufferSecurityCheck"
	}

	vectorextensions "SSE"

	location (LocationDir)
	targetdir (TargetDir)
	objdir (ObjectDir)

	files
	{
		"SDL/src/main/windows/*.c"
	}	

	includedirs
	{
		"include"
	}

	links
	{
	}

	defines {
		"_WINDOWS",
		"WIN32"
	}

	filter "configurations:Debug"
		defines 
		{
			"DEBUG"
		}
		runtime      "Debug"
		symbols      "On"

	filter "configurations:Release"
		defines 
		{
			"NDEBUG"
		}
		runtime      "Release"
		optimize     "Speed"


	filter "configurations:Dist"
		defines 
		{                           
			"NDEBUG"
		}
		runtime      "Release"
		optimize     "On"