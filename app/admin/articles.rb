ActiveAdmin.register Article do
  index do
    column :title do |article|
        link_to article.name, [:admin, article]
    end
    column :creaet_at
   
    default_actions
  end
end
