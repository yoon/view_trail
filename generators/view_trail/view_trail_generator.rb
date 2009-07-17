class ViewTrailGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      m.migration_template 'create_activities_and_items.rb', 'db/migrate', :migration_file_name => 'create_activities_and_items'
    end

  end

end
