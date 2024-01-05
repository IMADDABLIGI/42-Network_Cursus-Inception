#include "Span.hpp"

Car::Car(std::string Name, std::string Model, int Year, char C):name(Name), model(Model), year(Year), c(C)
{
    std::cout << "Constructor Called" << std::endl;
}