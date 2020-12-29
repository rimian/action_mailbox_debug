# frozen_string_literal: true

require 'action_mailbox_debug/version'

module ActionMailboxDebug
  module InboundEmail
    def create_inbound_email_from_file!(file_path, &block)
      mail_file = File.read(file_path)

      block.call(mail_file) if block_given?

      mail = Mail.new mail_file

      # The ActionMailbox::InboundEmail test helper fails silently here.
      validate_message_id(mail)

      ActionMailbox::InboundEmail.create_and_extract_message_id!(mail.to_s, status: :processing)
    end

    private

    def validate_message_id(mail)
      raise StandardError.new 'message_id already exists' if ActionMailbox::InboundEmail.exists?(message_id: mail.message_id)
    end
  end
end
