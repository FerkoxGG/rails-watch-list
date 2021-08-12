class ListsController < ApplicationController
  before_action :find_list, only: [:index, :create, :update]

  def index
    @lists = List.all
  end
end
