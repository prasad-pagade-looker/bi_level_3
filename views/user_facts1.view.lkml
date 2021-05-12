view: user_facts1 {
  derived_table: {
    sql: SELECT
         order_items.user_id AS user_id
        ,COUNT(distinct order_items.order_id) AS lifetime_order_count
        ,SUM(order_items.sale_price) AS lifetime_revenue
        ,MIN(order_items.created_at) AS first_order_date -- (optional)
        ,MAX(order_items.created_at) AS latest_order_date -- (optional)
        FROM order_items
        GROUP BY user_id
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: lifetime_order_count {
    type: number
    sql: ${TABLE}.lifetime_order_count ;;
  }

  dimension: lifetime_revenue {
    type: number
    sql: ${TABLE}.lifetime_revenue ;;
  }

  dimension_group: first_order {
    type: time
    sql: ${TABLE}.first_order_date ;;
  }

  dimension_group: latest_order {
    type: time
    sql: ${TABLE}.latest_order_date ;;
  }

  dimension: latest_order {
    type: date
    sql: ${TABLE}.latest_order_date ;;
  }

  measure: count_user_facts {
    type: count
  }

  measure: total_lifetime_order_count {
    type: sum
    sql: ${lifetime_order_count} ;;
  }

  measure: total_lifetime_revenue {
    type: sum
    sql: ${lifetime_revenue} ;;
    value_format_name: usd
  }

  measure: min_first_order_date {
    type: min
    sql: ${first_order_date} ;;
  }

  measure: max_latest_order_date {
    type: max
    sql: ${latest_order_date} ;;
  }

  set: detail {
    fields: [user_id, lifetime_order_count, lifetime_revenue, first_order_time, latest_order_time]
  }
}
