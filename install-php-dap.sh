#!/usr/bin/env bash

cd ./lua/rg/dap
git clone git@github.com:Rocco-Gossmann/vscode-php-debug.git
cd vscode-php-debug
npm install && npm run build


