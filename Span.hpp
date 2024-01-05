#ifndef SPAN_HPP
# define SPAN_HPP

#include <vector>
#include <iostream>

class Car
{
    private:
        std::string name;
        std::string model;
        int         year;
        char        c;
    public:
        Car(std::string Name, std::string Model, int Year, char C);
        void print(){
            std::cout << name + " " + model + " " << year << " " << c << std::endl;
        }
};

#endif