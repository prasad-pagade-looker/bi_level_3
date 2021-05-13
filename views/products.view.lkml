view: products {
  sql_table_name: public.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  # dimension: brand {
  #   sql: TRIM(${TABLE}.brand) ;;
  #   link: {
  #     label: "Website"
  #     url: "http://www.google.com/search?q={{ value | encode_uri }}"
  #     icon_url: "http://www.google.com/s2/favicons?domain=www.{{ value | encode_uri }}.com"
  #   }
  # }

  # dimension: brand {
  #   sql: TRIM(${TABLE}.brand) ;;
  #   link: {
  #     label: "{{value}} Analytics Dashboard"
  #     url: "/dashboards-next/4263?Brand={{ value | encode_uri }}"
  #     icon_url: "http://www.looker.com/favicon.ico"
  #   }
  # }



  # dimension: category {
  #   type: string
  #   sql: ${TABLE}.category ;;
  # }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    link: {
      label: "View Category Detail"
      url: "/explore/bi_level_3/inventory_items?fields=inventory_items.product_category,inventory_items.product_name,inventory_items.count&f[products.category]={{value | url_encode }}"
    }
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: distribution_center_id {
    type: number
    sql: ${TABLE}.distribution_center_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, inventory_items.count]
  }
}
