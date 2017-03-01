module ApplicationHelper
  def randomized_background_image
    images = ["assets/street2.png", "/assets/people.jpg"]
    images[rand(images.size)]
  end
end

    # background-image: url(<%= randomized_background_image %>) no-repeat center center fixed; 
    # <% environment.context_class.instance_eval { include randomized_background_image } %>
