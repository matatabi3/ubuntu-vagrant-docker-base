# 概要
とにかくサクっとVagrant+Docker+PHP+MySQLで開発環境が作りたい人向けです。(Linux Mintで動作確認)
VSCodeでリモートデバッグするためのlaunch.jsonも同梱しています。
2019/03/10時点では、Ubuntu系での動作確認のみになります。

# 事前準備
[Oracle VirtualBox](https://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html) と [Vagrant](https://www.vagrantup.com/) をインストールしてください。

# 使い方
1. git clone する
2. vagrant ディレクトリまで移動する
```
$ git clone git@github.com:matatabi3/ubuntu-vagrant-docker-base.git
$ cd ubuntu-vagrant-docker-base/vagrant
```
3. Vagrant を起動する (初期状態ではCPUを4、メモリを4096MBに設定してますので、環境に合わせて適宜Vagrantfileを編集してください)
```
$ vagrant up
```
　※ ubuntu/bionic64 からのダウンロードでけっこう時間がかかります
4. Vagrant で Docker を起動する (特にエラーがなく起動できたらほぼ完了です)
```
$ vagrant ssh
vagrant@ubuntu-bionic:~$ cd share/docker
vagrant@ubuntu-bionic:~$ docker-compose build
vagrant@ubuntu-bionic:~$ docker-compose up
```
5. ブラウザから http://192.168.66.10/mysql-test.php にアクセスして「connected to mysql.」と表示されたらOKです。

# VSCodeでリモートデバッグ
拡張機能の PHP Debug をインストールしておいてください。

1. VSCode で ubuntu-vagrant-docker-base ディレクトリを開く
2. src/mysql-test.php の5行目などでブレイクポイントを設定しておく
3. F5でデバッグを起動
4. http://192.168.66.10/mysql-test.php にアクセスしてブレイクすればリモートデバッグ成功

