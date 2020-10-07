# A Moment

<p align="center">
  A creative project by Grant Timmerman
  <br>
  --&gt; <a href="grant.github.io/a-moment">grant.github.io/a-moment</a> &lt;--
</p>


![Screen Shot 2020-10-06 at 21 46 53](https://user-images.githubusercontent.com/744973/95281892-d4ab4500-081d-11eb-96dc-f59af8fc500d.png)

Inspired by [this video](https://www.youtube.com/watch?v=FNxiFOUKpZ4) and [this video](https://www.youtube.com/watch?v=XdaKTnqotbE).

> Note: The JS ecosystem has updated a lot since 2015. The current build is broken, and there's a semi-working build here: https://github.com/grant/a-moment/tree/grant_2020

## Uses
- :coffee: Coffeescript
- :tropical_fish: Gulp
- :lipstick: Stylus
- :gem: Jade
- :star2: SVGs

## Install

```sh
git clone git@github.com:grant/a-moment.git
npm install
gulp build
python -m SimpleHTTPServer 8000
open http://localhost:8000
```

## Gulp

```sh
gulp # builds and watches for changes (for development)
gulp build # builds the js, html, and css
gulp docs # generates the documentation
```

**`gulp docs` requires `docco` to be globally installed**
