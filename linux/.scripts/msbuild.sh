#!/bin/sh

MSBuild.exe /nologo /v:q "$@" | dos2unixPaths.sh | dos2unixLines.sh
