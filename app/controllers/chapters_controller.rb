class ChaptersController < ApplicationController
  def index
    @odin_chapters = policy_scope(Chapter.where(source: "the_odin_project"))
  end
end
