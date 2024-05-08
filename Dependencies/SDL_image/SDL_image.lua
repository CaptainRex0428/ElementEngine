project "SDL_image"             
	kind          "StaticLib"
	language          "C++"            
	cppdialect        "C++20"
                            
	systemversion     "latest"

	flags {
		              "NoRuntimeChecks", -- Only used on Visual Studio.
		              "NoBufferSecurityCheck"
	}

	vectorextensions  "SSE"               -- Necessary to run x32.

	location (LocationDir)
	targetdir (TargetDir)
	objdir (ObjectDir)

	includedirs
	{
		"include", 
		"%{DepIncludeDir.SDL2}",
		"%{DepIncludeDir.libpng}"
	}

	links
	{
		"SDL2",
		"SDL2main",
		"libpng"
	}

	files {
		"include/*.h",					
		"src/**.h",						"src/**.c",		
	}


	-- inlining          "Explicit"
	-- intrinsics        "Off"

	filter "system:windows"
		staticruntime "off"
		systemversion	  "latest"
		defines {"_WINDOWS"}
		links 
		{
			"setupapi",
			"winmm",
			"imm32",
			"version",
		}
		

	filter "configurations:Debug"
		defines {"DEBUG"}
		runtime       "Debug"
		symbols       "On"

	filter "configurations:Release"
		defines {"RELEASE"}
		runtime       "Release"
		optimize      "Speed"


	filter "configurations:Dist"
		defines {"Dist"}
		runtime       "Release"
		optimize      "On"