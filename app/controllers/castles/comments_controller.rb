class Castles::CommentsController < CommentsController
  before_action :set_commentable

  private

    def set_commentable
      @commentable = Castle.find(params[:castle_id])
    end
end
