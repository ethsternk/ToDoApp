# frozen_string_literal: true

class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end
end
