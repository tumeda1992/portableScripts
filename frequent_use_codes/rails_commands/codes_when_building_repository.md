# テーブル作成
```
$ rails generate model Micropost content:text user:references
```
## [型](https://qiita.com/s_tatsuki/items/900d662a905c7e36b3d4)
- references: 外部参照（参照するテーブルの単数形をフィールド名に）
- string : 文字列
- text : 長い文字列
- integer : 整数
- float : 浮動小数
- decimal : 精度の高い小数
- datetime : 日時
- timestamp : タイムスタンプ
- time : 時間
- date : 日付
- binary : バイナリデータ
- boolean : Boolean

## 子テーブルの新規レコードを作る場合
```
# has_manyの場合
Parent.children.build

# has_oneの場合 https://qiita.com/tsuchinoko_run/items/c56739c48deb91ac1e3f
Parent.build_child
```

# 画像アップロード
## やること
ユーザのプロフィール画像をアップロードするProfileImageUploaderを作る
- アップローダーを作る`rails g uploader ProfileImage`
- (任意)画像用のモデルを作る`rails g model ProfileImage user:references image:string
- [画像カラムとアップローダーを関連付ける](https://railstutorial.jp/chapters/user_microposts?version=5.1#sec-micropost_images)`
- マイグレーション`rails db:migrate`
- CarrierWave用にUploaderの設定を頑張る

## [コンソールで画像をアップロードする](https://qiita.com/rinkun/items/1ee60a8701183b1da527)
```
    Item.create(
      name: 'プロダクト１',
      image: open "#{Rails.root}/path/to/image1.jpg"
    )
```

# Tips
## [ディレクトリ構造を持ったrails generate](http://mikamisan.hatenablog.com/entry/2016/03/10/161715)
```
$ rails g controller user::hoges
create  app/controllers/user/hoges_controller.rb
```
