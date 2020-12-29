# frozen_string_literal: true

require 'action_mailbox_debug/version'

module ActionMailboxDebug
  class Error < StandardError; end

  class Read
    def self.create_inbound_email_from_file(file_path)
      mail_file = File.read(file_path)
      mail = Mail.new mail_file
      ActionMailbox::InboundEmail.create_and_extract_message_id!(mail.to_s, status: :processing)
    end
  end
end
