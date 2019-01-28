[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

# Description

ProcessWrapper is a plugin + wrapper code for Pharo Smalltalk Win32 process execution with non-blocking stdin, stdout and stderr support. The project aims to give features similar to OSProcess, but it's not related to it in any other way. This repository contains the working plugin for Pharo 7.x.

# Installation

[//]: # (pi)
```smalltalk
Metacello new
    baseline: 'ProcessWrapper';
    repository: 'github://hernanmd/ProcessWrapper';
    load
```

# Usage Example

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
