class ChaptersController < ApplicationController
  def index
    @source = params[:source] || "the_odin_project"

    if @source == "the_odin_project"
      @chapters = policy_scope(Chapter.where(source: "the_odin_project"))
    else
      @chapters = policy_scope(Chapter.where(source: "le_wagon"))
    end
  end

  def show
    @chapter = Chapter.find(params[:id])
    authorize @chapter

    all_chapters = Chapter.where(source: @chapter.source).order(:id)
    current_chapter_index = all_chapters.find_index(@chapter)

    @previous_chapter = all_chapters[current_chapter_index - 1] if current_chapter_index > 0
    @next_chapter = all_chapters[current_chapter_index + 1] if current_chapter_index < all_chapters.length - 1
  end
end
