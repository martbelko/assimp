project "assimp"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"
	systemversion "latest"

	files
	{
		"include/**",
		"code/**.h",
		"code/**.c",
		"code/**.hpp",
		"code/**.cpp",
		"code/**.inl",
		"contrib/openddlparser/code/**",
		"contrib/clipper/**.hpp",
		"contrib/clipper/**.cpp",
		"contrib/Open3DGC/**.h",
		"contrib/Open3DGC/**.hpp",
		"contrib/Open3DGC/**.cpp",
		"contrib/poly2tri/**.h",
		"contrib/poly2tri/**.cc",
		"contrib/rapidjson/include/rapidjson/**.h",
		"contrib/unzip/**.h",
		"contrib/unzip/**.c",
		"contrib/zip/**.h",
		"contrib/zip/**.c"
	}

	excludes
	{
		"code/AssetLib/IFC/IFCReaderGen_4.h",
		"code/AssetLib/IFC/IFCReaderGen_4.cpp"
	}

	includedirs
	{
		".",
		"include",
		"code",
		"contrib",
		"contrib/zlib",
		"contrib/irrXML",
		"contrib/openddlparser/include",
		"contrib/rapidjson/include",
		"contrib/pugixml/src",
		"contrib/unzip",
		"contrib/zip/src"
	}

	defines
	{
		"ASSIMP_BUILD_NO_C4D_IMPORTER",
		"MINIZ_USE_UNALIGNED_LOADS_AND_STORES=0",
		"ASSIMP_IMPORTER_GLTF_USE_OPEN3DGC=1",
		"RAPIDJSON_HAS_STDSTRING=1",
		"RAPIDJSON_NOMEMBERITERATORCLASS",
		"ASSIMP_BUILD_DLL_EXPORT",
		"_SCL_SECURE_NO_WARNINGS",
		"OPENDDLPARSER_BUILD",

		"WIN32_LEAN_AND_MEAN",
		"assimp_EXPORTS"
	}

	links
	{
		"zlibstatic"
	}

	symbols "off"
	runtime "Release"
	optimize "full"

project "zlibstatic"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"
	systemversion "latest"

	files
	{
		"contrib/zlib/**.h",
		"contrib/zlib/**.hpp",
		"contrib/zlib/**.c"
	}

	excludes
	{
		"contrib/zlib/contrib/**"
	}

	sysincludedirs
	{
		"include",
		"contrib/irrXML",
		"contrib/zlib",
		"contrib/rapidjson/include",
		"contrib/pugixml/src",
		"contrib/unzip",
		"code",
		".",
	}

	includedirs
	{
		"include",
		"contrib/irrXML",
		"contrib/zlib",
		"contrib/rapidjson/include",
		"contrib/zlib/contrib/iostream"
	}

	defines
	{
		"NO_FSEEKO",
		"_CRT_SECURE_NO_DEPRECATE",
		"_CRT_NONSTDC_NO_DEPRECATE",
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
