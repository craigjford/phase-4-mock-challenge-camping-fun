class SignupsController < ApplicationController

    def create   
        signup = Signup.create!(camper_params)
        render json: signup.activity.to_json(only: [:id, :name, :difficulty]), status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    private 

    def camper_params
        params.permit(:time, :camper_id, :activity_id)
    end

end
