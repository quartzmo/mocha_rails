module MochaRails
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    class_option :mount, :aliases => '-m', :type => :string, :default => 'mocha', :desc => 'mounts engine at specified MOUNT route'
    class_option :javascript, :aliases => '-j', :type => :boolean, :default => false, :desc => 'generate javascript mocha file rather than coffeescript'

    desc 'installs mocha_rails into your application'
    def install    
      route "mount MochaRails::Engine => '#{options[:mount]}' unless Rails.env.production?"

      test_dir = Dir.exists?(Rails.root.join "spec") ? "spec" : "test"

      if options[:javascript]
        copy_file 'mocha-suite.js', "#{test_dir}/javascripts/mocha-suite.js"
      else
        copy_file 'mocha-suite.js.coffee', "#{test_dir}/javascripts/mocha-suite.js.coffee"
      end
    end
  end
end