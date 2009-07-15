# ViewTrail

ViewTrail lets you track controllers and views that you select for auditing. You can see who look at what (controller/action/params hash) and when.

## Rails Version

Works with Rails 2.3.

## Usage

    class FooController < ActionController::Base
      has_view_trail :except => :index
    end

Takes :except and :only conditions like other controller filters
    
    >> Activities.last.whodunnit
    >> Activities.last.created_at
    >> Activities.last.controller
    >> Activities.last.action
    >> Activities.last.params
    
## Installation

1. Install ViewTrail as a gem:
  
    `config.gem 'yoon-view_trail', :lib => 'view_trail', :source => 'http://gems.github.com'`

2. Create a migration for the `versions` table
    
    `script/generate view_trail`
  
3. Run the migration.
    
    `rake db:migrate`
  
4. Add `has view_trail` to the controllers you want to track

## TODO

Test!

## Inspiration

* [PaperTrail](http://github.com/airblade/paper_trail/)

## Intellectual Property

Copyright (c) 2009 Mark Yoon. See LICENSE for details.
