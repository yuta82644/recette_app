
## アプリ概要
- アプリ名: Recette

## 開発言語
- Ruby 3.0.1
- Ruby on Rails 6.1.6

## 使用技術
- devise
- Ajaxコメント機能
- rails_admin
- cancancan
- ransack
- simple_calendar
- cocoon
- AWS (EC2 C3)

# 実行手順

```
$ https://github.com/yuta82644/recette_app.git
$ cd recette_app
$ bundle install
$ rails db:create && rails db:migrate
$ rails s

```

## カタログ設計

https://docs.google.com/spreadsheets/d/1htXME0jdYTyiM7pk6H_RzcsobPPdnlERCT_RuI8GQ0Y/edit#gid=782464957
## テーブル定義書

https://docs.google.com/spreadsheets/d/1htXME0jdYTyiM7pk6H_RzcsobPPdnlERCT_RuI8GQ0Y/edit#gid=2020033787

## ワイヤーフレーム

[FigmaURL]
https://www.figma.com/file/5hD1seSZD5aIgGdpbqotrJ/recette%2F%E3%83%AF%E3%82%A4%E3%83%A4%E3%83%BC%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0?type=design&node-id=0%3A1&mode=design&t=enRUV40Kzr9lKN0C-1

[スクリーンショット]
<img width="833" alt="スクリーンショット 2023-08-19 11 25 35" src="https://github.com/yuta82644/recette_app/assets/130124114/67b903be-21d4-4318-9b5f-e16a32f29b7d">

## ER図
[スクリーンショット]
<img width="710" alt="スクリーンショット 2023-08-19 9 51 51" src="https://github.com/yuta82644/recette_app/assets/130124114/0c2ba0b3-7b77-413c-b84a-7584ce973a31">

## 画面遷移図

[スクリーンショット]
<img width="864" alt="スクリーンショット 2023-08-19 10 50 10" src="https://github.com/yuta82644/recette_app/assets/130124114/ad881c74-01f1-4265-9e3e-12afc3a52beb">
