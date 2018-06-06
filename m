Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:38403 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752184AbeFFUeS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 16:34:18 -0400
Received: by mail-lf0-f66.google.com with SMTP id i83-v6so11145686lfh.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Jun 2018 13:34:17 -0700 (PDT)
Subject: Re: [PATCH 3/6] ravb: remove custom .set_link_ksettings from ethtool
 ops
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-4-git-send-email-vladimir_zapolskiy@mentor.com>
 <ab7d62f4-75eb-a58a-69ff-4ca8c1ece36b@cogentembedded.com>
 <6f908ff0-254b-4378-27d3-5ff973328d88@mentor.com>
 <6029136a-0aac-31f6-ef9e-edb3b7b45cd1@cogentembedded.com>
 <75b66b77-0165-7258-ccfe-cf3ff08930b2@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f4654c3b-5f76-7912-2069-20022406c631@cogentembedded.com>
Date: Wed, 6 Jun 2018 23:34:14 +0300
MIME-Version: 1.0
In-Reply-To: <75b66b77-0165-7258-ccfe-cf3ff08930b2@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/04/2018 02:07 PM, Vladimir Zapolskiy wrote:

>>>>> The change replaces a custom implementation of .set_link_ksettings
>>>>> callback with a shared phy_ethtool_set_link_ksettings(), this fixes
>>>>> sleep in atomic context bug, which is encountered every time when link
>>>>> settings are changed by ethtool.
>>>>
>>>>    Seeing it now...
>>
>>    And to say that this is *fixed* by removing the custom method is err...
>> simply misleading. The sleep in atomic context is fixed solely by the removal
>> of the spinlock grabbing before the phylib call.

> As I've already said, "the removal of the spinlock grabbing before the phylib
> call" is not a valid fix, but it will introduce another regression.

   It's the necessary part of the fix, unlike using the generic phylib method.

>>>>> Now duplex mode setting is enforced in ravb_adjust_link() only, also
>>>>> now TX/RX is disabled when link is put down or modifications to E-MAC
>>>>> registers ECMR and GECMR are expected for both cases of checked and
>>>>> ignored link status pin state from E-MAC interrupt handler.
>>>>>
>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
>>>>> ---
>>>>>  drivers/net/ethernet/renesas/ravb_main.c | 58 +++++++++-----------------------
>>>>>  1 file changed, 15 insertions(+), 43 deletions(-)
>>>>>
>>>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>>>>> index 3d91caa44176..0d811c02ff34 100644
>>>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>>>>> @@ -980,6 +980,13 @@ static void ravb_adjust_link(struct net_device *ndev)
>>>>>  	struct ravb_private *priv = netdev_priv(ndev);
>>>>>  	struct phy_device *phydev = ndev->phydev;
>>>>>  	bool new_state = false;
>>>>> +	unsigned long flags;
>>>>> +
>>>>> +	spin_lock_irqsave(&priv->lock, flags);
>>>>> +
>>>>> +	/* Disable TX and RX right over here, if E-MAC change is ignored */
>>>>> +	if (priv->no_avb_link)
>>>>> +		ravb_rcv_snd_disable(ndev);
>>>>>  
>>>>>  	if (phydev->link) {
>>>>>  		if (phydev->duplex != priv->duplex) {
>>>>> @@ -997,18 +1004,21 @@ static void ravb_adjust_link(struct net_device *ndev)
>>>>>  			ravb_modify(ndev, ECMR, ECMR_TXF, 0);
>>>>>  			new_state = true;
>>>>>  			priv->link = phydev->link;
>>>>> -			if (priv->no_avb_link)
>>>>> -				ravb_rcv_snd_enable(ndev);
>>>>>  		}
>>>>>  	} else if (priv->link) {
>>>>>  		new_state = true;
>>>>>  		priv->link = 0;
>>>>>  		priv->speed = 0;
>>>>>  		priv->duplex = -1;
>>>>> -		if (priv->no_avb_link)
>>>>> -			ravb_rcv_snd_disable(ndev);
>>>>>  	}
>>>>>  
>>>>> +	/* Enable TX and RX right over here, if E-MAC change is ignored */
>>>>> +	if (priv->no_avb_link && phydev->link)
>>>>> +		ravb_rcv_snd_enable(ndev);
>>>>> +
>>>>> +	mmiowb();
>>>>> +	spin_unlock_irqrestore(&priv->lock, flags);
>>>>> +
>>>>
>>>>    I like this part. :-)
>>>>
>>>
>>> A weight off my mind :) And I hope that this change will remain the less
>>> questionable one, other ones from the series are trivial.
>>>
>>> Anyway I hope it is understandable that this part of the change can not
>>> be simply extracted from the rest one below, otherwise there'll be bugs of
>>> another type intorduced.
>>
>>    I never said I'd like to apply this part alone, my idea was more like removing
>> the spinlock grabbing and the duplex handling down below.
>>
> 
> As I've already said, "the removal of the spinlock grabbing" is not a valid fix,
> but it will introduce another regression.
> 
> Please tell me, a removal of duplex handling change should be done before
> a removal of the spinlock grabbing? Or after?

   As much as I was able to figure out, at the same time.

>> [...]
>>>>> @@ -1357,7 +1329,7 @@ static const struct ethtool_ops ravb_ethtool_ops = {
>>>>>  	.set_ringparam		= ravb_set_ringparam,
>>>>>  	.get_ts_info		= ravb_get_ts_info,
>>>>>  	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
>>>>> -	.set_link_ksettings	= ravb_set_link_ksettings,
>>>>> +	.set_link_ksettings	= phy_ethtool_set_link_ksettings,
>>>>
>>>>    Should have been a part of the final patch in the fix/enhancement chain...
>>>
>>> Please elaborate.
>>>
>>> Do you mean that firstly I have to make erroneous ravb_set_link_ksettings()
>>> to look similar to phy_ethtool_set_link_ksettings() and then remove it?
>>
>>    Yes.

> Then this change of "ravb_set_link_ksettings() looks similar to
> phy_ethtool_set_link_ksettings()" will be a single commit, and it will be
> a fix. Does it sound good?

   It does, as I was trying to tell you. :-)

>>> As I see it in the current context (removal of ravb_set_duplex() call and
>>> so on), the problem with this approach is that the actual fix change will
>>> be done on top of a number of enchancement changes, thus it contradicts to
>>
>>    Now I have to ask you to elaborate. I have no idea what you mean. :-(
> 
> My statement is based on the next facts:

  s/next/following/?

> 1. ravb_set_duplex() call in ravb_set_link_ksettings() is unnecessary,
>    however its removal is an enchancement,
> 2. removal of the spinlock grabbing is just a *part* of the proper fix,
>    and the complete proper fix includes ravb_set_duplex() call removal,
>    adding spinlock grabbing to ravb_adjust_link() and other modifications
>    to ravb_adjust_link() from this commit.

   So far, so good. :-)

> 3. commits with fixes must precede commits with enchancements in the
>    series, because enchancements are not backported.

   Enhancements?
   Yes, if at all possible.

> The question remains the same, what do you ask me to do? 

   Mainly, to separate fixes from clean-ups, as much as possible. That'll simplify
the -stable backport handling for DaveM and the people maintaining the earlier kernel
versions.

>>    And of course, sometimes the things are broken in a so subtle way, that
>> only as pile of "cleanups" fixed them, we had that situation in e.g. the
>> R-Car I2C driver -- *none* of AFAIR 9 patches was good as a -stable patch...
>>
>>> the accepted development/maintenace model "fixes first", and most probably
>>> it won't be possible to backport the real fix, however this sole change can
>>> be backported.
>>
>>    My idea was to move the [G]ECMR writes to the adjust_link() callback and
>> to stop grabbing the spinlock where it *was* grabbed in the same fix patch.
>> Then just a single clean up, to start using the new phylib method.

> It will be okay iff ravb_set_duplex() call removal is added to the first
> part ("fixes" part) of two changes. Please confirm that our understanding
> is aligned.

   Yes, and I've tried to communicate that to you but somehow failed. :-)
> --
> With best wishes,
> Vladimir

MBR, Sergei
