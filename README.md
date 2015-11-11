JohoKaigi - 情報会議に関する情報をまとめているページです。

# ステータス
[![Build Status](https://travis-ci.org/htomine/johokaigi.svg?branch=master)](https://travis-ci.org/htomine/johokaigi)

# 本番環境への反映
masterブランチへpushすると、TravisCIが自動的にgh-pagesブランチへデプロイしてくれます。

# 記事の編集・追加
記事は https://github.com/htomine/johokaigi/tree/master/source/articles/items に格納されています。  
記事を編集する場合はGitHub上で編集できるのでその場で編集し、Pull Requestを作成してください。
記事を追加する場合はこのディレクトリに新しいファイルを作成してください。

## 記事追加時のフォーマットについて
ファイル名は `YYYY-MM-DD-TITLE.html.md` というフォーマットである必要があります。  
例) `2015-11-10-first-post.html.md`

また、ファイル内では以下のフォーマットに沿って記述する必要があります。  
**※dateはファイル名の日付と一致している必要があります。**

```
---
title: 記事のタイトル
date: YYYY-MM-DD HH:MM (ファイル名の日付とそろえること。時間は自由。)
description: (検索結果に表示する説明文です。250文字以内でかんたんな説明を記述してください。)
author: (https://github.com/htomine/johokaigi/blob/master/data/humans.yml のauthorsにあるnameを記入してください)
og_image_url: (og:imageに特別な指定がない場合は行ごと削除してください)
category: eventreport (イベントレポート以外の記事の場合は行ごと削除してください)
---

〜ここに本文を入力〜

```

categoryに `eventreport` を指定すると、http://johokaigi.org/articles/categories/eventreport.html に記事が表示されます。  
上記以外のカテゴリを指定しても現在はなにも起きません。

# 次回イベント情報の更新
https://github.com/htomine/johokaigi/blob/master/data/peatix.yml のHTMLを書き換えてください。
