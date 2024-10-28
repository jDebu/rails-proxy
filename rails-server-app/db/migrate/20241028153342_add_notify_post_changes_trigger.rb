class AddNotifyPostChangesTrigger < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE OR REPLACE FUNCTION notify_post_changes()
      RETURNS trigger AS $$
      BEGIN
        PERFORM pg_notify('post_changes', TG_OP || ':' || NEW.id);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;
    SQL

    execute <<-SQL
      CREATE TRIGGER post_changes_trigger
      AFTER INSERT OR UPDATE OR DELETE ON posts
      FOR EACH ROW EXECUTE FUNCTION notify_post_changes();
    SQL
  end

  def down
    execute <<-SQL
      DROP TRIGGER IF EXISTS post_changes_trigger ON posts;
    SQL

    execute <<-SQL
      DROP FUNCTION IF EXISTS notify_post_changes();
    SQL
  end
end
