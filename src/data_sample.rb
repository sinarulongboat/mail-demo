class DataSample
  class << self
    def base_url
      'http://localhost:8080'
    end

    def server_host
      'localhost:8080'
    end

    def server_protocol
      'http'
    end

    def sponsor_name
      'demo'
    end

    def sponsor_domain
      'demo'
    end

    def login_url
      "#{base_url}/gateway"
    end

    def patient_name
      'P1101'
    end

    def study_name
      'Admiral'
    end

    def date_str
      '2021-05-19'
    end

    def application_base_url
      'http://localhost:8080/Demo'
    end

    def dashboard_url
      'http://localhost:8080/Demo/1/patients_portal'
    end

    def user_email
      '3wqawi@longboat.com'
    end
  end
end
