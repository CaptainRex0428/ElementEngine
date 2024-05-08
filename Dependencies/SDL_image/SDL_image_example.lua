project "showimage"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++20"
   staticruntime "off"

   files { "examples/showimage.c"}

   includedirs
   {
      "%{DepIncludeDir.SDL2}",
	  "%{DepIncludeDir.SDL_image}"
   }

   links
   {
      "SDL2",
      "SDL2main",
	  "SDL_image"
   }

   location (LocationDir)
   targetdir (EXEDir)
   objdir (ObjectDir)

   filter "system:windows"
       systemversion "latest"
       defines { "WINDOWS" }

   filter "configurations:Debug"
       defines { "DEBUG" }
       runtime "Debug"
       symbols "On"

   filter "configurations:Release"
       defines { "RELEASE" }
       runtime "Release"
       optimize "Speed"
       symbols "On"

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"

project "showanim"
	   kind "ConsoleApp"
	   language "C++"
	   cppdialect "C++20"
	   staticruntime "off"
	
	   files { "examples/showanim.c"}
	
	   includedirs
	   {
		  "%{DepIncludeDir.SDL2}",
		  "%{DepIncludeDir.SDL_image}"	  
	   }
	
	   links
	   {
		  "SDL2",
		  "SDL2main",
		  "SDL_image"
	   }
	
	   location (LocationDir)
	   targetdir (EXEDir)
	   objdir (ObjectDir)
	
	   filter "system:windows"
		   systemversion "latest"
		   defines { "WINDOWS" }
	
	   filter "configurations:Debug"
		   defines { "DEBUG" }
		   runtime "Debug"
		   symbols "On"
	
	   filter "configurations:Release"
		   defines { "RELEASE" }
		   runtime "Release"
		   optimize "Speed"
		   symbols "On"
	
	   filter "configurations:Dist"
		   defines { "DIST" }
		   runtime "Release"
		   optimize "On"
		   symbols "Off"