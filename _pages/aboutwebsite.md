---
title: "About the website"
layout: textlay
excerpt: "About the website."
sitemap: false
permalink: /aboutwebsite.html
---

### Customization
Now let's make this *your* website. 

First, go to the `news.ylm`, `publist.ylm`, and `team.ylm` files in the `_data` folder and insert your own data into the data fields. Watch out:  [Jekyll](https://jekyllrb.com) is quite strict about extra or missing spaces etc. Adhere to the format. In the beginning, test each change: commit, push, and check the published website.

For publications, you can add a "1" in the highlight field, then it will be featured prominently. You can add important  news items (red, "news1"), and less important  news items (blue, "news2").

For the news items, just keep adding them. The first 10 will be displayed on the 'home' page.

For the `team.ylm` file

Next, change the content of all files in the `_pages` folder.  To change the title in the homepage, go to `homelay.html` in the `_layout` folder.

Lastly, change the footer and perhaps header appropriately (in `_include`).

You might also want to change the style or theme. I imported style files (in sass) from Bootstrap/Bootwatch, you can replace them with your own (in the `_sass directory`). For small changes, just work on the override stuff in the `main.sass` file in the `CSS` folder. Or change some variables in the `_variables.sass` file, like the background color etc. 

As said, [Jekyll](https://jekyllrb.com) takes all the markdown and data files, and creates beautiful `html` files in the `_site` folder.In the end, either upload these files  to your server, or buy yourself a domain and check the instructions on github on how to host it there.

### Copyright / credit

Site template from link to allanlab. Special thanks :)

Comments welcome.

Code released under the MIT License. 



