connection: "events_ecommerce"

# include all the views
include: "/views/*.view"

# default datagroup
datagroup: ecommerce_case_study_default_datagroup {
  sql_trigger: SELECT CURRENT_DATE ;;
  max_cache_age: "24 hour"
}

explore: user_facts1 {}
explore: user_facts_ndt {
  join: users {
    type: left_outer
    sql_on: ${user_facts_ndt.id} = ${users.id} ;;
    relationship: one_to_one
  }
}

explore: product_inventory_analysis2 {
  join: products {
    type: left_outer
    sql_on: ${product_inventory_analysis2.product_sku} = ${products.sku} ;;
  }
}

explore: product_inventory_analysis {
  join: products {
    type: left_outer
    sql_on: ${product_inventory_analysis.product_sku} = ${products.sku} ;;
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

  join: top_five {
    type: left_outer
    sql_on: ${top_five.brand} = ${products.brand} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    view_label: "(5) Distribution Centers"
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }

  # join: user_order_sequence_facts {
  #   view_label: "(6) User Order Sequencing"
  #   type: left_outer
  #   sql_on: ${order_items.id} = ${user_order_sequence_facts.order_id} ;;
  #   relationship: many_to_one
  # }

  # join: brand_order_facts_ndt_1 {
  #   type: left_outer
  #   sql_on: ${brand_order_facts_ndt_1.brand} = ${products.id};;
  #   relationship: many_to_one
  # }
}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  fields: [ALL_FIELDS*, -distribution_centers.distance_from_distribution, -distribution_centers.distance_from_distribution_tiers]
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: users {
  view_label: " Users"
  join: user_facts {
    type: left_outer
    sql_on: ${users.id} = ${user_facts.user_id} ;;
    relationship: one_to_one
  }
  join: user_retention {
    type: left_outer
    sql_on: ${users.id} = ${user_retention.user_id} ;;
    relationship: one_to_one
  }
  join: order_items {
    view_label: " Users"
    type: left_outer
    sql_on: ${users.id} = ${order_items.user_id} ;;
    relationship: one_to_many
    fields: [order_items.total_revenue]
  }
}
