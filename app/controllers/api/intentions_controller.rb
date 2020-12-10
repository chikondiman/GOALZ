class Api::IntentionsController < ApplicationController
  def index
    @goals = Goal.all
    # render "index.json.jb"

    p "THIS IS RIGHT BEFORE CURRENT USER"
    p current_user
    p "THIS IS RIGHT AFTER CURRENT USER"

    if params[:search]
      @goals = Goal.where("name LIKE ?", "%#{params[:search]}%")
    else
      @goals = Goal.all
    end

    if current_user
      @goals = Goal.all
    else
      @goals = Goal.all
    end
    render "index.json.jb"
  end

  def show
    the_id = params[:id]
    @goal = Goal.find_by(id: the_id)
    render "show.json.jb"
  end

  def create
    @goal = Goal.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      address: params[:address],
    )

    if @goal.save
      render "show.json.jb"
    else
      render json: { errors: @goal.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    the_id = params[:id]
    @goal = Goal.find_by(id: the_id)
    @goal.first_name = params[:first_name] || @goal.first_name
    @goal.last_name = params[:last_name] || @goal.last_name
    @goal.middle_name = params[:middle_name] || @goal.middle_name
    @goal.email = params[:email] || @goal.email
    @goal.phone_number = params[:phone_number] || @goal.phone_number
    @goal.address = Geocoder.coordinates(params[:address]) || @contact.address

    if @contact.save
      render "show.json.jb"
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @goal = Goal.find_by(id: params[:id])
    @goal.destroy
    render "destroy.json.jb"
  end
end
