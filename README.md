# sphinx-ci

[![CircleCI](https://circleci.com/gh/yamamo-i/sphinx-ci.svg?style=svg)](https://circleci.com/gh/yamamo-i/sphinx-ci)

sphinxでドキュメント生成を自動化する知見をためるレポジトリ


## 試したポイント

* dockerを用いた生成環境の整備
* CI
    * Jenkinsを見据えたshell
    * circle-ci
    * travis-ci

## sphinx

* `sphinx-txt` 配下にテスト用のテキストがある

### html作成

* 以下のコマンドを発行
```sh
$ make html
```
* `build` ディレクトリ配下にhtmlが作成される

### pdf作成

* 以下のコマンドを発行
```sh
$ make latexpdf
```
* `build` ディレクトリ配下にpdfが作成される

## docker

### docker imageの作成

* rootディレクトリからdockerのイメージを作成する
```sh
$ docker build -t sphinx-ci .
$ docker images
```

### ドキュメントの生成

* dockerを用いてhtml or pdfを作成する
```sh
$ docker run --rm -v ${PWD}/sphinx-txt/:/workspace yamamoi/sphinx-ci:latest (html|latexpdf)
```
* 残課題  
    * サロゲートペアが出力できない


### Docker Image

* こちらに置いてあります
https://hub.docker.com/r/yamamoi/sphinx-ci/

## CircleCI
