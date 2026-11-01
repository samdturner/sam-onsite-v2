class GreetingsController < ApplicationController
  # Stores a new Greet and returns an LLM-generated greeting for its ID.
  def create
    greet = Greet.create!
    greeting = GreetingGenerator.generate(greet.id.to_s)

    render json: { id: greet.id, greeting: greeting }, status: :created
  rescue GreetingGenerator::Error => e
    Rails.logger.error(e.message)
    render json: { error: "Could not generate a greeting. Is the LangGraph server running?" },
           status: :bad_gateway
  end
end
