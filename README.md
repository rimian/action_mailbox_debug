# Action Mailbox Debug

This is a helper to debug Action Mailbox. It's not suitable for running on production servers.

If you have problems with action mailbox and you need to debug it, download your eml file and run it through this gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'action_mailbox_debug'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install action_mailbox_debug

## Usage

```ruby
include ActionMailboxDebug::InboundEmail
create_inbound_email_from_file! 'tmp/test.eml'
```

This will return an `ActionMailbox::InboundEmail` object or fail if it already exists.

You may wish to do something to the file beforehand

```ruby
include ActionMailboxDebug::InboundEmail
create_inbound_email_from_file! 'tmp/test.eml' do |file|
  file.sub('__subject__', 'testing')
end
```

Then, you can route the inbound email and fix any errors you might have:

```ruby
inbound_mail.route
```
Or:
```ruby
ActionMailbox::RoutingJob.perform_now inbound_mail
```

## Known issues

The [helper](https://edgeapi.rubyonrails.org/classes/ActionMailbox/InboundEmail/MessageId.html#method-i-create_and_extract_message_id-21) fails silently and returns `nil` if a message already exists with the same id. Bummer!
