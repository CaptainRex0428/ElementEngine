project "SDL_ttf"
    kind "SharedLib"
    language "C++"
    cppdialect "C++20"

    files
    {
        "SDL_ttf/SDL_ttf.c"
    }

    includedirs
    {
        "SDL_ttf",
        "%{DepIncludeDir.freetype}",
        "%{DepIncludeDir.harfbuzz}",
        "%{DepIncludeDir.SDL}"
    }

    links
    {
        "freetype",
        "harfbuzz",
        "SDL",
		"SDL_main"
    }

    defines
	{
        "_CRT_SECURE_NO_WARNINGS"
	}

    flags
    {
        -- "NoRuntimeChecks",
		-- "NoBufferSecurityCheck"
    }

    -- vectorextensions  "SSE"               -- Necessary to run x32.

    buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus"}

    -- warnings "Off"

    location (LocationDir)
    targetdir (TargetDir)
    objdir (ObjectDir)

    -- inlining    "Explicit"
	-- intrinsics  "Off"

    postbuildcommands
	{
		("{COPY} %{cfg.buildtarget.relpath} "..DynamicDir)
	}

    filter "system:windows" 
        staticruntime "Off"
        systemversion "latest"
        defines { "_WINDOWS" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"
        defines { "_DEBUG" }

    filter "configurations:Release"
        runtime "Release"
        optimize "On"
        symbols "On"
        defines { "_RELEASE","NDEBUG" }

    filter "configurations:Dist"
        runtime "Release"
        optimize "On"
        symbols "Off"
        defines { "_DIST","NDEBUG" }