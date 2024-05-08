#pragma once

// -------------Element Used------------

#include "ElementEditor_Definition.h"

// -------------------------------------

namespace Element
{
	class ENGINE_API ElementEditor
	{
	public:
		ElementEditor();
		virtual ~ElementEditor();

		virtual void Run();
	};

	ElementEditor* CreateApplication();
}
