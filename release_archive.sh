#! /bin/sh
cd llhttp && git pull origin release && cd ..
tar cvzf llhttp-2.2.0.tar.gz cmake llhttp .gitignore CMakeLists.txt llhttp.pc.in README.md
