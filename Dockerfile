# Use an official image of GCC as the base image
FROM gcc:latest

# Set the working directory inside the container
WORKDIR /Users/idabligi/Desktop/DC

# Copy the source code file into the container
COPY *.cpp /Users/idabligi/Desktop/DC
COPY  Span.hpp /Users/idabligi/Desktop/DC

# Compile the C++ file
RUN g++ -o app main.cpp Span.cpp

# Specify the command to run when the container starts
CMD ["./app"]

