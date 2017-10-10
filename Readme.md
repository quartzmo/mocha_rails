# MochaRails

MochaRails integrates the [Mocha](http://mochajs.org/) JavaScript test framework with the Rails (>= 3.1) Asset Pipeline.

**Note:** This project is modeled on [Jasminerice](https://github.com/bradphelan/jasminerice) and is fairly simple. If you want more features, please consider [Konacha](https://github.com/jfirebaugh/konacha), which provides a sandboxed server running on another port, a command-line task, fixtures, transactions, and other goodies. I will continue to maintain and upgrade MochaRails, however, so if its smaller feature set fits your needs, by all means please use it.

## Description

MochaRails is a mountable Rails engine that serves a browser-based Mocha test suite, along with your development JavaScript files, via the Asset Pipeline.

It loads [Chai](http://chaijs.com) for assertions, although since Mocha is decoupled from the assertion library, you can
use another assertion library if you choose (or even write your own.)

The Mocha interface system allows developers to choose their style of DSL. MochaRails is hardcoded for now to the
"BDD" interface, but if you want to write in one of the other styles, please "+1" the open issue to make it configurable.

## Installation

In your Rails >= 3.1 app, **you must add** `gem 'mocha_rails'` to your `Gemfile`:

```
group :test, :development do
  gem 'mocha_rails'
end
```
MochaRails includes a convenient install generator that adds a route to `config/routes.rb` and adds a `mocha-suite.js`
Sprockets manifest file to either `spec/javascripts` or `test/javascripts`. The `mocha-suite.js` file does not contain a catch-all require
directive, you must add the requires for your production and test paths yourself. Avoid using `require_tree .` which has caused an
[issue](https://github.com/quartzmo/mocha_rails/issues/7), instead use more specific
requires for each spec or test file, such as `//= require ./models/my-model-test`.

To install the required configuration, **you must run**:

```
rails g mocha_rails:install
```

The generator has a single option, `--mount`, which lets you specify the route to your test suite. The default
route is `/mocha`.

## Organizing your test files

Sprockets will not load two files with the same relative asset path and base name, even if they are located in different directories, such
as `app/assets/javascripts/example.js` and `test/javascripts/example.js.coffee`. In this example, the test file will
**not** be loaded.

One solution is to simply give your test files a different name, for example in `test/javascripts/mocha-suite.js`:

```
//= require example
//= require example-test
```

However, if you prefer to give your test files the same name as your production files, you must then use a different path:

```
//= require example
//= require test/example
```

## Adding a test

To get you started, here is a sample Mocha test with a should style assertion, to be placed in a file
`test/javascripts/array-test.js.coffee`:

```
describe 'Array', ->

  beforeEach ->
    @array = [1,2,3]

  describe '#indexOf()', ->

    it 'should return -1 when not present', ->
      @array.indexOf(4).should.equal -1
```

## Running

Start your server in development mode, and open `http://localhost:3000/mocha`. You should see Mocha's very attractive results page. If you
see a completely blank page, or an almost blank page with a few zeros in the upper right corner, check your JavaScript console for errors.

## Credits

* Chris Smith (quartzmo)

MochaRails was inspired by the design of [Jasminerice](https://github.com/bradphelan/jasminerice).

## License

MIT-LICENSE
