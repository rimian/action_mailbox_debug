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

Open up console and load an eml file:

```ruby
inbound_email = ActionMailboxDebug::Read.create_inbound_email_from_file 'path/to/message.eml'
```

This will return an `ActionMailbox::InboundEmail` object.

Then, you can run the processing job and fix any errors you might have:

```ruby
ActionMailbox::RoutingJob.perform_now inbound_mail
```

## Known issues

The [helper](https://edgeapi.rubyonrails.org/classes/ActionMailbox/InboundEmail/MessageId.html#method-i-create_and_extract_message_id-21) fails silently and returns `nil` if a message already exists with the same id. Bummer!
