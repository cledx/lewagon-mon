class TrainersController < ApplicationController
  before_action :set_trainer, only: [:show]

  def index
    @trainers = Trainer.all
  end

  def show
  end

  def new
    @trainer = Trainer.new()
    @trainer.dialogue_lines = ["Hello.", "Welcome to my gym.", "Let’s battle!"]
  end

  private

  def set_trainer
    @trainer = Trainer.find(params[:id])
  end
end
