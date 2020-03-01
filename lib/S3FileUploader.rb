class S3FileUploader

  def initialize
    @s3 = Aws::S3::Client.new(
      region: 'eu-west-2',
      credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
    )
  end

  def put_file(name: nil, file_contents: nil)
    @s3.put_object(
        bucket: 'nerga',
        key: "test/test.txt",
        body: "test"
    )
  #rescue StandardError => ex
  #  error_writing_file(filename: name, ex: ex)
  end

  def error_writing_file(filename: nil, ex: nil)
    puts "Problem writing filename #{filename} on remote. Error #{ex}"
    #Airbrake.notify(
    #  error_class: 'S3FailedAssets',
    #  error_message: "Problem writing filename #{filename} on s3. Error #{ex}",
    #  environment_name: Rails.env
    #)
  end
end
