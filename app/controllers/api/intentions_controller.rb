class Api::IntentionsController < ApplicationController
  def index
    @goals = Goal.all
    # render "index.json.jb"

    render "index.json.jb"
  end

  def show
    the_id = params[:id]
    @goal = Goal.find_by(id: the_id)
    render "show.json.jb"
  end

  def create
    @goal = Goal.new(
      intention: params[:intention],
      goalKeeper: params[:goalKeeper],
      startTime: params[:startTime],
      endTime: params[:endTime],
      completed: params[:completed],
      goalCohort: params[:goalCohort],

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
    @goal.intention = params[:intention] || @goal.intention
    @goal.goalKeeper = params[:goalKeeper] || @goal.goalKeeper
    @goal.startTime = params[:startTime] || @goal.startTime
    @goal.endTime = params[:endTime] || @goal.endTime
    @goal.completed = params[:completed] || @goal.completed
    @goal.goalCohort = params[:goalCohort] || @goal.goalCohort

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
