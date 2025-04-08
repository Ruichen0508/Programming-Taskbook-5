#ifdef __linux__
addfiles=pt5.cpp;pt5.hpp;.vscode/c_cpp_properties.json;.vscode/launch.json;.vscode/tasks.json
compiler=/usr/bin/g++
cargs=-fdiagnostics-color=always||-Wall||-std=c++14||${fileDirname}/${fileName}||${fileDirname}/pt5.cpp||-o||${fileDirname}/ptprj
cwd=/usr/bin
exename=${fileDirname}/ptprj
run=${exeName}
rargs=
rwd=${fileDirname}
timeout=1000
#endif
