project "Glad"
    kind "StaticLib"
    language "C"

    files
    {
        "include/glad/glad.h",
        "include/KHR/khrplatform.h",
        "src/glad.c"
    }

    includedirs
    {
        "include"
    }

    location (LocationDir)
    targetdir (TargetDir)
    objdir (ObjectDir)

    --postbuildcommands
    --{
     --("{COPY} %{cfg.buildtarget.relpath} "..DynamicDir)
    --}

  filter "system:windows"
    systemversion "latest"
    staticruntime "off"
    defines{"_WINDOWS"}

	
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
    defines{"_DEBUG"}
	
	filter "configurations:Release"
		runtime "Release"
		optimize "Speed"
    defines{"NDEBUG"}
    
  filter "configurations:Dist"
    runtime "Release"
    optimize "on"
    defines{"NDEBUG"}