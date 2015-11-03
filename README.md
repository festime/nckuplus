## NCKU+
這是計劃用於讓成大同學放修課心得的論壇網站，目前還在發展和測試階段

做的過程發現不知不覺變成好像在 clone 一個知名 Rails 開源專案，對於原始想解決的問題雖然有一定程度適用，但有可能之後會整個大改版或重做...

## 特色
* Responsitive Web Design
* Markdown 文字編輯界面

## 展示圖

![首頁大圖](https://s3-ap-southeast-1.amazonaws.com/nckuplus-images-github/%E9%A6%96%E9%A0%81%E5%A4%A7%E5%9C%96.png)

![首頁小圖](https://s3-ap-southeast-1.amazonaws.com/nckuplus-images-github/%E9%A6%96%E9%A0%81%E5%B0%8F%E5%9C%96.png)

![主題內容大圖](https://s3-ap-southeast-1.amazonaws.com/nckuplus-images-github/%E4%B8%BB%E9%A1%8C%E5%85%A7%E5%AE%B9%E5%A4%A7%E5%9C%96.png)

![主題內容小圖](https://s3-ap-southeast-1.amazonaws.com/nckuplus-images-github/%E4%B8%BB%E9%A1%8C%E5%85%A7%E5%AE%B9%E5%B0%8F%E5%9C%96.png)

![文字編輯中](https://s3-ap-southeast-1.amazonaws.com/nckuplus-images-github/%E6%96%87%E5%AD%97%E7%B7%A8%E8%BC%AF%E4%B8%AD.png)

![文字編輯預覽](https://s3-ap-southeast-1.amazonaws.com/nckuplus-images-github/%E6%96%87%E5%AD%97%E7%B7%A8%E8%BC%AF%E9%A0%90%E8%A6%BD.png)

## 開發者使用
fork 下來之後執行：

```
$ bundle install
```

```
$ rake db:create
```

```
$ rake db:migrate
```

```
$ npm install
```

然後用 FB 登入網站之後下：

```
$ rake db:seed:development
```

這時候就可以看到頁面上呈現一些假資料了
