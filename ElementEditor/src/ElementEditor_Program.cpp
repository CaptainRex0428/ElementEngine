#include "ElementEditor_Program.h"

#include "ScrewExtend.h"
#include "ElementEditorMicroConfig.h"

namespace Element
{
	ElementEditor::ElementEditor()
	{
	}

	ElementEditor::~ElementEditor()
	{
	}

	void ElementEditor::Run()
	{
		ScrewExtend::Print();

		ScrewExtend::Log::Init();

		ELMG_TERMINAL_INFO("Termianl Logger LINKED!");
		ELMG_CLIENT_WARN("Client Logger LINKED!");
	}
}
