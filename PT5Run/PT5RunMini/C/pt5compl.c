#ifdef __linux__
addfiles=pt5.c;pt5.h;.vscode/c_cpp_properties.json;.vscode/launch.json;.vscode/tasks.json
compiler=/usr/bin/gcc
cargs=-fdiagnostics-color=always||-Wall||-std=c99||${fileDirname}/${fileName}||${fileDirname}/pt5.c||-o||${fileDirname}/ptprj
cwd=/usr/bin
exename=${fileDirname}/ptprj
run=${exeName}
rargs=
rwd=${fileDirname}
timeout=1000
#endif
