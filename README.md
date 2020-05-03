# AnayumeApp
現在ポートフォリオとして作成中の夢をテーマとしたSNSです。  
ユーザーが自分自身の夢に関する投稿をすることができ、返信やいいねをつけることができます。  
また、Google Mapで場所を検索し、行きたい場所のリストとして保存することができます。

![スクリーンショット 2020-04-26 11 34 26](https://user-images.githubusercontent.com/35623368/80900043-692fe980-8d4c-11ea-8a39-210d6e3cbac8.png)

![スクリーンショット 2020-04-26 11 34 48](https://user-images.githubusercontent.com/35623368/80900122-7056f780-8d4c-11ea-9362-adab344cb149.png)

## URL
- https://momonoki1990.com  
トップページのおためしログインをクリックすることで、ゲストアカウントとしてログインできます。

## 使用技術
- Ruby 2.6.3, Rails 5.1.6
- Sass,Bootstrap4,JQuery
- Docker,Docker-compose
- nginx,puma
- AWS (VPC,EC2,RDS for PostgreSQL,S3,Route53,ACM,ALB)
- Circle CI
- git, Github
- Google Maps API

## 機能一覧
- ユーザー登録、ログイン、編集、一覧機能
- 投稿機能、画像投稿機能、削除機能
- 投稿画像、プロフィール画像プレビュー機能
- 投稿一覧、投稿詳細表示機能
- ページネーション機能(kaminari, jScroll)
- いいね、フォロー機能(Ajax)
- 返信機能
- ユーザー一覧、フォローフォロワー一覧
- 検索機能(投稿)
- 地図検索、リスト保存機能
