
# アプリケーション名
[![Image from Gyazo](https://i.gyazo.com/fbf09d9ae2b0929b806ed7f3dbada278.png)](https://gyazo.com/fbf09d9ae2b0929b806ed7f3dbada278)

<br>
<br>

# アプリケーション概要
「買いたい時」に「賢く買える」アプリケーション

<br>
<br>

# URL
https://smart-buyer.onrender.com/

<br>
<br>

# テスト用アカウント
 - Basic認証ID：admin
 - Basic認証パスワード：pass29430
 - メールアドレス：test@gmail.com
 - パスワード：pass123

<br>
<br>

# 利用方法
### 検索機能
1. トップページより、ユーザーの新規登録を行う
2. 欲しい商品の正式品番を入力し、検索ボタンをクリックする
3. 連携している各ECサイトの商品情報が一覧で表示される
4. 購入する場合は、URLをクリックし、各ECサイトの商品ページへ遷移する

### お気に入り機能
1. 商品の検索後、まだお気に入り登録していない場合、「お気に入り登録」ボタンが出力される
2. 「お気に入り登録」ボタンをクリックし、お気に入り登録する。お気に入り登録した商品は、3時間毎に各ECサイトの在庫、価格データを収集する
3. マイページへ行くと、お気に入りにした商品の最新の在庫状況が一覧で表示されている
4. 必要に応じて「チャート 表示」ボタンをクリックすることで、3時間毎に収集した在庫と価格のチャート図を表示することができる

### リマインド機能
1. お気に入り登録した商品には、「リマインド登録」ボタンが出力される
2. 「リマインド登録」ボタンをクリックすると、リマインド情報入力画面へ遷移する
3. リマインド情報入力画面で、リマインド条件とリマインド方法をプルダウンより選択し、登録ボタンをクリックする
4. 3時間毎に収集される在庫、価格データに基づいて、設定したリマインド条件を満たしたとき、設定したリマインド方法でリマインド通知が実行される

<br>
<br>

# アプリケーションを作成した背景
前職の資材調達部門では、商社やECサイトから部品を購入していました。商社から入手できない品薄な部品を他の企業よりも先に入手したいため、複数のECサイトで、1日に1回など定期的に在庫の有無をチェックしていましたが、在庫が無いことがほとんどでした。もし、在庫があった場合には、最安値で購入するために複数のECサイトで価格を調査し、最安値のECサイトで購入していました。 <br> しかし、これらの在庫確認、価格調査に、1部品で10分程度かかっており、毎日調査したい部品は、10種類以上ありました。 <br> これらの経験から、いち早く入手したいがゆえの在庫確認の無駄足、各ECサイトでの価格調査などのムダを省きたいと思うようになりました。 <br> そして、連携しているECサイトでの商品情報が一覧表示される「検索機能」、在庫が復活した時に通知してくれる「リマインド機能」などを実装することにより、「買いたい時」に「賢く買える」アプリケーションを開発したい思い、開発を決意しました。


<br>
<br>

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1MKqWAkcFBolx6_V2gCy3e22MvRm1kQ-FrRIy0AiDmHE/edit#gid=1879645725

<br>
<br>

# 主なページと実装した機能の説明

| Topページ | 検索ページ |
| :--------: | :--------: |
| [![Image from Gyazo](https://i.gyazo.com/6a1ffcdfe49438cfd3deb5bff77f907c.png)](https://gyazo.com/6a1ffcdfe49438cfd3deb5bff77f907c) | [![Image from Gyazo](https://i.gyazo.com/80a762e67cc8a585b33014ca09bf03b3.png)](https://gyazo.com/80a762e67cc8a585b33014ca09bf03b3) |
| サービスの特徴が伝わりやすいように、わかりやすい言葉や画像を選択しました。さらに、連携しているECサイトを載せる事でユーザーにとって使い勝手が良くなるように工夫しました。 | 「どういったユーザーがどういう部品を検索したのか」などのデータを収集するために検索機能の使用にはユーザー新規登録を必須としました。さらに、検索バーの直下に連携ECサイトを載せる事で、「どのECサイトの検索結果が表示されるのか」をわかるようにしました。 |


| ユーザー登録ページ | ユーザー登録ページ（エラーメッセージ 有り） |
| :---: | :---: |
| [![Image from Gyazo](https://i.gyazo.com/fc812cc3437c5bdb5dd553031aac11b2.png)](https://gyazo.com/fc812cc3437c5bdb5dd553031aac11b2) | [![Image from Gyazo](https://i.gyazo.com/d937eb3f4dfeb55aeb3c499cb43f9ba6.png)](https://gyazo.com/d937eb3f4dfeb55aeb3c499cb43f9ba6) |
| 「生年月日」や「会社のカテゴリー」を必須にすることで、「どういった年齢のどういった業種のユーザーがどういった商品を探しているのか」というデータを収集でき、ユーザーをより知る事で、サービスの質向上のヒントになると考えました。 | 適切な入力していない箇所に関して、日本語のエラーメッセージが出力されるようにしました。 |


| ログインページ | ログインページ（エラーメッセージ 有り） |
| :---: | :---: |
| [![Image from Gyazo](https://i.gyazo.com/e26de4a67d3bc7c161f271c776a71c26.png)](https://gyazo.com/e26de4a67d3bc7c161f271c776a71c26) | [![Image from Gyazo](https://i.gyazo.com/98b8fbb93a42ee0daff825f4cacd3a78.png)](https://gyazo.com/98b8fbb93a42ee0daff825f4cacd3a78) |
| 最低限のユーザー情報の入力のみで、簡単にログインできるようにしました。 | 適切な入力していない箇所に関して、日本語のエラーメッセージが出力されるようにしました。 |


| 検索結果ページ（お気に入り登録 前） | 検索結果ページ（お気に入り登録 後） |
| :---: | :---: |
| [![Image from Gyazo](https://i.gyazo.com/1ec86911ce3517fdc83b0981f978beb2.png)](https://gyazo.com/1ec86911ce3517fdc83b0981f978beb2) | [![Image from Gyazo](https://i.gyazo.com/b407febf3347b8a2d14eb604ef187fe4.png)](https://gyazo.com/b407febf3347b8a2d14eb604ef187fe4) |
| 連携しているECサイトの検索結果として、商品画像や在庫数量だけでなく、ECサイトへ遷移するLinkも表示することで、ユーザーがすぐに商品を購入できるようにしました。さらに、在庫の有無が一目でわかるように在庫の表示を作成しました。 | お気に入り登録することで、白黒のチェックボックスがオレンジに変化し、お気に入りにしている状態が分かりやすいように工夫しました。 |


| リマインド登録画面 | 検索結果ページ（リマインド登録 後） |
| :---: | :---: |
| [![Image from Gyazo](https://i.gyazo.com/8006cbc31712af1bb33cccae588b74d1.png)](https://gyazo.com/8006cbc31712af1bb33cccae588b74d1) | [![Image from Gyazo](https://i.gyazo.com/3dd901a74edd289f9b7a00b1ae126eb9.png)](https://gyazo.com/3dd901a74edd289f9b7a00b1ae126eb9) |
| お気に入り登録した商品に限り、リマインドを設定することが可能になり、リマインド条件とリマインド方法をプルダウンより選択できるようにしました。 | リマインドを設定していると、白黒のチェックボックスがブルーに変化し、設定したリマインド条件とリマインド方法の内容が表示されます。リマインドの内容が表示されることで、ユーザーにとってリマインド設定の状況がわかりやすくなるように工夫しました。 |


| マイページ（チャート表示 前） | マイページ（チャート表示 後） |
| :---: | :---: |
| [![Image from Gyazo](https://i.gyazo.com/890f8099c26620f5bc250d7ec9e0e786.png)](https://gyazo.com/890f8099c26620f5bc250d7ec9e0e786) | [![Image from Gyazo](https://i.gyazo.com/4848b8ec4de6016e48af5429448f9230.png)](https://gyazo.com/4848b8ec4de6016e48af5429448f9230) |
| マイページへ移動すると、お気に入りした商品の最新の在庫状況が一覧で表示されるようにし、いつ取得したデータなのかを明確にするために、在庫表示下部にデータを取得した時刻を表示するようにしました。 | 各お気に入り商品の下部にあるチャート表示ボタンをクリックすることで、3時間毎に収集した在庫、価格データのチャート図を表示できるようにしました。 |

| お気に入り削除機能 | ユーザー情報編集機能 |
| :---: | :---: |
| [![Image from Gyazo](https://i.gyazo.com/e0eec3093b77882b853ca9011c55509b.png)](https://gyazo.com/e0eec3093b77882b853ca9011c55509b) | [![Image from Gyazo](https://i.gyazo.com/fc82ffa5edb0503abfde9227fea2ff23.png)](https://gyazo.com/fc82ffa5edb0503abfde9227fea2ff23) |
| 収集した在庫、価格データの誤削除を防止するために、お気に入り解除ボタンをクリックすると、確認ダイアログが表示されるようにしました。 | マイページ内のユーザー情報編集ボタンをクリックすると、ユーザー情報編集ページへ遷移し、登録情報を編集できるようにしました。 |


<br>
<br>

# 実装予定の機能

#### 検索機能
 - 連携ECサイト数の増加

 <br>

#### お気に入り機能
 - お気に入り登録、削除の非同期処理
 - グラフ横軸(日数)の範囲を選択できる機能（1週間、1ヶ月 など）の実装

 <br>
 
#### リマインド機能
 - リマインド登録、削除の非同期処理
 - リマインド方法の実装（LINE通知）

 <br>
 
#### その他
 - ユーザー パスワード再発行機能の実装
 - レスポンシブ対応

<br>
<br>

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/f3820a1a0eed0c60900ee1de76ad251b.png)](https://gyazo.com/f3820a1a0eed0c60900ee1de76ad251b)

<br>
<br>

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/ec15d9c85af233f20fb5e97f2e6f0384.png)](https://gyazo.com/ec15d9c85af233f20fb5e97f2e6f0384)

<br>
<br>

# 開発環境
#### フロントエンド
 - HTML
 - CSS
 - JavaScript
 - Ruby 2.6.5
 - Ruby on Rails 6.0.4.1

#### バックエンド
 - Ruby 2.6.5
 - Ruby on Rails 6.0.4.1

#### インフラ
 - render

#### テスト
 - RSpec 3.12

#### テキストエディタ
 - Visual Studio Code 1.81.1

#### タスク管理
 - GitHub


<br>
<br>

# 工夫したポイント
#### 1. 競合を意識したアプリ開発
Smart-Buyerを今後、「様々な人たちに便利に使ってもらうため」にも、価格比較サイトとして有名な「価格.com」を競合相手と想定してアプリ開発を行いました。
競合相手を設けたことで、下記のようなアプリ開発をすることができました。
1. 市場で同一のアプリは存在せず、実際にユーザーに使ってもらえるアプリ開発
2. プログラミングだけでなく、「どういった機能の実装でアクセスが伸びるか」などのビジネスを意識したアプリ開発
3. 競合の強み、弱みを分析したからこそ、Smart-Buyerの強み（UI、機能など）を意識したアプリ開発

<br>

#### 2. ユーザー目線のアプリ開発
自分や前職のチームメンバーが困っていた事や、こんな機能があったらいいなという理想を踏まえてアプリ開発を行いました。さらに前職の上司にもフェードバックをもらった事で、よりユーザー目線の意見を参考にすることができ、ユーザーにとって便利に使ってもらえるようにアプリ開発を行いました。

<br>

#### 3. サービスの質向上を踏まえたデータ収集
ユーザー新規登録における「生年月日」「会社のカテゴリー」の必須入力や「商品検索したらテーブル上に検索データが保存される仕組み」を利用し、現在使用していただいているユーザーの特性を知ることができるデータを収集できるようにしました。まずは現在使用していただいているユーザーの特性を知ることによって、今後、ユーザーに対してサービスの質向上に繋がるのではないか、と考え、ユーザーの特性を知ることに繋がるデータの収集を心がけてアプリ開発を行いました。

<br>
