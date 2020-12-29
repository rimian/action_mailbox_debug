# frozen_string_literal: true

require 'action_mailbox_debug/version'

module ActionMailboxDebug
  module InboundEmail
    def create_inbound_email_from_file!(file_path, &block)
      mail_file = File.read(file_path)
      mail = Mail.new mail_file

      # The test helper fails silently here.
      self.validate_message_id(mail)

      # block.call mail unless block.nil?
      ActionMailbox::InboundEmail.create_and_extract_message_id!(mail.to_s, status: :processing)
    end

    private

    def validate_message_id(mail)
      raise StandardError.new 'message_id already exists' if ActionMailbox::InboundEmail.exists?(message_id: mail.message_id)
    end
  end
end
