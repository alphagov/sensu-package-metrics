# Sensu Package Metrics [![Build Status](https://travis-ci.org/alphagov/sensu-package-metrics.svg?branch=master)](https://travis-ci.org/alphagov/sensu-package-metrics)

This gem provides a sensu check that can be run to return metric details regarding installed versions of a package. The expected output is a JSON object like so:
```
{
    'package': <expected-package>
    'status': 'installed'
    'version': <some-version-number>
    'installed_at': <some-unix-timestamp-when-package-was-installed'
    'timestamp': <some-unix-timestamp-when-check-was-run>
}
```
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sensu-package-metrics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sensu-package-metrics

## Usage

Once installed, the metric can be run with `report-package-version`. Please use `-h` to see usage:
```
Usage: report-package-version (options)
    -l LOGFILE
    -p PACKAGE
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sensu-package-metrics/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
