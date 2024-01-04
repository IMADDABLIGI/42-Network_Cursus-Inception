# Use an official image of GCC as the base image
FROM gcc:latest

# Set the working directory inside the container
WORKDIR /Users/idabligi/Desktop/Inception

# Copy the source code file into the container
COPY main.cpp .

# Compile the C++ file
RUN g++ -o app main.cpp

# Specify the command to run when the container starts
CMD ["./app"]

