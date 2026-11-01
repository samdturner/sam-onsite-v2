require "test_helper"

class GreetingsTest < ActionDispatch::IntegrationTest
  test "creates a greet and returns the agent's greeting" do
    stub_request(:post, GreetingGenerator::AGENT_URL)
      .to_return(body: '"Hello there!"', headers: { "Content-Type" => "application/json" })

    assert_difference -> { Greet.count }, 1 do
      post "/api/greetings"
    end

    assert_response :created
    assert_equal({ "id" => Greet.last.id, "greeting" => "Hello there!" }, response.parsed_body)
    assert_requested :post, GreetingGenerator::AGENT_URL, body: { username: Greet.last.id.to_s }.to_json
  end

  test "returns a JSON error when the agent crashes" do
    stub_request(:post, GreetingGenerator::AGENT_URL).to_return(status: 500, body: "Internal Server Error")

    post "/api/greetings"

    assert_response :bad_gateway
    assert_match "LangGraph server", response.parsed_body["error"]
  end

  test "returns a JSON error when the agent is not running" do
    stub_request(:post, GreetingGenerator::AGENT_URL).to_raise(Errno::ECONNREFUSED)

    post "/api/greetings"

    assert_response :bad_gateway
  end
end
