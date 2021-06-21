# TeXLive-Full

[![Last Commit](https://img.shields.io/github/last-commit/FlorentinTh/TeXLive-Full?style=flat-square)](https://github.com/FlorentinTh/TeXLive-Full/commits/master) [![Release](https://img.shields.io/github/release/FlorentinTh/TeXLive-Full?style=flat-square)](https://github.com/FlorentinTh/TeXLive-Full/releases) ![Release Date](https://img.shields.io/github/release-date/FlorentinTh/TeXLive-Full?style=flat-square) [![License](https://img.shields.io/github/license/FlorentinTh/TeXLive-Full?style=flat-square)](https://github.com/FlorentinTh/TeXLive-Full/blob/master/LICENSE)

This repository contains all the build files for the Debian container with several versions of TexLive full to build LaTeX projects.

**See images on [Docker Hub](https://hub.docker.com/r/florentinth/texlive-full)**

## Authors

[**Florentin Thullier**](https://github.com/FlorentinTh) - 2019

## Usage

This image is compatible with [CircleCI](https://circleci.com/).

Here is an example of the ```.circleci/config.yml``` file :

```yml
version: 2
jobs:
  build-2019:
    docker:
      - image: florentinth/texlive-full:latest
    steps:
      - checkout
      - run:
          name: Copy Files
          command: 'cp -R ./src/* .'
      - run:
          name: Build LaTeX
          command: 'make build'
      - run:
          name: Copy Artifact
          command: |
            mkdir /tmp/artifacts;
            cp main.pdf /tmp/artifacts/;
      - store_artifacts:
          path: /tmp/artifacts
  build-2018:
    docker:
      - image: florentinth/texlive-full:2018
    steps:
      - checkout
      - run:
          name: Copy Files
          command: 'cp -R ./src/* .'
      - run:
          name: Build LaTeX
          command: 'make build'
  build-2017:
    docker:
      - image: florentinth/texlive-full:2017
    steps:
      - checkout
      - run:
          name: Copy Files
          command: 'cp -R ./src/* .'
      - run:
          name: Build LaTeX
          command: 'make build'
workflows:
  version: 2
  build_all_versions:
    jobs:
      - build-2019
      - build-2018
      - build-2017
```

## License

This project is licensed under MIT License - see the [LICENSE](LICENSE) file for details.
****