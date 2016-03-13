Given /the following (.*?) exist:$/ do |type, table|
  table.hashes.each do |item|
    if    type == "users"    then User.create!(item)
    elsif type == "articles" then Article.create!(item)
    elsif type == "comments" then Comment.create!(item)
    end
  end
end

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

Then /the Author of "(\d+)" should be "(\d+)"$/ do |id, author|
  article = Article.find_by_id(id)
  assert article.author == author
end

And /the Author of "(\d+)" should not be "(\d+)"$/ do |id, author|
  article = Article.find_by_id(id)
  assert article.author != author
end