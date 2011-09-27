class RackCombot
  @@combinations = {}

  def call(env)
    qa = env["QUERY_STRING"]

    if @@combinations.has_key? qs
      combination = @@combinations[qs]
    else
      combination = Combination.new(qs.split("&"))
      @@combinations[qs] = combination
    end

    [
      200,
      {"Content-Type" => "application/javascript"},
      combination.combine
    ]
  end

private

  class Combination

    def initialize(file_names)
      @file_contents = []

      file_names.each do |file_name|
        @file_contents << File.open(file_name, 'r') { |f| f.read }
      end

      @files = files
    end

    def combine
      @combo ||= @files.join
    end
    
  end

end
