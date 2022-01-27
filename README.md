# nem - Convert simple Ruby .gemspec files to package.jsons [![[gem]](https://badge.fury.io/rb/nem.svg)](https://badge.fury.io/rb/nem)

Contrary to common belief, [npm](https://www.npmjs.com/) does not stand for "node package manager". In fact it is a [package make installer](https://docs.npmjs.com/misc/faq#if-npm-is-an-acronym-why-is-it-never-capitalized), which just happens to be written in node. Hence it is not only meant to be used for node (or [iojs](https://iojs.org/)) modules. It is also great for command-line tools written in Ruby!

## Install

Via rubygems:

    $ gem install nem

The nem utility used to be published on npm also. Please note that this is not the case anymore and the current nem package is part of another project.

## Usage

* Build your Ruby CLI gem as usual
* Don't use any dependencies (other than included in Ruby's standard library)
* Write your gemspec (example: [nem.gemspec](https://github.com/janlelis/nem/blob/main/nem.gemspec))
* Run the following command to generate a `package.json` file:

```
$ nem
```

* Optional: Command-line arguments to `nem` will be interpreted as keywords for npm's search
* That's it. Only step left: Publish it on the rubygems & npm public registries

## Install it locally
### Via npm

[Instructions](https://docs.npmjs.com/cli/install). In short:

    $ npm install .

### Via rubygems

[Instructions](http://guides.rubygems.org/make-your-own-gem/). In short:

    $ gem build *.gemspec
    $ gem install *.gem

(replace * with the actual gem name)

## Publish
### On npm

[Instructions](https://docs.npmjs.com/cli/publish). In short:

    $ npm publish .

### On rubygems

[Instructions](http://guides.rubygems.org/publishing/#publishing-to-rubygemsorg). In short:

    $ gem build *.gemspec
    $ gem push *.gem

(replace * with the actual gem name)

## Legal

nem is relaesed under the MIT license. npm is © npm, Inc. nem is not affiliated with npm in any way.
