# llhttp-cmake
llhttp cmake support

Currently only guarantees Linux building procedure is valid. Since I don't work on Windows nor macOS, I've got no knowledge about these two os.

## Usage
```shell
git clone --recurse-submodules git@github.com:JackLiar/llhttp-cmake.git # requires git version 2.13+
cd llhttp-cmake
mkdir build && cd build
cmake ..
make && make package
```