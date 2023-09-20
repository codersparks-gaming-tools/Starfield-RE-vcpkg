# Starfield Reverse Engineering vcpkg Registry

## CommonLibSF

[![VCPKG_VER](https://img.shields.io/static/v1?label=vcpkg%20registry&message=2023-09-20.1&color=green&style=flat)](https://github.com/Starfield-Reverse-Engineering/Starfield-RE-vcpkg)

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
    "baseline": "4cfabe769eaceb209ea37267e8c50c43b86a4a7b"
  },
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/Starfield-Reverse-Engineering/Starfield-RE-vcpkg",
      "baseline": "7c74372fe825f45d0d833a3c3bdf108f0e2e8e1a",
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
