Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:50912 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966751AbeEXOGq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 10:06:46 -0400
Subject: Re: [PATCH 3/6] ravb: remove custom .set_link_ksettings from ethtool
 ops
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-4-git-send-email-vladimir_zapolskiy@mentor.com>
 <20180524132944.GF24557@lunn.ch>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <361ea90f-4231-faec-530b-cdafdbb32a39@mleia.com>
Date: Thu, 24 May 2018 17:06:43 +0300
MIME-Version: 1.0
In-Reply-To: <20180524132944.GF24557@lunn.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Andrew,

On 05/24/2018 04:29 PM, Andrew Lunn wrote:
> On Thu, May 24, 2018 at 02:11:55PM +0300, Vladimir Zapolskiy wrote:
>> The change replaces a custom implementation of .set_link_ksettings
>> callback with a shared phy_ethtool_set_link_ksettings(), this fixes
>> sleep in atomic context bug, which is encountered every time when link
>> settings are changed by ethtool.
>>
>> Now duplex mode setting is enforced in ravb_adjust_link() only, also
>> now TX/RX is disabled when link is put down or modifications to E-MAC
>> registers ECMR and GECMR are expected for both cases of checked and
>> ignored link status pin state from E-MAC interrupt handler.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
>> ---
>>  drivers/net/ethernet/renesas/ravb_main.c | 58 +++++++++-----------------------
>>  1 file changed, 15 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index 3d91caa44176..0d811c02ff34 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -980,6 +980,13 @@ static void ravb_adjust_link(struct net_device *ndev)
>>  	struct ravb_private *priv = netdev_priv(ndev);
>>  	struct phy_device *phydev = ndev->phydev;
>>  	bool new_state = false;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&priv->lock, flags);
> 
> Hi Vladimir
> 
> It is pretty unusual to see an adjust_link callback take a lock. Is it
> clearly defined what it is protecting?
> 

thank you for review.

As the commit message says, the hardware manual claims that
any modifications to ECMR and GECMR registers, i.e. calls to
ravb_set_duplex() and ravb_set_rate() from the modified
ravb_adjust_link() function, has to be done when RX/TX is
disabled (same ECMR register bit fields), the spinlock
serializes interrupt handlers and modifications to ECMR contents,
its previous usage for ethtool handlers was obviously wrong.

The information is quite implicit, but the change emphasizes
it.

--
With best wishes,
Vladimir
