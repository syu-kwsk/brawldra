# チャレキャラ
2019年７月１９日〜

### 目標
pythonでの機械学習
### 制作物
未定
### 進捗
7/22 pythonの機械学習を用いたsomethingをつくろう   
7/23 Rのinstall packageのinstall
```
sudo vim /etc/apt/sources.list
deb http://cran.ism.ac.jp/bin/linux/ubuntu bionic/  を最下行に書き込む
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get install r-base
sudo apt-get install r-base-dev
#R install

sudo apt-get install libcurl4-openssl-dev libxml2-dev
sudo apt-get install libpoppler-glib-dev
sudo apt-get install libpoppler-cpp-dev
# package install

chooseCRANmirror() //tokyoを選択
source("package_installer.R")
#R
```
  参考
  + [R install](https://www.trifields.jp/install-r-in-ubuntu-1000)
  + [R install(2)](http://memopad.bitter.jp/blog/2018/07/08/ubuntu-18-04-%E3%81%B8%E3%81%AE-r-3-5-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB/)
  + [package_installer.R](https://github.com/johnmyleswhite/ML_for_Hackers/blob/master/package_installer.R)
  + [packageのinstall](http://unageanu.hatenablog.com/entry/2016/01/09/175805)
  + [packageのinstall(2)](https://translate.google.com/translate?hl=ja&sl=en&u=https://stackoverflow.com/questions/47347272/error-installing-package-pdftools-in-r-server&prev=search)　　　　

7/29　１章「Rを利用する」終了　　
+ Rでのデータの読み込み
+ 不要なデータのクリーニング
+ 月ごとにデータを分割
+ ヒストグラムや折れ線グラフで可視化
