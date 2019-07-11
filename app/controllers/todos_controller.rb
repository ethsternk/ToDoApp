# frozen_string_literal: true

class TodosController < ApplicationController

  def index
    @todos = Todo.all.sort { |a, b|  a.created_at <=> b.created_at }
  end

  def completed
    @todos = Todo.where(complete: true).sort { |a, b|  a.created_at <=> b.created_at }
  end

  def unfinished
    @todos = Todo.where(complete: false).sort { |a, b|  a.created_at <=> b.created_at }
  end

  def show
    @todo = Todo.find(params[:id])
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
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to todos_path
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to @todo
    else
      render 'edit'
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :complete)
  end
end
