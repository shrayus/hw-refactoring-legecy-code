And /I am logged in as "(.*?)" with password "(.*?)"$/ do |u, p|
  visit '/accounts/login'
  fill_in 'user_login', :with => u
  fill_in 'user_password', :with => p
  click_button 'Login'
  assert page.has_content? 'Login successful'
end

Given /the articles "(\d+)" and "(\d+)" were merged$/ do |id1, id2|
  article = Article.find_by_id(id1)
  article.merge_with(id2)
end