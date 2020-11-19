#! /bin/sh
cd llhttp && git pull origin release && cd ..
tar cvzf llhttp-2.1.3.tar.gz cmake llhttp .gitignore CMakeLists.txt llhttp.pc.in README.md
