Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:33233 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750869AbdFSTvS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 15:51:18 -0400
Received: by mail-lf0-f51.google.com with SMTP id m77so62191998lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jun 2017 12:51:17 -0700 (PDT)
Date: Mon, 19 Jun 2017 21:51:15 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1 09/12] media: rcar: vin: Install notifier for digital
 input
Message-ID: <20170619195114.GH11365@bigcity.dyn.berto.se>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
 <1497891889-8038-10-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1497891889-8038-10-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On 2017-06-19 19:04:46 +0200, Jacopo Mondi wrote:
> Install async notifier for digital input on Gen3 when no other CSI-2
> input has been found connected.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 78ca232..6e5d84a 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -866,17 +866,28 @@ static int rvin_group_graph_init(struct rvin_dev *vin)
>  	}
>  
>  	i = 0;
> -	for_each_set_bit(bit, &bitmap, RVIN_CSI_MAX) {
> -		subdevs[i++] = &vin->group->csi[bit].asd;
> +	for_each_set_bit(bit, &bitmap, RVIN_INPUT_MAX) {
> +		if (bit < RVIN_CSI_MAX)
> +			subdevs[i++] = &vin->group->csi[bit].asd;
> +		else if (bit == RVIN_PARALLEL_IN) {
> +			subdevs[0] = &vin->digital.asd;
> +			vin->notifier.num_subdevs = 1;
> +		}
>  	}
>  
>  	vin_dbg(vin, "Claimed %d subdevices for group\n", count);
>  
> -	vin->notifier.num_subdevs = count;
>  	vin->notifier.subdevs = subdevs;
> -	vin->notifier.bound = rvin_group_notify_bound;
> -	vin->notifier.unbind = rvin_group_notify_unbind;
> -	vin->notifier.complete = rvin_group_notify_complete;
> +	if (!vin->notifier.num_subdevs) {
> +		vin->notifier.num_subdevs = count;
> +		vin->notifier.bound = rvin_group_notify_bound;
> +		vin->notifier.unbind = rvin_group_notify_unbind;
> +		vin->notifier.complete = rvin_group_notify_complete;
> +	} else {
> +		vin->notifier.bound = rvin_digital_notify_bound;
> +		vin->notifier.unbind = rvin_digital_notify_unbind;
> +		vin->notifier.complete = rvin_digital_notify_complete;
> +	}

Hum, if there is a digital subdevice you ignore to look for CSI-2 
devices? This feels wrong, it probably works (for now) since all CSI-2 
subdevs are found by VIN0 since it's probed first and the digital input 
is only valid for VIN4 and VIN5 right? I hope to remedy this before the 
VIN Gen3 code is ready for upstream and the goal is that each VIN should 
look for the subdevices that effects it self. With that change this will 
break :-(

>  
>  	mutex_unlock(&vin->group->lock);
>  
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
