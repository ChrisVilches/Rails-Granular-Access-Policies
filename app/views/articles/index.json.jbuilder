json.array! @articles do |article|
  json.extract! article, :id, :text, :created_at
  json.user article.user
  json.edit policy(article).update?
  json.destroy policy(article).destroy?
end
