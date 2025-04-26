class ChaptersController < ApplicationController
  def index
    @source = params[:source] || "the_odin_project"

    if @source == "the_odin_project"
      @chapters = policy_scope(Chapter.where(source: "the_odin_project"))
    else
      @chapters = policy_scope(Chapter.where(source: "le_wagon"))
    end
  end
end
