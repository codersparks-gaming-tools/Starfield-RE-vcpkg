# Starfield Reverse Engineering vcpkg Registry

## CommonLibSF

### Including CommonLibSF in your project

Add the following to your `vcpkg-configuration`:

```json
"registries": [
  {
    "kind": "git",
    "repository": "https://github.com/Starfield-Reverse-Engineering/Starfield-RE-vcpkg",
    "baseline": "<SHA of latest commit to the above repository>",
    "packages": [
      "commonlibsf"
    ]
  }
]
```

And the following to your `CMakeLists.txt`:

```cmake
find_package(CommonLibSF CONFIG REQUIRED)
target_link_libraries(${PROJECT_NAME}
        PRIVATE
        CommonLibSF::CommonLibSF)
```
