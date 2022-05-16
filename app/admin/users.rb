ActiveAdmin.register User do

  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :image, :contact
  
  # index as: :grid do |user|
  #   if user.image.url.present?
  #     link_to image_tag(user.image.url, width: "20px", hight: "20px"), admin_user_path(user)
  #   else
  #     "No Image"
  #   end
  # end

  index do
    selectable_column
    column :name
    column :contact
    actions do
      link_to "preview" 
    end
  end

  # ActiveAdmin.register Post do
  #   show do
  #     h3 post.title
  #     div do
  #       simple_format post.description
  #     end
  #   end
  # end


##############----------------create through controller----------------#######

  # controller do
  #   def create 
  #     attrs = params[:user]
          
  #     name = attrs[:name]
  #     contact = attrs[:contact]
  #     email = attrs[:email]
  #     # user_id = first_name[0] + last_name
  #     user_id = name[0]
    
  #     @user = User.new(name: name, 
  #                     contact: contact, 
  #                     email: email, 
  #                     user_id: user_id)
    
  #     if @user.save
  #       redirect_to '/admin/users'
  #     else
  #       render :new
  #     end  
  #   end                 
  # end
  
  form do |f|
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Details' do
          f.input :email
          f.input :password
          f.input :password_confirmation
        end
      end

      tab 'Advanced', html_options: { class: 'specific_css_class' } do
        f.inputs 'Advanced Details' do
          f.input :role
        end
      end
    end
    f.actions
  end

  # filter :delivered_at_in, as: :select, label: "Notification Delivered?", collection: [["yes", "true"],["no", "false"]]


end
