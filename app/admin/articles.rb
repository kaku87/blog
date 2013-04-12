ActiveAdmin.register Article do
  index do
    column :title do |article|
        link_to article.title, [:admin, article]
    end
    column :created_at
   
    default_actions
  end
end
