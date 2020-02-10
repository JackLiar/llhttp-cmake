#! /bin/sh
cd llhttp && git pull && cd ..
tar cvzf llhttp-2.0.4.tar.gz cmake llhttp .gitignore CMakeLists.txt llhttp.pc.in README.md
