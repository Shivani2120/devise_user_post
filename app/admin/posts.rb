ActiveAdmin.register Post do

   permit_params :user_id, :title, :description, post_attachments_attributes: [:id, :avatar, :_destroy]

   actions :index, :show, :edit, :update, :destroy
   menu :label => "Post", :priority => 0
   filter :id
   
   action_item :go_to_some_path, only: :index do
      # link_to 'Go to the place!', users_path
      link_to 'Go to the place!', posts_path
   end
    
  #  show title: "show post" do
  #   attributes_table do
  #     row :post_title
  #     row :post_body
  #    end
  #    active_admin_comments 
  #  end
 
   # index as: :blog do
   #   title :my_title
   #   body :my_body
   # end
 
   # index as: :blog do
   #   title :a_method_to_call                # A method for call new attributes
   # end
 
   # index as: :blog do
   #   title do |post|
   #     span post.title,      class: 'title'         # change html tag like h1,h2,span
   #     span post.created_at, class: 'created_at'
   #   end
   # end
 
   # index as: :blog do
   #   title :my_title
   #   body do |post|
   #     div truncate post.title
   #     div class: 'meta' do
   #       span "Post in #{post.categories.join(', ')}"
   #     end
   #   end
   # end

  #  index as: :blog do
  #   title :my_title
  #   body do |post|
  #     div truncate post.title
  #     div class: 'meta' do
  #       span "Post in #{post.post_likes.join(', ')}"
  #     end
  #   end
  # end

  # index do
  #   selectable_column
  #   column :title
  #   column :description
  # end
  
  # index do
  #   selectable_column
  #   column "My Custom Title", :title
  # end

  # index do
  #   selectable_column
  #   column "Title" do |post|   
  #     link_to post.title, admin_post_path(post)    # for generate link
  #   end
  # end

  # index do
  #   selectable_column
  #   column :title              # for action
  #   actions
  # end

  # index do
  #   selectable_column
  #   column :title
  #   actions do |post|
  #     item "preview", admin_post_path(post), class: "member_link"   #custom link
  #   end
  # end

  # index do
  #   column :title
  #   actions defaults: false do |post|
  #     item "View", admin_post_path(post)
  #   end
  # end

  # index do
  #   selectable_column
  #   column :title
  #   actions dropdown: true do |post|      # links in a dropdown menu
  #     item "Preview", admin_post_path(post)
  #   end
  # end

  # index do
  #   selectable_column
  #   index_column
  #   column :title
  # end

  # index do
  #   column :title, sortable: :title do |post|
  #     link_to post.title, admin_post_path(post)
  #   end
  # end

  # index do
  #   column :title, sortable: false
  # end

  #####--------------for show-------------------####
   
  # show do                                   # for image show
  #   attributes_table do
  #     row :name
  #     row :Image do |post|
  #       ul do
  #         post.post_attachments.each do |photo|
  #           li do
  #             image_tag photo.avatar.url
  #           end
  #         end
  #       end
  #     end
  #   end
  # end

  # show title: "show post" do      change the post title 
  #   attributes_table do
  #     row :post_title
  #     row :post_body
  #    end
  #    active_admin_comments 
  #  end

  # show do
  #   panel "Table of Contents" do     # for showing content and details seperatly
  #     table_for post.user do
  #       column :title
  #       column :description
  #     end
  #   end
  #   active_admin_comments
  # end

  # sidebar "Details", only: :show do
  #   attributes_table_for post do
  #     row :title
  #     row :description
  #     row('description?') { |b| status_tag b.description? }
  #   end
  # end
  
  #########----------form------------############
 


  # form do |f|
  #   f.inputs do
  #     f.input :title
  #     f.input :description, required: false
  #   end
  #   f.actions do
  #     f.submit 'Create a new user', as: :button
  #   end
  # end


#   form do |f|                            ### nested form
#     f.inputs 'Details' do
#       f.input :title
#     end
#     f.inputs 'Content', :description
#     f.inputs do
#       f.has_many :post_attachments, heading: 'Images',
#                               allow_destroy: true,
#                               new_record: false do |a|
#         a.input :avatar
#       end
#     end
   
#     f.actions
#   end

# #####---------------datepicker-----------#####

#   form do |f|
#     f.input :created_at, as: :datepicker,
#                         datepicker_options: {
#                           min_date: "2013-10-8",
#                           max_date: "+3D"
#                         }
  
#     f.input :updated_at, as: :datepicker,
#                       datepicker_options: {
#                         min_date: 3.days.ago.to_date,
#                         max_date: "+1W +5D"
#                       }
#   end

  ######-------------displaying the error--------------###########

  form do |f|
    f.inputs do
          f.input :title
          f.input :description, required: false
    end
   

    f.inputs do
      f.has_many :post_attachments, heading: 'Images',
                              allow_destroy: true,
                              new_record: true do |a|
        a.input :avatar
      end
    end

   

    f.actions do
      f.submit 'Update a post', as: :button
    end  
    
  end
end  

