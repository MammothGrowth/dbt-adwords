{% macro fivetran_adwords_click_performance() %}

    {{ adapter_macro('adwords.fivetran_adwords_click_performance') }}

{% endmacro %}


{% macro default__fivetran_adwords_click_performance() %}

with gclid_base as (

    select

        gcl_id as gclid,
        date::date as date_day,
        criteria_id,
        ad_group_id,
        row_number() over (partition by gclid order by date_day) as row_num

    from {{source('google_ads', var('click_performance_report'))}}

)

select * from gclid_base
where row_num = 1
and gclid is not null

{% endmacro %}