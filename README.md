[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

# Table of Contents

- [Description](#description)
- [Installation](#installation)
  - [Install from CLI](#install-from-cli)
  - [Install from Pharo](#install-from-pharo)
  - [Baseline Snippet](#baseline-snippet)
- [Usage](#details)
- [Contribute](#contribute)
- [License](#license)

# Description

ProcessWrapper is a plugin + wrapper code for Pharo Smalltalk Win32 process execution with non-blocking stdin, stdout and stderr support. The project aims to give features similar to OSProcess, but it's not related to it in any other way. This repository contains the working plugin for Pharo 7.x.

# Installation

## Install from CLI

```bash
pi install ProcessWrapper
```

## Install from Pharo

[//]: # (pi)
```smalltalk
Metacello new
    baseline: 'ProcessWrapper';
    repository: 'github://hernanmd/ProcessWrapper';
    load
```

## Baseline Snippet

```smalltalk
  spec
	baseline: 'ProcessWrapper' 
	with: [ spec repository: 'github://hernanmd/ProcessWrapper/repository' ].
```

# Usage

```smalltalk
ProcessWrapper new
	useStdout;
	startWithShellCommand: 'echo hello';
	upToEnd
```

# Contribute

**Working on your first Pull Request?** You can learn how from this *free* series [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github)

If you have discovered a bug or have a feature suggestion, feel free to create an issue on Github.

If you'd like to make some changes yourself, see the following:

  - Fork this repository to your own GitHub account and then clone it to your local device
  - Edit the project classes.
  - Test ProcessWrapper.
  - Add <your GitHub username> to add yourself as author below.
  - Finally, submit a pull request with your changes!
  - This project follows the [all-contributors specification](https://github.com/kentcdodds/all-contributors). Contributions of any kind are welcome!

# License

This software is licensed under the MIT License.

Copyright Levente Uzonyi 2009-2018.
Copyright Hernán Morales, 2018-2019.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
