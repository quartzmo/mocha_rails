# MochaRails

MochaRails integrates the [Mocha](http://visionmedia.github.com/mocha/) JavaScript test framework with the Rails (>= 3.1) Asset Pipeline.

## Description

MochaRails is a mountable Rails engine that serves a browser-based Mocha test suite, along with your production JavaScript files, via the Asset Pipeline.

It loads [Expect](https://github.com/LearnBoost/expect.js) for assertions, although since Mocha is decoupled from the assertion library, you can
use another if you choose. For example, if browsers become compatible with
[Should](https://github.com/visionmedia/should.js), it would be a great choice.

## Configuration

To access your Mocha test suite at `/mocha`, add the following line inside your Rails `config/routes.rb`,
within the block passed to `draw`.

```
mount MochaRails::Engine => "mocha" unless Rails.env.production?
```

There is nothing special about the path `/mocha`, and you can use any path you like,
as long as it doesn't conflict with any of your existing application paths.

## Adding Mocha Tests

You must create a `mocha-suite.js` or `mocha-suite.js.coffee` Sprockets manifest file in
one of these locations:

* `test/javascripts`
* `spec/javascripts`

This directory is also the location for your Mocha tests.

Here is a sample `mocha-suite.js.coffee` manifest:

```
#= require jquery
#= require_tree .
```

Here is a sample test in the same directory, `array-test.js.coffee`:
