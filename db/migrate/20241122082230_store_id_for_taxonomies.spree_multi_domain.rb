# This migration comes from spree_multi_domain (originally 20100616204303)
class StoreIdForTaxonomies < SpreeExtension::Migration[4.2]
  def self.up
    if table_exists?('taxonomies')
      unless column_exists?(:taxonomies, :store_id)
        add_column :taxonomies, :store_id, :integer
        add_index :taxonomies, :store_id
      end
    elsif table_exists?('spree_taxonomies')
      unless column_exists?(:spree_taxonomies, :store_id)
        add_column :spree_taxonomies, :store_id, :integer
        add_index :spree_taxonomies, :store_id
      end
    end
  end

  def self.down
    if table_exists?('taxonomies')
      remove_column :taxonomies, :store_id if column_exists?(:taxonomies, :store_id)
    elsif table_exists?('spree_taxonomies')
      remove_column :spree_taxonomies, :store_id if column_exists?(:spree_taxonomies, :store_id)
    end
  end
end
