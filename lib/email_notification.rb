module EmailNotification
  def self.contact_request_employer(args)
    true if args.length == 8
  end
end