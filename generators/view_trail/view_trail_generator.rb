class ViewTrailGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      m.migration_template 'create_activities.rb', 'db/migrate', :migration_file_name => 'create_activities'
    end
  end

end
