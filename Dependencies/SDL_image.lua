project "SDL_image"             
	kind          "StaticLib"
	language          "C++"            
	cppdialect        "C++20"

	-- vectorextensions  "SSE"

	location (LocationDir)
	targetdir (TargetDir)
	objdir (ObjectDir)

	includedirs
	{
		"SDL_image/include", 
		"%{DepIncludeDir.SDL2}",
		"%{DepIncludeDir.libpng}"
	}

	links
	{
		"SDL2",
		"SDL2main",
		"libpng"
	}

	defines
	{
		"LOAD_PNG",
		"LOAD_TGA"
	}

	files {
		"SDL_image/include/*.h",					
		"SDL_image/src/**.h",						"SDL_image/src/**.c",		
	}

	-- inlining          "Explicit"
	-- intrinsics        "Off"

	filter "system:windows"
		staticruntime "off"
		systemversion "latest"
		defines {"_WINDOWS"}
		links 
		{
			"setupapi",
			"winmm",
			"imm32",
			"version",
		}
		

	filter "configurations:Debug"
		defines {"_DEBUG"}
		runtime       "Debug"
		symbols       "On"

	filter "configurations:Release"
		defines {"_RELEASE","NDEBUG"}
		runtime       "Release"
		optimize      "Speed"


	filter "configurations:Dist"
		defines {"_Dist","NDEBUG"}
		runtime       "Release"
		optimize      "On"