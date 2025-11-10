{{ config(

    materialized = 'table',

    database = 'GROUP4',

    schema = 'dw_ecoessentials'

) }}
 
select

    emaileventid,

    emailid,

    emailname,

    campaignid,

    campaignname,

    customerid,

    subscriberid,

    subscriberemail,

    subscriberfirstname,

    subscriberlastname,

    sendtimestamp,

    eventtype,

    eventtimestamp

from {{ source('ecoessentials_marketing', 'MARKETING_EMAILS') }}

 