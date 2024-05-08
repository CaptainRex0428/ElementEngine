project "harfbuzz"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"

    files
    {
        "src/graph/gsubgpos-context.cc",        "src/hb-aat-layout.cc",
        "src/hb-aat-map.cc",                    "src/hb-blob.cc",
        "src/hb-buffer-serialize.cc",           "src/hb-buffer-verify.cc",
        "src/hb-buffer.cc",                     "src/hb-cairo-utils.cc",
        "src/hb-cairo.cc",                      "src/hb-common.cc",
        "src/hb-coretext.cc",                   "src/hb-directwrite.cc",
        "src/hb-draw.cc",                       "src/hb-face-builder.cc",
        "src/hb-face.cc",                       "src/hb-fallback-shape.cc",
        "src/hb-font.cc",                       "src/hb-ft.cc",
        "src/hb-gdi.cc",                        "src/hb-glib.cc",
        "src/hb-gobject-structs.cc",            "src/hb-graphite2.cc",
        "src/hb-icu.cc",                        "src/hb-map.cc",
        "src/hb-number.cc",                     "src/hb-ot-cff1-table.cc",
        "src/hb-ot-cff2-table.cc",              "src/hb-ot-color.cc",
        "src/hb-ot-face.cc",                    "src/hb-ot-font.cc",
        "src/hb-ot-layout.cc",                  "src/hb-ot-map.cc",
        "src/hb-ot-math.cc",                    "src/hb-ot-meta.cc",
        "src/hb-ot-metrics.cc",                 "src/hb-ot-name.cc",
        "src/hb-ot-shape-fallback.cc",          "src/hb-ot-shape-normalize.cc",
        "src/hb-ot-shape.cc",                   "src/hb-ot-shaper-arabic.cc",
        "src/hb-ot-shaper-default.cc",          "src/hb-ot-shaper-hangul.cc",
        "src/hb-ot-shaper-hebrew.cc",           "src/hb-ot-shaper-indic-table.cc",
        "src/hb-ot-shaper-indic.cc",            "src/hb-ot-shaper-khmer.cc",
        "src/hb-ot-shaper-myanmar.cc",          "src/hb-ot-shaper-syllabic.cc",
        "src/hb-ot-shaper-thai.cc",             "src/hb-ot-shaper-use.cc",
        "src/hb-ot-shaper-vowel-constraints.cc","src/hb-ot-tag.cc",
        "src/hb-ot-var.cc",                     "src/hb-outline.cc",
        "src/hb-paint-extents.cc",              "src/hb-paint.cc",
        "src/hb-set.cc",                        "src/hb-shape-plan.cc",
        "src/hb-shape.cc",                      "src/hb-shaper.cc",
        "src/hb-static.cc",                     "src/hb-style.cc",
        "src/hb-subset-cff-common.cc",          "src/hb-subset-cff1.cc",
        "src/hb-subset-cff2.cc",                "src/hb-subset-input.cc",
        "src/hb-subset-instancer-solver.cc",    "src/hb-subset-plan.cc",
        "src/hb-subset-repacker.cc",            "src/hb-subset.cc",
        "src/hb-ucd.cc",                        "src/hb-unicode.cc",
        "src/hb-uniscribe.cc",                  "src/hb-wasm-api.cc",
        "src/hb-wasm-shape.cc"
    }

    includedirs
    {
        "src",
        "%{DepIncludeDir.freetype}"
    }

    links
    {
        "freetype"
    }

    defines
	{
        "_CRT_SECURE_NO_WARNINGS",
        "TTF_USE_HARFBUZZ=1",
        "FT_CONFIG_OPTION_USE_HARFBUZZ",
        "HAVE_FREETYPE"
	}

    flags
    {
        -- "NoRuntimeChecks", -- Only used on Visual Studio.
		-- "NoBufferSecurityCheck"
    }

    -- vectorextensions  "SSE"               -- Necessary to run x32.

    buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus", "/bigobj" }

    warnings "off"

    location (LocationDir)
    targetdir (TargetDir)
    objdir (ObjectDir)

    -- inlining    "Explicit"
	-- intrinsics  "Off"

    filter "system:windows" 
        -- staticruntime "Off"
        systemversion "latest"
        defines { "_WINDOWS"}

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"
        defines { "_DEBUG" }

    filter "configurations:Release"
        runtime "Release"
        optimize "On"
        symbols "On"
        defines { "RELEASE","NDEBUG" }

    filter "configurations:Dist"
        runtime "Release"
        optimize "On"
        symbols "Off"
        defines { "DIST","NDEBUG" }