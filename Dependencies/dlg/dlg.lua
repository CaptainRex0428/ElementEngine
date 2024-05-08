project "dlg"             
	kind          "SharedLib"
	language          "C++"       
	cppdialect        "C++20"
                            
	systemversion     "latest"

	flags {
		-- "NoRuntimeChecks",
		-- "NoBufferSecurityCheck"
	}

	location (LocationDir)
	targetdir (TargetDir)
	objdir (ObjectDir)

	postbuildcommands
	{
		("{COPY} %{cfg.buildtarget.relpath} "..DynamicDir)
	}

	includedirs      
    {
        "include"
    }

	files {
		"src/**.c"		
	}
		
	--inlining    "Explicit"             -- General optimisation options.
	--intrinsics  "Off"

	filter "system:windows"
		staticruntime "Off"
		systemversion "latest"
		defines {"WINDOWS"}

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
