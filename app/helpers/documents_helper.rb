module DocumentsHelper
  def tag_links(tags)
    tags.split(",").map{ |tag| tag.strip }.join(",") 
  end
end
