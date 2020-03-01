# frozen_string_literal: true

S3_CLIENT = Aws::S3::Client.new(
  region: 'eu-west-2',
  credentials: Aws::Credentials.new(
    ENV['AWS_ACCESS_KEY_ID'],
    ENV['AWS_SECRET_ACCESS_KEY']
  )
)
