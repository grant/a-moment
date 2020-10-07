# A Moment

A creative project by Grant Timmerman.

[Insert picture here]

Inspired by [this video](https://www.youtube.com/watch?v=FNxiFOUKpZ4) and [this video](https://www.youtube.com/watch?v=XdaKTnqotbE).

## Uses
- :coffee: Coffeescript
- :tropical_fish: Gulp
- :lipstick: Stylus
- :gem: Jade
- :star2: SVGs

## Install

```sh
git clone git@github.com:grant/a-moment.git
npm install --global gulp-cli
sudo n 10
npm install
gulp build
python -m SimpleHTTPServer 8000
open http://localhost:8000
```

Develop:

```
gulp build && python -m SimpleHTTPServer 8000
```

## Gulp

```sh
gulp # builds and watches for changes (for development)
gulp build # builds the js, html, and css
gulp docs # generates the documentation
```

**`gulp docs` requires `docco` to be globally installed**
