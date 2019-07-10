# frozen_string_literal: true

class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def completed
    @todos = Todo.where(complete: true)
  end

  def unfinished
    @todos = Todo.where(complete: false)
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to '/todos'
    else
      render 'new'
    end
  end

  def destroy
    @todo = Todo.delete(params[:id])
    redirect_to '/todos'
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :complete)
  end
end
