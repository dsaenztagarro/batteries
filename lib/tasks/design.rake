namespace :design do
  desc 'Launchs a browser with the admin template design'
  task :admin do
    `open design/admin/template_content_html/index.html`
  end

  namespace :frontend do
    desc 'Launchs a browser with the blog template design'
    task :blog do
      `open design/frontend/blog/template_content_html/index.html`
    end

    desc 'Launchs a browser with the forum template design'
    task :forum do
      `open design/frontend/forum/template_content_html/index.html`
    end
  end
end
