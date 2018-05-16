Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:38965 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751033AbeEPUe2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 16:34:28 -0400
Received: by mail-wr0-f193.google.com with SMTP id q3-v6so3247061wrj.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 May 2018 13:34:27 -0700 (PDT)
Subject: Re: [PATCH 1/3] sh_eth: add RGMII support
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org
References: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
 <38a56174-c05d-8864-adf0-d3099e426a60@cogentembedded.com>
 <20180516203031.GI26028@lunn.ch>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <252cbfe6-ed4b-aebb-e5b7-1b60cec7fb69@cogentembedded.com>
Date: Wed, 16 May 2018 23:34:25 +0300
MIME-Version: 1.0
In-Reply-To: <20180516203031.GI26028@lunn.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/16/2018 11:30 PM, Andrew Lunn wrote:

>> The R-Car V3H (AKA R8A77980) GEther controller  adds support for the RGMII
>> PHY interface mode as a new  value  for the RMII_MII register.
>>
>> Based on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>>  drivers/net/ethernet/renesas/sh_eth.c |    3 +++
>>  1 file changed, 3 insertions(+)
>>
>> Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
>> ===================================================================
>> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
>> +++ net-next/drivers/net/ethernet/renesas/sh_eth.c
>> @@ -466,6 +466,9 @@ static void sh_eth_select_mii(struct net
>>  	u32 value;
>>  
>>  	switch (mdp->phy_interface) {
>> +	case PHY_INTERFACE_MODE_RGMII:
>> +		value = 0x3;
>> +		break;
> 
> Hi Sergei
> 
> What about
> 	PHY_INTERFACE_MODE_RGMII_ID,
> 	PHY_INTERFACE_MODE_RGMII_RXID,
> 	PHY_INTERFACE_MODE_RGMII_TXID,

   Oops, totally forgot about those... :-/

>      Andrew

MBR, Sergei
