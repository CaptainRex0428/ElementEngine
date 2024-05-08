
#include "Engine.h"

#include <iostream>

class Sandbox : public Engine::Application
{
public:
	Sandbox() {};
	virtual ~Sandbox() {};

	virtual void Run() override 
	{
		std::cout << "Hello Sandbox!" << std::endl;
	};
};

Engine::Application* Engine::CreateApplication()
{
	return new Sandbox();
}