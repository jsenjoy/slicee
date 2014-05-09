slicee
======

slicee is a CLI version of [slicy](http://macrabbit.com/slicy/)

it come from [source/slicee](https://github.com/luin/slicee)

Make it better !

Usage
-------

```
slicee.rb sample.psd output
```

API
-------

```ruby
require 'slicee.lib.rb'

Slicee.verbose(true) # print processing info

Slicee.debug(true) # print debug info

Slicee.slicy(input, output) # export

Slicee.slicy_only_layers(input, output) # only export layers

Slicee.slicy_only_groups(input, output) # only export groups
```

License
-------
Public Domain (Unlicense)
