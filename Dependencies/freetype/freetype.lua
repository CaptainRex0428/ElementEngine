project "freetype"             
	kind          "StaticLib"
	language          "C++"             
	cppdialect        "C++20" 

	flags {
		"NoRuntimeChecks",
		"NoBufferSecurityCheck"
	}

	-- vectorextensions  "SSE"

	location (LocationDir)
	targetdir (TargetDir)
	objdir (ObjectDir)

	includedirs
    {
		"src",
        "include",
		"%{DepIncludeDir.dlg}"
    }

	links
	{
		"dlg"
	}

	files {
		"src/autofit/autofit.c", 	"src/bdf/bdf.c", 		"src/cff/cff.c", 		"src/base/ftbase.c",
        "src/base/ftbitmap.c", 		"src/cache/ftcache.c", 	"src/base/ftfstype.c", 	"src/base/ftgasp.c",
        "src/base/ftglyph.c", 		"src/gzip/ftgzip.c", 	"src/base/ftinit.c", 	"src/lzw/ftlzw.c",
        "src/base/ftstroke.c", 		"src/base/ftsystem.c", 	"src/smooth/smooth.c", 	"src/base/ftbbox.c",
        "src/base/ftfntfmt.c", 		"src/base/ftmm.c", 		"src/base/ftpfr.c", 	"src/base/ftsynth.c",
        "src/base/fttype1.c", 		"src/base/ftwinfnt.c", 	"src/base/ftlcdfil.c", 	"src/base/ftgxval.c",
        "src/base/ftotval.c", 		"src/base/ftpatent.c", 	"src/pcf/pcf.c", 		"src/pfr/pfr.c",
        "src/psaux/psaux.c", 		"src/pshinter/pshinter.c", 						"src/psnames/psmodule.c",
        "src/raster/raster.c", 		"src/sfnt/sfnt.c", 		"src/truetype/truetype.c",
        "src/type1/type1.c", 		"src/cid/type1cid.c", 	"src/type42/type42.c", 	"src/winfonts/winfnt.c",
		"src/pshinter/pshinter.c",	"src/psnames/psnames.c",  						"src/raster/raster.c",
  		"src/sdf/sdf.c",			"src/smooth/smooth.c", 	"src/svg/*.c"
	}

	inlining    "Explicit"
	intrinsics  "Off"

	defines{
		"_CRT_SECURE_NO_WARNINGS",
		"FT2_BUILD_LIBRARY",
		"FT_PUBLIC_FUNCTION_ATTRIBUTE=",
		"FT_CONFIG_OPTION_ERROR_STRINGS"
	}

	filter "system:windows" 
        staticruntime "Off"
        systemversion "latest"
        defines { "_WINDOWS" }
		files { "builds/windows/ftdebug.c"}

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