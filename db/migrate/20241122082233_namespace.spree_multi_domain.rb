# This migration comes from spree_multi_domain (originally 20120223183401)
class Namespace < SpreeExtension::Migration[4.2]
  def up
    if table_exists?(:products_stores) && !table_exists?(:spree_products_stores)
      rename_table :products_stores, :spree_products_stores
    end
  end

  def down
    if table_exists?(:spree_products_stores) && !table_exists?(:products_stores)
      rename_table :spree_products_stores, :products_stores
    end
  end
end
