Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:40368 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751881AbeEOXAS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 19:00:18 -0400
Subject: Re: [PATCH net-next 2/2] drivers: net: Remove device_node checks with
 of_mdiobus_register()
To: Grygorii Strashko <grygorii.strashko@ti.com>,
        netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
        "David S. Miller" <davem@davemloft.net>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Fugang Duan <fugang.duan@nxp.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Woojung Huh <woojung.huh@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Antoine Tenart <antoine.tenart@free-electrons.com>,
        Tobias Jordan <Tobias.Jordan@elektrobit.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>,
        Maxim Uvarov <muvarov@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:RENESAS ETHERNET DRIVERS"
        <linux-renesas-soc@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)"
        <linux-omap@vger.kernel.org>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
        <devicetree@vger.kernel.org>
References: <20180515215930.12115-1-f.fainelli@gmail.com>
 <20180515215930.12115-3-f.fainelli@gmail.com>
 <1112dc66-5300-89f8-8382-ceb7a024e933@ti.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b3073c3b-7f97-c24d-1c4f-7459a5b70f1b@gmail.com>
Date: Tue, 15 May 2018 15:59:58 -0700
MIME-Version: 1.0
In-Reply-To: <1112dc66-5300-89f8-8382-ceb7a024e933@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/15/2018 03:57 PM, Grygorii Strashko wrote:
> 
> 
> On 05/15/2018 04:59 PM, Florian Fainelli wrote:
>> A number of drivers have the following pattern:
>>
>> if (np)
>>     of_mdiobus_register()
>> else
>>     mdiobus_register()
>>
>> which the implementation of of_mdiobus_register() now takes care of.
>> Remove that pattern in drivers that strictly adhere to it.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>   drivers/net/dsa/bcm_sf2.c                         |  8 ++------
>>   drivers/net/dsa/mv88e6xxx/chip.c                  |  5 +----
>>   drivers/net/ethernet/cadence/macb_main.c          | 12 +++---------
>>   drivers/net/ethernet/freescale/fec_main.c         |  8 ++------
>>   drivers/net/ethernet/marvell/mvmdio.c             |  5 +----
>>   drivers/net/ethernet/renesas/sh_eth.c             | 11 +++--------
>>   drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |  5 +----
>>   drivers/net/ethernet/ti/davinci_mdio.c            |  6 ++----
>>   drivers/net/phy/mdio-gpio.c                       |  6 +-----
>>   drivers/net/phy/mdio-mscc-miim.c                  |  6 +-----
>>   drivers/net/usb/lan78xx.c                         |  7 ++-----
>>   11 files changed, 19 insertions(+), 60 deletions(-)
>>
> 
> ...
> 
>>           goto bus_register_fail;
>> diff --git a/drivers/net/ethernet/ti/davinci_mdio.c
>> b/drivers/net/ethernet/ti/davinci_mdio.c
>> index 98a1c97fb95e..e720244e7f71 100644
>> --- a/drivers/net/ethernet/ti/davinci_mdio.c
>> +++ b/drivers/net/ethernet/ti/davinci_mdio.c
>> @@ -431,10 +431,8 @@ static int davinci_mdio_probe(struct
>> platform_device *pdev)
>>        */
>>       if (dev->of_node && of_get_child_count(dev->of_node)) {
> 
> It causes build error due to "{" above.

Humpf, shame on me for not enabling that driver, thanks for catching this!

> 
>>           data->skip_scan = true;
>> -        ret = of_mdiobus_register(data->bus, dev->of_node);
>> -    } else {
>> -        ret = mdiobus_register(data->bus);
>> -    }
>> +
>> +    ret = of_mdiobus_register(data->bus, dev->of_node);
>>       if (ret)
>>           goto bail_out;
>>   diff --git a/drivers/net/phy/mdio-gpio.c b/drivers/net/phy/mdio-gpio.c
>> index b501221819e1..4e4c8daf44c3 100644
>> --- a/drivers/net/phy/mdio-gpio.c
>> +++ b/drivers/net/phy/mdio-gpio.c
>> @@ -179,11 +179,7 @@ static int mdio_gpio_probe(struct platform_device
>> *pdev)
> 
> [...]
> 


-- 
Florian
