ActiveScaffold.set_defaults do |conf|
  conf.security.current_user_method = :current_login
  conf.security.default_permission = false
  conf.create.refresh_list = true
  conf.update.refresh_list = true
  conf.delete.refresh_list = true
  conf.search.live = true
  conf.list.per_page = 22
end
