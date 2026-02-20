class TrainersController < ApplicationController

  before_action :set_trainer, only: [:show]

  def index
    @trainers = Trainer.all
  end

  def show
  end

  def new
     @trainer = Trainer.new()
    # @speaker = Trainer.find_by(name: "Professor Oak")
    # @step = params[:step].to_i
    # render "trainers/new/step_#{@step}"
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      redirect_to trainer_path(@trainer)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def dialogue
    @index = params[:index].to_i
    @speaker = Trainer.find(params[:speaker_id])
    @message = @speaker.dialogue[@index]
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :trainer_type)
  end

  def set_trainer
    @trainer = Trainer.find(params[:id])
  end
end
