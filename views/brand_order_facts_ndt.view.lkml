view: brand_order_facts_ndt {
  derived_table: {
    explore_source: order_items {
    # filters: [order_items.created_date: "365 days"]
    bind_filters: {
      from_field: order_items.created_date
      to_field: order_items.created_date
    }

      }
    }
  }
