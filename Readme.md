# MochaRails

MochaRails integrates the [Mocha](http://visionmedia.github.com/mocha/) JavaScript test framework with the Rails (>= 3.1) Asset Pipeline.

## Description

MochaRails is a mountable Rails engine that serves a browser-based Mocha test suite, along with your production JavaScript files, via the Asset Pipeline.

It loads [Expect](https://github.com/LearnBoost/expect.js) for assertions, although since Mocha is decoupled from the assertion library, you can
use another assertion library if you choose (or even write your own.) For example, if browsers become compatible with
[Should](https://github.com/visionmedia/should.js), it would be a great choice.

The Mocha interface system allows developers to choose their style of DSL. MochaRails is hardcoded for now to the
"BDD" interface, but if you want to write in one of the other styles, open an issue and I will make it configurable.

## Installation

In your Rails >= 3.1 app, **you must add** `gem 'mocha_rails'` to your `Gemfile`:

```
group :test, :development do
  gem 'mocha_rails'
end
```

## Configuration

To access your Mocha test suite at `/mocha`, **you must add** the following line inside your Rails `config/routes.rb`,
within the block passed to `draw`.

```
mount MochaRails::Engine => "mocha" unless Rails.env.production?
```

There is nothing special about the path `/mocha`, and you can name any path you like,
as long as it doesn't conflict with any of your existing application paths.

## Adding Mocha Tests

**You must create** a `mocha-suite.js` or `mocha-suite.js.coffee` Sprockets manifest file in
one of these locations:

* `test/javascripts`

or

* `spec/javascripts`

This directory is also the location for your Mocha tests.

Here is a sample `mocha-suite.js.coffee` manifest:

```
#= require_tree .
```

Here is a sample Mocha test including an Expect assertion, in a file `array-test.js.coffee` located in the same directory or below:

```
describe 'Array', ->

  beforeEach ->
    @array = [1,2,3]

  describe '#indexOf()', ->

    it 'should return -1 when not present', ->
      expect(@array.indexOf(4)).to.equal(-1)
```

Create these files, start your server, and open `http://localhost:3000/mocha`. You should see Mocha's very attractive results page. If you
see a completely blank page, or an almost blank page with a few zeros in the upper right corner, check your JavaScript console for errors.

## Credits

* Chris Smith (quartzmo)

MochaRails was inspired by the design of [Jasminerice](https://github.com/bradphelan/jasminerice).

## License

MIT-LICENSE
