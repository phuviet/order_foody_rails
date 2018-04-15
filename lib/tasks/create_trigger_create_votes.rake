namespace :db do
  desc 'create_function_update_star_product'
  task create_trigger_create_votes: :environment do
    ActiveRecord::Base.connection.execute("
      CREATE TRIGGER update_start_after_create
      AFTER INSERT
      ON votes
      FOR EACH ROW
      EXECUTE PROCEDURE update_star_product();
    ")
  end
end
