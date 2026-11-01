require "net/http"

# Asks the LangGraph server (langgraph-server/) to write a greeting.
class GreetingGenerator
  class Error < StandardError; end

  AGENT_URL = ENV.fetch("AGENT_URL", "http://localhost:8000/agent")

  def self.generate(name)
    response = Net::HTTP.post(
      URI(AGENT_URL),
      { username: name }.to_json,
      "Content-Type" => "application/json"
    )

    # The agent returns plain text like "Internal Server Error" when it crashes,
    # so check the status before parsing the body as JSON.
    unless response.is_a?(Net::HTTPSuccess)
      raise Error, "Agent returned #{response.code}: #{response.body.to_s.truncate(200)}"
    end

    JSON.parse(response.body)
  rescue SystemCallError, Net::OpenTimeout, Net::ReadTimeout => e
    raise Error, "Could not reach the agent at #{AGENT_URL}: #{e.message}"
  end
end
