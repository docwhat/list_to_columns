[![Build
Status](https://travis-ci.org/docwhat/list_to_columns.svg)](https://travis-ci.org/docwhat/list_to_columns)
[![Coverage
Status](https://coveralls.io/repos/docwhat/list_to_columns/badge.svg?branch=master&service=github)](https://coveralls.io/github/docwhat/list_to_columns?branch=master)
[![Dependency
Status](https://gemnasium.com/docwhat/list_to_columns.svg)](https://gemnasium.com/docwhat/list_to_columns)
[![Gem
Version](https://badge.fury.io/rb/list_to_columns.svg)](http://badge.fury.io/rb/list_to_columns)

ListToColumns
=============

Have a list of strings but want to display it in a compact column format?
`ListToColumns` is the tool for the job!

It turns boring lists like:

    Dedanim signally eyebright unpebbled ureterolithic boyishly

or:

     * Haidan
     * Soleidae
     * paleoanthropological
     * Peba
     * biaxillary
     * preultimate
     * convivialist
     * amphistome
     * shoaly
     * cornloft

...into glorious multi-columnar lists:

    conventual     uranospinite  scallom
    enantiopathia  biserially    Bogomil
    scyphozoan     Addisonian    mislayer

Installation
------------

Add this line to your application's Gemfile:

``` ruby
gem 'list_to_columns'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install list_to_columns

Usage
-----

`ListToColumns.new <list>, [options]`

Options:

-   `:indent` -- How much to indent the columns. Defaults to `0`.
-   `:width` -- The width of the text to display. Defaults to `78`.
-   `:space` -- The space between columns. Defaults to `2`.

### Example

``` ruby
require 'list_to_columns'

words = %w(
  antipyic
  baccheion
  conormal
  diet
  extracloacal
  fadridden
  germifuge
  hovering
  isomerical
  jagrata
  knuclesome
  libidinal
  myoclonic
  nonunionism
  overmarl
  parochialization
  quadriparous
  radiotelegraph
  sobby
  tailpipe
  undefectiveness
  vintaging
  wheaten
  xanthydrol
  yesso
  zircofluoride
)

puts ListToColumns.new(words, width: 60, space: 3)
```

Output:

    antipyic           jagrata            sobby
    baccheion          knuclesome         tailpipe
    conormal           libidinal          undefectiveness
    diet               myoclonic          vintaging
    extracloacal       nonunionism        wheaten
    fadridden          overmarl           xanthydrol
    germifuge          parochialization   yesso
    hovering           quadriparous       zircofluoride
    isomerical         radiotelegraph

Development
-----------

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake rspec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

Contributing
------------

Bug reports and pull requests are welcome on GitHub at
https://github.com/docwhat/list\_to\_columns.

License
-------

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).
