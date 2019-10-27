## New Project

This is a new project that was built with the KMT.ProjectStarterKit. Consider this a work in progress and the readme will get updated when there is more to share.

## Building the project

This module contains a build.ps1 script in the root of the project that will install the needed dependencies and build the project. The build artifact will be placed in the output folder.

    ./build.ps1

The build will run script analyzer and Pester tests for the project. Please run a local build of the project before submitting any pull requests.

## Running the project

If you are working with the source, running the `build.ps1` will also import the module into the current sessions. All the commands should be available.

If you need to do a manual import, the module will be placed in the output folder after the build finishes.
