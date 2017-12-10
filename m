Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:42641 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751750AbdLJMqI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 10 Dec 2017 07:46:08 -0500
Received: by mail-lf0-f68.google.com with SMTP id i2so16257694lfe.9
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Dec 2017 04:46:08 -0800 (PST)
Subject: Re: [PATCH 1/2] net: sh_eth: add support for SH7786
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20171204141744.18599-1-thomas.petazzoni@free-electrons.com>
 <20171204141744.18599-2-thomas.petazzoni@free-electrons.com>
 <86b47029-6474-31c9-b48a-9f5215b73378@cogentembedded.com>
Message-ID: <8df2f650-a9de-9129-6a64-b6583ba14fad@cogentembedded.com>
Date: Sun, 10 Dec 2017 15:46:04 +0300
MIME-Version: 1.0
In-Reply-To: <86b47029-6474-31c9-b48a-9f5215b73378@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/10/2017 03:20 PM, Sergei Shtylyov wrote:

>> This commit adds the sh_eth_cpu_data structure that describes the
>> SH7786 variant of the IP.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>>   drivers/net/ethernet/renesas/sh_eth.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/renesas/sh_eth.c 
>> b/drivers/net/ethernet/renesas/sh_eth.c
>> index 0074c5998481..a3c48b2a713c 100644
>> --- a/drivers/net/ethernet/renesas/sh_eth.c
>> +++ b/drivers/net/ethernet/renesas/sh_eth.c
>> @@ -710,6 +710,30 @@ static struct sh_eth_cpu_data sh7724_data = {
>>       .rpadir_value    = 0x00020000, /* NET_IP_ALIGN assumed to be 2 */
>>   };
>> +static struct sh_eth_cpu_data sh7786_data = {
>> +    .set_duplex    = sh_eth_set_duplex,
> 
>     Hm, no bitrate switching?
>     (ECMR.OLB is said to be unused indeed in the manual...)

    I meant CXR20.OLB -- as it's called in the SH7786 and R-Car manuals.

MBR, Sergei
