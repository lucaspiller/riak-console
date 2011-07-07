# Riak Console

An interactive command line interface to Riak.

## Usage

# Get Object

Get an object from a {bucket,key} pair.

    > get 'addresses', 'jane'
    content-type: application/x-ruby-marshal
    vclock: a85hYGBgzGDKBVIsDBeawjKYEhnzWBmK4rqO82UBAA==
    etag: B3SP2OAPO58kw6Y9fzeH0
    last_modified: 2011-07-07 17:44:34 +0100
    links:
    data:
    "13 New Street"
    => true

# Put Object

Store an object at a {bucket,key} pair.

    > put 'addresses', 'jane', '13 New Street'
    => true

Complex data types can also be passed, as well as a content type:

    > put 'addresses', 'jane', {:number => 13, :street => 'New Street'}, 'application/json'
    => true

# List Keys

Lists keys in the database:

    > list
    ---
    addresses:
    - jane
    friends:
    - tim
     => true

Listing all keys will take a while, for speed pass names of bucket:

    > list 'addresses'
    ---
    addresses:
    - jane

## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Add tests.
* Send me a pull request. Bonus points for topic branches.

## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dct:title" rel="dct:type">Texty (Ruby Gem)</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/lucaspiller/riak-console" property="cc:attributionName" rel="cc:attributionURL">Luca Spiller</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.<br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/lucaspiller/riak-console" rel="dct:source">github.com</a>.<br />Permissions beyond the scope of this license may be available at <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/lucaspiller/riak-console" rel="cc:morePermissions">https://github.com/lucaspiller/riak-console</a>.
