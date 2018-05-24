Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:39255 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030743AbeEXQSc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 12:18:32 -0400
Received: by mail-wr0-f194.google.com with SMTP id w18-v6so4190581wrn.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 May 2018 09:18:31 -0700 (PDT)
Subject: Re: [PATCH 1/6] ravb: remove custom .nway_reset from ethtool ops
To: Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-2-git-send-email-vladimir_zapolskiy@mentor.com>
 <20180524132202.GE24557@lunn.ch>
 <2bf96562-e402-d797-31e6-ba7e262e5637@mleia.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <af16fdce-427e-c73a-b18b-d5f1c1d9d624@cogentembedded.com>
Date: Thu, 24 May 2018 19:18:28 +0300
MIME-Version: 1.0
In-Reply-To: <2bf96562-e402-d797-31e6-ba7e262e5637@mleia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 05/24/2018 05:11 PM, Vladimir Zapolskiy wrote:

>>> The change fixes a sleep in atomic context issue, which can be
>>> always triggered by running 'ethtool -r' command, because
>>> phy_start_aneg() protects phydev fields by a mutex.

  You don't say that *not* grabbing the spinlock is safe... 

>>> Another note is that the change implicitly replaces phy_start_aneg()
>>> with a newer phy_restart_aneg().

   Hm, perphaps this could be a material for a separate patch? 

>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
>>> ---
>>>  drivers/net/ethernet/renesas/ravb_main.c | 17 +----------------
>>>  1 file changed, 1 insertion(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>>> index 68f122140966..4a043eb0e2aa 100644
>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>>> @@ -1150,21 +1150,6 @@ static int ravb_set_link_ksettings(struct net_device *ndev,
>>>  	return error;
>>>  }
>>>  
>>> -static int ravb_nway_reset(struct net_device *ndev)
>>> -{
>>> -	struct ravb_private *priv = netdev_priv(ndev);
>>> -	int error = -ENODEV;
>>> -	unsigned long flags;
>>> -
>>> -	if (ndev->phydev) {
>>> -		spin_lock_irqsave(&priv->lock, flags);
>>> -		error = phy_start_aneg(ndev->phydev);
>>> -		spin_unlock_irqrestore(&priv->lock, flags);
>>> -	}
>>
>> Eck! phylib assumes thread context and takes a mutex while calling
>> into the PHY driver.
>>
>> It would be good to add some sort of fixes: tag. Maybe for the commit
>> that added the generic nway_reset? That would at least cover some
>> stable kernels.
>>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>
> 
> Hi Andrew, thank you for review.
> 
> generally it makes sense to add Fixes tag, but as I said in
> the commit message the problem is present before reused phy_ethtool_*()
> functions were added to the kernel, so some kind of juggling with
> the proper kernel version would be required in assumption that
> the fixes are backported as an unmodified changes.

   The -stable fixes can vary from version to version, IIUC. You could be
asked to backport your patch if Greg KH (or somebody else from the -stable
kernel maintainers) gets in trouble backporting your patch. 

> Hopefully Sergei as the driver maintainer can verify the fixes on

   I'm *not* a maintainer, just a humble reviewer! :-)

> older kernels and suggest the right kernel versions for backporting.

   This would be asking too much from me, I'm afraid...
   Still, Dave, could you please give me a couple of days to spend on
this series?

> --
> With best wishes,
> Vladimir

MBR, Sergei
