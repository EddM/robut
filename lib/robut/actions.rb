module Robut
  module Actions
    def post_comment(parent_id_or_parent_object, body)
      if parent_id_or_parent_object.is_a?(Hash)
        parent_id_or_parent_object = parent_id_or_parent_object["name"]
      end

      Robut.client.submit_comment parent_id_or_parent_object, body
    end

    alias :post_comment_reply :post_comment
  end
end
