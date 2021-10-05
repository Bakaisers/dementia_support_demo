This folder is the container for the biography of Peter Twerp, born in Adelaide a long time ago.

----

## Book Build instructions

You need the program *mdbook* to build and serve the book. It can be found at https://github.com/rust-lang/mdBook. Add the binary path to your *path* or *env* variable. See below for details on installing Rust, if required.

To build the book after dst/memoir/src content has been changed, 
cd dst/memoir
mdbook serve

This builds the 'book' content in dst/memoir/book.

The memoir will then be available by fetch at http://localhost:3000/

While mdbook is running, any changes to src files will automatically trigger a rebuild of the book files. So, eg, if a new memory is added to one of the files, and the file is saved, the book will be updated immediately. 

If the change involves, say, new src files, and changes to the SUMMARY.md table of contents, it is probably better to NOT have mdbook running. This will save having any inconsistencies between the table of contents and the built chapters.

## Installing Rust
Rust installation page: https://www.rust-lang.org/tools/install
Rust home page: https://www.rust-lang.org/
Rust documentation: https://www.rust-lang.org/learn

## Install mdbook

If you just want to run mdbook, you can download the binary, and install it by adding the binary to your *path* or *env* variable.

If you want to modify the structure of the book that is created, then you will need better to download the source and compile it with Rust.

-  Download and Compile mdbook using the Rust package manager cargo (installed when Rust is installed). *cargo install mdbook*
-  Add mdbook binary to your *path* (eg /home/peter/.cargo/bin)

## Notes for developers
mdBook can be run as a standalone binary, or it can be accessed as a static C library which could be compiled into Flutter or Rust business logic. This option may give us better options for tailoring the output than just using the standalone binary. 

On the flip-side the binary does have the option of adding 'plug-ins' into mdbook to change the processing and/or output formats of the book. But I presume similar things can be done via the API.

If we end up having to use the 'web view' functionality in Flutter to show external web pages, we might as well embed mdbook into the core code as it will be able to use the web view without any extra memory or process requirements.
