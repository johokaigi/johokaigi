# Johokaigi - 情報会議 [![Build Status](https://travis-ci.org/johokaigi/johokaigi.svg?branch=master)](https://travis-ci.org/johokaigi/johokaigi)

JohoKaigi - 情報会議に関する情報をまとめているページです。  
http://johokaigi.org/

## 本番環境への反映
masterブランチに変更があると、TravisCIが自動的にgh-pagesブランチへデプロイしてくれます。

## 記事の更新
記事は https://github.com/johokaigi/johokaigi/tree/master/source/articles/items に格納されています。  
記事を編集する場合はGitHub上で編集できるのでその場で編集し、Pull Requestを作成してください。
記事を追加する場合はこのディレクトリに新しいファイルを作成してください。

### 記事追加時のフォーマットについて
ファイル名は `YYYY-MM-DD-TITLE.html.md` というフォーマットである必要があります。  
例) `2015-11-10-first-post.html.md`

また、ファイル内では以下のフォーマットに沿って記述する必要があります。  
**※dateはファイル名の日付と一致している必要があります。**

[記事ファイル内のフォーマット](https://github.com/johokaigi/johokaigi/blob/master/article_template.erb)

categoryに `eventreport` を指定すると、http://johokaigi.org/articles/categories/eventreport.html に記事が表示されます。

## Tipsの更新
Tipsは https://github.com/johokaigi/johokaigi/tree/master/source/tips/items に格納されています。  
記事を編集する場合はGitHub上で編集できるのでその場で編集し、Pull Requestを作成してください。
記事を追加する場合はこのディレクトリに新しいファイルを作成してください。

### 記事追加時のフォーマットについて
ファイル名は `TITLE.html.md` というフォーマットである必要があります。  
例) `group-work-guide.md`

また、ファイル内では以下のフォーマットに沿って記述する必要があります。  

[記事ファイル内のフォーマット](https://github.com/johokaigi/johokaigi/blob/master/tips_template.erb)

## 次回イベント情報の更新
https://github.com/johokaigi/johokaigi/blob/master/data/peatix.yml のHTMLを書き換えてください。

## スタッフの更新
スタッフ情報は https://github.com/johokaigi/johokaigi/blob/master/data/staff.yml に記述されています。YAMLなので更新時はインデントの数に注意してください。  
新しくスタッフが増えた場合はcollaboratorsに追記していく形になります。profile_image_urlは https://github.com/johokaigi/johokaigi/tree/master/source/assets/images/profile_images にアップロードした画像を参照するか、もしくは外部に保存している画像のURLを記述してください。
