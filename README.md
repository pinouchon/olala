# Olala

Dynamic content edition for rails

## Installation

Add this line to your application's Gemfile:

    gem 'olala'

And then execute:

    $ bundle
    $ rails g olala:install

    Add `require olala` at the end of `app/assets/javascripts/application.js`

   Add this in `application.html.erb` before `</head>` tag

    ````
      <% if session[:admin] %>
          <link rel="stylesheet" href="/aloha/css/aloha.css" type="text/css">
          <script src="/aloha/lib/require.js"></script>
          <script src="/aloha/lib/vendor/jquery-1.7.2.js"></script>
          <script src="/aloha/lib/aloha.js" data-aloha-plugins="common/ui,common/format,common/table,common/list,common/highlighteditables,common/link,common/image,common/block,common/undo"></script>
      <% end %>
    ````

    Change your body tag to: `<body class='<%= 'admin' if session[:admin] %>'>`

    Replace each block that you want to make dynamic:

    `<p>Static text</p>`
    =>
    `<p>Olala::editable('my_title', 'Static text')</p>`

    Load helpers:
    `helper Olala::ApplicationHelper` in application_helper.rb

Make sure that you have:

 - jquery in your javascript dependencies'
 - a database with activeRecord (pg, mysql, sqlite), jquery

## Usage:

todo

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
