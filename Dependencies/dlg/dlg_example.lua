project "dlg_example"             
	kind          "ConsoleApp"
	language          "C++"           
	cppdialect        "C++20"

	includedirs      
    {
        "include"
    }

	files 
	{
		"docs/examples/example.cpp"		
	}

	links
   	{
    	"dlg"
   	}

   	location (LocationDir)
	targetdir (EXEDir)
	objdir (ObjectDir)
		
	inlining    "Explicit"
	intrinsics  "Off"

	filter "system:windows"
        systemversion "latest"
        defines { "WINDOWS" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"
        defines { "DEBUG" }

    filter "configurations:Release"
        runtime "Release"
        optimize "On"
        symbols "On"
        defines { "RELEASE" }

    filter "configurations:Dist"
        runtime "Release"
        optimize "On"
        symbols "Off"
        defines { "DIST" }
