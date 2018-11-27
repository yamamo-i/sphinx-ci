# sphinx-ci

[![CircleCI](https://circleci.com/gh/yamamo-i/sphinx-ci.svg?style=svg)](https://circleci.com/gh/yamamo-i/sphinx-ci)

sphinxでドキュメント生成を自動化する知見をためるレポジトリ


## 試したポイント

* dockerを用いた生成環境の整備
* CI
    * Jenkinsを見据えたshell
    * circle-ci(本レポジトリではこちらを試している)

## sphinx

* `sphinx-txt` 配下にテスト用のテキストがある

### html作成

* 以下のコマンドを発行
```sh
$ make html
```
* `build` ディレクトリ配下にhtmlが作成される

### pdf作成

* htmlファイルを変換するためhtml作成実行後、以下のコマンドを発行
```sh
$ wkhtmltopdf build/html/index.html build/output.pdf
```
* `build` ディレクトリ配下にpdfが作成される

## docker

* sphinxやwkhtmltopdfがない場合はdocker環境を用意してある
https://hub.docker.com/r/yamamoi/sphinx-ci/
	* `wkhtmltopdf` タグが対応している

### docker imageの作成

* rootディレクトリからdockerのイメージを作成する
```sh
$ docker build -t sphinx-ci .
$ docker images
```

### Docker Image

* こちらに置いてあります

## CircleCI

* Pull Requestを出すとCircleCIが自動でdocsを出力する
* Pull Requestのコメントに生成したドキュメントURLが自動で記載されます
