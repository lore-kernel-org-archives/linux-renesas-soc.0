Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:41482 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750908AbeFCPml (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Jun 2018 11:42:41 -0400
Received: by mail-lf0-f68.google.com with SMTP id d24-v6so21483057lfa.8
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Jun 2018 08:42:40 -0700 (PDT)
Subject: Re: [PATCH 3/6] ravb: remove custom .set_link_ksettings from ethtool
 ops
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-4-git-send-email-vladimir_zapolskiy@mentor.com>
 <ab7d62f4-75eb-a58a-69ff-4ca8c1ece36b@cogentembedded.com>
 <6f908ff0-254b-4378-27d3-5ff973328d88@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6029136a-0aac-31f6-ef9e-edb3b7b45cd1@cogentembedded.com>
Date: Sun, 3 Jun 2018 18:42:37 +0300
MIME-Version: 1.0
In-Reply-To: <6f908ff0-254b-4378-27d3-5ff973328d88@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

   Sorry for the delay replying, the management keeps me busy... :-(

On 05/28/2018 12:51 PM, Vladimir Zapolskiy wrote:

>>> The change replaces a custom implementation of .set_link_ksettings
>>> callback with a shared phy_ethtool_set_link_ksettings(), this fixes
>>> sleep in atomic context bug, which is encountered every time when link
>>> settings are changed by ethtool.
>>
>>    Seeing it now...

   And to say that this is *fixed* by removing the custom method is err...
simply misleading. The sleep in atomic context is fixed solely by the removal
of the spinlock grabbing before the phylib call.

>>> Now duplex mode setting is enforced in ravb_adjust_link() only, also
>>> now TX/RX is disabled when link is put down or modifications to E-MAC
>>> registers ECMR and GECMR are expected for both cases of checked and
>>> ignored link status pin state from E-MAC interrupt handler.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
>>> ---
>>>  drivers/net/ethernet/renesas/ravb_main.c | 58 +++++++++-----------------------
>>>  1 file changed, 15 insertions(+), 43 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>>> index 3d91caa44176..0d811c02ff34 100644
>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>>> @@ -980,6 +980,13 @@ static void ravb_adjust_link(struct net_device *ndev)
>>>  	struct ravb_private *priv = netdev_priv(ndev);
>>>  	struct phy_device *phydev = ndev->phydev;
>>>  	bool new_state = false;
>>> +	unsigned long flags;
>>> +
>>> +	spin_lock_irqsave(&priv->lock, flags);
>>> +
>>> +	/* Disable TX and RX right over here, if E-MAC change is ignored */
>>> +	if (priv->no_avb_link)
>>> +		ravb_rcv_snd_disable(ndev);
>>>  
>>>  	if (phydev->link) {
>>>  		if (phydev->duplex != priv->duplex) {
>>> @@ -997,18 +1004,21 @@ static void ravb_adjust_link(struct net_device *ndev)
>>>  			ravb_modify(ndev, ECMR, ECMR_TXF, 0);
>>>  			new_state = true;
>>>  			priv->link = phydev->link;
>>> -			if (priv->no_avb_link)
>>> -				ravb_rcv_snd_enable(ndev);
>>>  		}
>>>  	} else if (priv->link) {
>>>  		new_state = true;
>>>  		priv->link = 0;
>>>  		priv->speed = 0;
>>>  		priv->duplex = -1;
>>> -		if (priv->no_avb_link)
>>> -			ravb_rcv_snd_disable(ndev);
>>>  	}
>>>  
>>> +	/* Enable TX and RX right over here, if E-MAC change is ignored */
>>> +	if (priv->no_avb_link && phydev->link)
>>> +		ravb_rcv_snd_enable(ndev);
>>> +
>>> +	mmiowb();
>>> +	spin_unlock_irqrestore(&priv->lock, flags);
>>> +
>>
>>    I like this part. :-)
>>
> 
> A weight off my mind :) And I hope that this change will remain the less
> questionable one, other ones from the series are trivial.
> 
> Anyway I hope it is understandable that this part of the change can not
> be simply extracted from the rest one below, otherwise there'll be bugs of
> another type intorduced.

   I never said I'd like to apply this part alone, my idea was more like removing
the spinlock grabbing and the duplex handling down below.

[...]
>>> @@ -1096,44 +1106,6 @@ static int ravb_phy_start(struct net_device *ndev)
>>>  	return 0;
>>>  }
>>>  
>>> -static int ravb_set_link_ksettings(struct net_device *ndev,
>>> -				   const struct ethtool_link_ksettings *cmd)
>>> -{
>>> -	struct ravb_private *priv = netdev_priv(ndev);
>>> -	unsigned long flags;
>>> -	int error;
>>> -
>>> -	if (!ndev->phydev)
>>> -		return -ENODEV;
>>> -
>>> -	spin_lock_irqsave(&priv->lock, flags);
>>> -
>>> -	/* Disable TX and RX */
>>> -	ravb_rcv_snd_disable(ndev);
>>> -
>>> -	error = phy_ethtool_ksettings_set(ndev->phydev, cmd);
>>> -	if (error)
>>> -		goto error_exit;
>>> -
>>> -	if (cmd->base.duplex == DUPLEX_FULL)
>>> -		priv->duplex = 1;
>>> -	else
>>> -		priv->duplex = 0;
>>> -
>>> -	ravb_set_duplex(ndev);
>>> -
>>> -error_exit:
>>> -	mdelay(1);
>>> -
>>> -	/* Enable TX and RX */
>>> -	ravb_rcv_snd_enable(ndev);
>>> -
>>> -	mmiowb();
>>> -	spin_unlock_irqrestore(&priv->lock, flags);
>>> -
>>> -	return error;
>>> -}
>>> -
>>
>>    But this part is clearly lumping it all together... 
> 
> Please elaborate.

   My point is still that complete removal of the custom method was somewhat
premature and completely unnecessary for fixing the issues we have.

>> [...]
>>> @@ -1357,7 +1329,7 @@ static const struct ethtool_ops ravb_ethtool_ops = {
>>>  	.set_ringparam		= ravb_set_ringparam,
>>>  	.get_ts_info		= ravb_get_ts_info,
>>>  	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
>>> -	.set_link_ksettings	= ravb_set_link_ksettings,
>>> +	.set_link_ksettings	= phy_ethtool_set_link_ksettings,
>>
>>    Should have been a part of the final patch in the fix/enhancement chain...
> 
> Please elaborate.
> 
> Do you mean that firstly I have to make erroneous ravb_set_link_ksettings()
> to look similar to phy_ethtool_set_link_ksettings() and then remove it?

   Yes.

> As I see it in the current context (removal of ravb_set_duplex() call and
> so on), the problem with this approach is that the actual fix change will
> be done on top of a number of enchancement changes, thus it contradicts to

   Now I have to ask you to elaborate. I have no idea what you mean. :-(

   And of course, sometimes the things are broken in a so subtle way, that
only as pile of "cleanups" fixed them, we had that situation in e.g. the
R-Car I2C driver -- *none* of AFAIR 9 patches was good as a -stable patch...

> the accepted development/maintenace model "fixes first", and most probably
> it won't be possible to backport the real fix, however this sole change can
> be backported.

   My idea was to move the [G]ECMR writes to the adjust_link() callback and
to stop grabbing the spinlock where it *was* grabbed in the same fix patch.
Then just a single clean up, to start using the new phylib method.

[...]
> --
> With best wishes,
> Vladimir

MBR, Sergei
