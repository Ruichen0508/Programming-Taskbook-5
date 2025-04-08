# Programming-Taskbook-5
This repository contains the components and code for the Programming Taskbook 5 (PT5), a cross-platform electronic taskbook designed for learning programming with a focus on C++ and parallel programming using MPI. The taskbook is designed to help students practice algorithms, data structures, and parallel computing techniques in a hands-on manner.

# Overview
Programming Taskbook 5 (PT5) is an upgraded version of the previous PT4, supporting both Windows and Linux platforms. This version simplifies the interaction between the task programs and the core of the taskbook by adopting a console-based interface. The taskbook is primarily focused on supporting C++ tasks, particularly those involving the Standard Template Library (STL) and parallel matrix algorithms using MPI.

# Key Features
- **Cross-Platform Support** : PT5 supports both Windows and Linux operating systems.
- **Task Constructor** : A C++ task constructor that facilitates the creation and adaptation of new tasks.
- **MPI Programming** : Support for parallel programming tasks using MPI.
- **STL Library** : Exercises related to the C++ Standard Template Library (STL), including tasks related to iterators, sequences, algorithms, and associative containers.
- **Console Interface** : A simple console-based user interface that displays results using text-based graphics and supports UTF-8 encoding.
- **Dynamic Linking** : The system uses dynamic libraries (DLLs for Windows and SO files for Linux) for task execution.

# Project Structure
The project is organized into the following directories:
- **.pt/** : Contains configuration files related to the PT5 taskbook setup.
- **.vscode/** : Contains Visual Studio Code settings for the project.
- **backup/** : Stores backup files for previous versions or experiments.
- **C/** : Contains C source files for tasks and related components.
- **CPP/** : Contains C++ source files for tasks involving STL and MPI programming.
- **CPPMPI/** : Contains MPI-related C++ source files for parallel matrix tasks.
- **lib/** : Contains dynamic libraries (DLL/SO) required for task execution.
- **Graph/** : Contains code related to graph theory and algorithms.

# Installation
To install and use PT5 on your local machine:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Ruichen0508/Programming-Taskbook-5.git
   ```
2. **Install dependencies:**:
   For Linux:
   ```bash
   sudo apt-get install build-essential mpi-default-bin mpi-default-dev
   ```
   For Windows, ensure you have MPI installed, such as Microsoft MPI.
3. **Build the project**:
   Navigate to the project directory:
   ```bash
   cd ProgrammingTaskbook-5
   ```
   For Linux, use CMake to configure and build the project:
   ```bash
   mkdir build
   cd build
   cmake ..
   make
   ```
4. **Run the taskbook**:
   For Linux:
   ```bash
   ./pt5run <task_name> cpp
   ```
   For Windows, run pt5run.exe in the command prompt:
   ```bash
   pt5run.exe <task_name> cpp
   ```
