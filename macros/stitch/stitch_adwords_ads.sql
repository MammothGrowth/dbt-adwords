{% macro stitch_adwords_ads() %}

    {{ adapter_macro('adwords.stitch_adwords_ads') }}

{% endmacro %}


{% macro default__stitch_adwords_ads() %}

with ads_source as (

    select * from {{ source('google_ads', 'ads') }}

),

ads_renamed as (

    select 

        adgroupid as ad_id,
        baseadgroupid as base_ad_group_id,
        basecampaignid as base_campaign_id,
        policysummary as policy_summary,
        status,
        "_SDC_CUSTOMER_ID" as account_id

    from ads_source

)

select * from ads_renamed

{% endmacro %}