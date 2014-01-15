class Route
  SIZE_IPS = {1 => {"ip" => "10.0.1.0/24"}, 
          5 => {"ip" => "10.0.2.0/24"}, 
          10 => {"ip" => "10.0.3.0/24"}, 
          25 => {"ip" => "10.0.4.0/24"}}
  
  def initialize(size, recipients)
    @ip = SIZE_IPS[size]['ip']
    @recipients = recipients
  end
end