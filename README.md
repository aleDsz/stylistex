# StylistEx [![Build Status](https://travis-ci.org/aleDsz/stylistex.svg?branch=master)](https://travis-ci.org/aleDsz/stylistex)

The CSS parser for Elixir.

# CSS definition extraction

Use the extract-cssdfn script to download the official css definition. Script created by [refy](https://github.com/tidoust/reffy) pproject.

```sh
# With NPM
$ npm install
$ npm run extract https://www.w3.org/TR/css-fonts-4/ 

# With Yarn
$ yarn install
$ yarn extract https://www.w3.org/TR/css-fonts-4/
```

And copy and paste the JSON to `priv/definition.json` file

## ToDo List:

- [X] Download CSS specs from official website
- [ ] Create a lexer for CSS definitions
- [ ] Generate structs for every CSS property
- [ ] Generate value definition syntax from spectification
- [ ] Parse CSS syntax to tuple and validate properties with values from definition
- [ ] Add tests
