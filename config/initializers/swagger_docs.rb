class Swagger::Docs::Config
  def self.base_api_controller
    ApiController
  end
end

class Swagger::Docs::Config
  def self.transform_path(path, _api_version)
    "/api/v1/#{path}"
  end
end

Swagger::Docs::Config.register_apis(
    {
        "1.0" => {
            :api_file_path => "public/api/v1/",
            :base_path => "http://localhost:3000/",
            :clean_directory => true,
            :attributes => {
                :info => {
                    "title" => "Hey Taxi!",
                    "description" => "Hey Taxi API Server",
                    "contact" => "chlgusrla@gmail.com",
                    "licenseUrl" => "http://www.apache.org/licenses/LICENSE-2.0.html"
                }
            }
        }
    })
