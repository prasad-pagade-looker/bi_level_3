view: user_sql_dt {
  derived_table: {
    sql: select * FROM users
      ;;
  }

  measure: count_of_users {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: whole_name {
    type: string
    sql: ${last_name} || ', ' || ${first_name} ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: zip {
    type: string
    sql: ${TABLE}.zip ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  dimension: sales {
    type: number
    sql: 29 ;;
  }

  measure: total_sales {
    type: sum
    sql: ${sales} ;;
  }

  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      email,
      age,
      city,
      state,
      country,
      zip,
      latitude,
      longitude,
      gender,
      created_at_time,
      traffic_source,
      location
    ]
  }
}
