class TagsController < ApplicationController
  def get
    todo_tags = TodoTag.where(todo_id: params[:todo_id])
    todo_tags_id = []

    # todo_tagsからtag_idだけ抽出
    todo_tags.each do |tag|
      todo_tags_id.push(tag.tag_id)
    end

    # TodoTagのtag_idが一致する、tagを取得
    tag = Tag.where(id: todo_tags_id)
    render json: tag
    return tag
  end

  # ここは6/16に実験
  def add
  end
end
