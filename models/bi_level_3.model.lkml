connection: "events_ecommerce"

# include all the views
include: "/views/*.view"

# default datagroup
datagroup: ecommerce_case_study_default_datagroup {
  sql_trigger: SELECT CURRENT_DATE ;;
  max_cache_age: "24 hour"
}

explore: user_facts {

}

explore: product_inventory_analysis {
  join: products {
    type: left_outer
    sql_on: ${products.sku} = ${product_inventory_analysis.product_sku}
    ;;
    relationship: many_to_one
  }
}

explore: order_items {
  label: "Orders"
  view_label: "(1) Orders and Items"
  persist_with: ecommerce_case_study_default_datagroup

  join: users {
    view_label: "(2) Users"
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: user_facts {
    view_label: "(2) Users"
    type: left_outer
    sql_on: ${users.id} = ${user_facts.user_id} ;;
    relationship: one_to_one
  }

  # join: category_order_facts {
  #   type: left_outer
  #   sql_on: ${products.category} = ${category_order_facts.category} ;;
  #   relationship: many_to_one
  # }

  join: inventory_items {
    view_label: "(3) Inventory"
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    view_label: "(4) Products"
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

}
