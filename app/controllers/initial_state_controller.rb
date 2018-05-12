class InitialStateController < ApplicationController
  def index
    forum_data = group_forums
    render json: {
      forums: forum_data
    }
  end

  private

    def group_forums
      categoryArray = []
      Category.select(:id, :name, :sort_order).find_each do |category|
        categoryHash = category.as_json
        categoryHash['forums'] = []
        forums = category.forums.select(:id, :name, :category_id)
        forums.find_each do |forum|
          forumHash = forum.as_json
          forumHash['subforums'] = forum.subforums.select(:id, :name).as_json
          categoryHash['forums'] = forumHash
        end
        categoryArray.push(categoryHash)
      end
      categoryArray
    end
end
