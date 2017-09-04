json.roles do
  json.array! @roles do |role|
    json.extract! role, :id, :title, :description, :permissions, :created_at
  end
end

json.permissions @permissions
