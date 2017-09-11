class ScriptsController < ApplicationController

  def index
    @genre = Genre.find(params[:genre_id])
    @scripts = @genre.scripts
  end

  def show
    @script = Script.find(params[:id])
    @story = @script.story.new

    @script_scenes_dialogues = blank_glibs_for_script_show(@script)

    # Have this go to show page that shows new story form partials
    # render "stories/new"
  end


end
