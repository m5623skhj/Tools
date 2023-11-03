@echo off

SET INPUT_PATH=.\ input.proto
SET OUTPUT_PATH=.\
SET OUTPUT_FILE_NAME=%OUTPUT_PATH%

if "%OUTPUT_FILE_NAME%" == "%OUTPUT_PATH%"
(
    set OUTPUT_FILE_NAME=
)

:: C++
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --cpp_out=%OUTPUT_PATH% --grpc_out=%OUTPUT_PATH% --plugin=protoc-gen-grpc=grpc_cpp_plugin.exe %OUTPUT_FILE_NAME%

:: Java
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --java_out=%OUTPUT_PATH% --grpc_out=%OUTPUT_PATH% %OUTPUT_FILE_NAME%

:: Python
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --python_out=%OUTPUT_PATH% %OUTPUT_FILE_NAME%

:: Go
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --go_out=%OUTPUT_PATH% %OUTPUT_FILE_NAME%

:: C#
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --csharp_out=%OUTPUT_PATH% --grpc_out=%OUTPUT_PATH% %OUTPUT_FILE_NAME%

:: Ruby
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --ruby_out=%OUTPUT_PATH% %OUTPUT_FILE_NAME%

:: Dart
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --dart_out=%OUTPUT_PATH% %OUTPUT_FILE_NAME%

:: JavaScript (Node.js)
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --js_out=import_style=commonjs,binary:%OUTPUT_PATH% %OUTPUT_FILE_NAME%

:: PHP
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --php_out=%OUTPUT_PATH% %OUTPUT_FILE_NAME%

:: Objective-C
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --objc_out=%OUTPUT_PATH% %OUTPUT_FILE_NAME%

:: Swift
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --swift_out=%OUTPUT_PATH% %OUTPUT_FILE_NAME%

:: Kotlin
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --kotlin_out=%OUTPUT_PATH% %OUTPUT_FILE_NAME%

:: Rust
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --rust_out=%OUTPUT_PATH% %OUTPUT_FILE_NAME%

:: Elm
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --elm_out=%OUTPUT_PATH% %OUTPUT_FILE_NAME%

:: Crystal
::@call %PROTOC_EXE_PATH% -I %INPUT_PATH% --crystal_out=%OUTPUT_PATH% %OUTPUT_FILE_NAME%

pause