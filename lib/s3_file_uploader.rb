class S3FileUploader
  def initialize
    @s3 = Aws::S3::Client.new(
      region: 'eu-west-2',
      credentials: Aws::Credentials.new(
        Rails.application.credentials[:aws][:access_key_id],
        Rails.application.credentials[:aws][:secret_access_key]
      )
    )
  end

  def put_file(file_path: nil, file: nil)
    @s3.put_object(
      bucket: 'nerga',
      key: file_path,
      body: File.read(file)
    )
  #rescue StandardError => ex
  #  error_writing_file(filename: name, ex: ex)
  end


end
