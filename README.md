# Starfield Reverse Engineering vcpkg Registry

## CommonLibSF

[![VCPKG_VER](https://img.shields.io/static/v1?label=vcpkg%20registry&message=2023-09-15.4&color=green&style=flat)](https://github.com/Starfield-Reverse-Engineering/Starfield-RE-vcpkg)

### Including CommonLibSF in your project

#### Using the CommonLibSF plugin template

A plugin template is provided at https://github.com/Starfield-Reverse-Engineering/CLibSFPluginTemplate. Clone the repo and run the project setup script to get started developing your plugin without having to worry about setting things up.

#### Starting from scratch

CommonLibSF is available as a vcpkg port. To add it to your project,

1. Create a `vcpkg-configuration.json` file in your project root (next to `vcpkg.json`) with the following OR append to your existing `vcpkg.json`:

```json
{
  "default-registry": {
    "kind": "git",
    "repository": "https://github.com/microsoft/vcpkg",
    "baseline": "d99b6930b920d85dd4e1edbac37ecb3f354185c0"
  },
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/Starfield-Reverse-Engineering/Starfield-RE-vcpkg",
      "baseline": "8b74f5adf3e4ddeb6a2fb785822725c2ad99722d",
      "packages": ["commonlibsf"]
    }
  ]
}
```

2. Add CommonLibSF to the `"dependencies"` key in `vcpkg.json`:

```json
{
  "dependencies": ["commonlibsf"]
}
```

3. Add the following to your `CMakeLists.txt`:

```cmake
find_package(CommonLibSF CONFIG REQUIRED)
add_commonlibsf_plugin(${PROJECT_NAME} AUTHOR AuthorName SOURCES ${headers} ${sources})
```
