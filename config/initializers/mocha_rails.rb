spec_path = File.join(Rails.root, "spec", "javascripts")
test_path = File.join(Rails.root, "test", "javascripts")
Rails.application.config.assets.paths << spec_path if FileTest.exists? spec_path
Rails.application.config.assets.paths << test_path if FileTest.exists? test_path
