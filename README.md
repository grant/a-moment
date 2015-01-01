# A Moment

A creative project by Grant Timmerman

[Insert picture here]

Inspired by [this video](https://www.youtube.com/watch?v=FNxiFOUKpZ4) and [this video](https://www.youtube.com/watch?v=XdaKTnqotbE)

Music can be found [here](http://www.wikiloops.com/backingtrack-jam-11615.php).

## Uses
- :coffee: Coffeescript
- :tropical_fish: Gulp
- :lipstick: Stylus
- :gem: Jade

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