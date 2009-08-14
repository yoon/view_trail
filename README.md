# ViewTrail

ViewTrail lets you track controllers and views that you select for auditing. You can see who look at what (controller/action/params hash) and when.

## Rails Version

Works with Rails 2.3.

## Usage

    class FooController < ActionController::Base
      has_view_trail :except => :index
      
      def index
      end
        
      def search
        @results = Model.search(params[:query])
        
        audit({:results => @results.map(&:id), :flag => "blue"})
      end
    end

    Takes :except and :only conditions like other controller filters
    
    Also allows you to audit an arbitrary key/value hash
    
    For example: when you visit /foo/search?query=pie
    
    >> Activities.last.whodiddit      #=> (@controller.current_user)
    >> Activities.last.created_at     #=> (date/time of activity)
    >> Activities.last.controller     #=> FooController
    >> Activities.last.action         #=> "search"
    >> Activities.last.params         #=> {:query => "pie"}
    >> Activities.last.activity_items #=> [{:key => :results, :value => [2, 12, 14]}], [{:key => :flag, :value => "blue"}]
    
## Installation

1. Install ViewTrail as a gem:
  
    `config.gem 'yoon-view_trail', :lib => 'view_trail', :source => 'http://gems.github.com'`

2. Create a migration for the `versions` table
    
    `script/generate view_trail`
  
3. Run the migration.
    
    `rake db:migrate`
  
4. Add `has view_trail` to the controllers you want to track

## Issues

Please submit issues via GitHub's [Issue Tracker](http://github.com/yoon/view_trail/issues)

## History

0.3.1

Fixed conflict with paper trail whodunnit. To upgrade:

    `rake db:migrate:down`

remove old migration and re-run

    `script/generate view_trail`
    `rake db:migrate`

## Inspiration

* [PaperTrail](http://github.com/airblade/paper_trail/)

## Intellectual Property

Copyright (c) 2009 Mark Yoon. See LICENSE for details.
