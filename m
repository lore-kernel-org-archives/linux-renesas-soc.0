Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:51973 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731751AbeGSSJj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 14:09:39 -0400
Received: by mail-wm0-f66.google.com with SMTP id h3-v6so6551190wmb.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 10:25:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <f7dad4b7-d1d6-3fcc-750d-deffc0e26717@cogentembedded.com>
References: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
 <153200106718.13504.7319401547888522726.sendpatchset@little-apple> <f7dad4b7-d1d6-3fcc-750d-deffc0e26717@cogentembedded.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 20 Jul 2018 02:25:28 +0900
Message-ID: <CANqRtoQiyxrBwmNEZcDjMfR3ZPH-XfmXjJe0eCuvRE_zB0QKOw@mail.gmail.com>
Subject: Re: [PATCH/RFC 01/02] ravb: Do not announce 100Mbps HDX as supported
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thanks for your reply!

On Thu, Jul 19, 2018 at 11:32 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Hello!
>
> On 07/19/2018 02:51 PM, Magnus Damm wrote:
>
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> According to the data sheet the Ethernet-AVB hardware in R-Car Gen3
>> and R-Car Gen2 SoCs do not support half duplex operation. So update
>> the driver to mark 100Mbit HDX as unsupported.
>
>    What about 1000Mbit HDX?

For Twister Pair I believe 10 and 100 Mbps come in HDX and FDX flavors
while 1 Gbps is HDX-only.

https://en.wikipedia.org/wiki/Ethernet_over_twisted_pair

>> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>> ---
>>
>>  Written on top of renesas-drivers-2018-07-17-v4.18-rc5
>>
>>  drivers/net/ethernet/renesas/ravb_main.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> --- 0001/drivers/net/ethernet/renesas/ravb_main.c
>> +++ work/drivers/net/ethernet/renesas/ravb_main.c     2018-07-19 19:18:38.210607110 +0900
>> @@ -1066,8 +1066,8 @@ static int ravb_phy_init(struct net_devi
>>               netdev_info(ndev, "limited PHY to 100Mbit/s\n");
>>       }
>>
>> -     /* 10BASE is not supported */
>> -     phydev->supported &= ~PHY_10BT_FEATURES;
>> +     /* Nether 10BASE nor half duplex is supported */
>
>    Neither. s/is/are/?
>
>> +     phydev->supported &= ~(PHY_10BT_FEATURES | SUPPORTED_100baseT_Half);
>
>    I think you missed SUPPORTED_1000baseT_Half.

Perhaps so, but in reality all our boards use a PHY with Twisted Pair
cables so SUPPORTED_1000baseT_Half doesn't exist in reality. That
aside, I suspect the PHY layer is designed to support more than just
Ethernet-over-TP so that's the reason for that particular constant and
all the other stuff in phy.h.

> [garbage skipped]

You mean the rest of the driver? =)

Cheers,

/ magnus
