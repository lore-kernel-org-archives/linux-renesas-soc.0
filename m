Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:59325 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751025AbdFTHci (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2017 03:32:38 -0400
Date: Tue, 20 Jun 2017 09:32:29 +0200
From: jmondi <jacopo@jmondi.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1 09/12] media: rcar: vin: Install notifier for digital
 input
Message-ID: <20170620073229.GC27008@w540>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
 <1497891889-8038-10-git-send-email-jacopo+renesas@jmondi.org>
 <20170619195114.GH11365@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170619195114.GH11365@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Mon, Jun 19, 2017 at 09:51:15PM +0200, Niklas Söderlund wrote:
> Hi Jacopo,
>
> On 2017-06-19 19:04:46 +0200, Jacopo Mondi wrote:
> > Install async notifier for digital input on Gen3 when no other CSI-2
> > input has been found connected.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c | 23 +++++++++++++++++------
> >  1 file changed, 17 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > index 78ca232..6e5d84a 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -866,17 +866,28 @@ static int rvin_group_graph_init(struct rvin_dev *vin)
> >  	}
> >
> >  	i = 0;
> > -	for_each_set_bit(bit, &bitmap, RVIN_CSI_MAX) {
> > -		subdevs[i++] = &vin->group->csi[bit].asd;
> > +	for_each_set_bit(bit, &bitmap, RVIN_INPUT_MAX) {
> > +		if (bit < RVIN_CSI_MAX)
> > +			subdevs[i++] = &vin->group->csi[bit].asd;
> > +		else if (bit == RVIN_PARALLEL_IN) {
> > +			subdevs[0] = &vin->digital.asd;
> > +			vin->notifier.num_subdevs = 1;
> > +		}
> >  	}
> >
> >  	vin_dbg(vin, "Claimed %d subdevices for group\n", count);
> >
> > -	vin->notifier.num_subdevs = count;
> >  	vin->notifier.subdevs = subdevs;
> > -	vin->notifier.bound = rvin_group_notify_bound;
> > -	vin->notifier.unbind = rvin_group_notify_unbind;
> > -	vin->notifier.complete = rvin_group_notify_complete;
> > +	if (!vin->notifier.num_subdevs) {
> > +		vin->notifier.num_subdevs = count;
> > +		vin->notifier.bound = rvin_group_notify_bound;
> > +		vin->notifier.unbind = rvin_group_notify_unbind;
> > +		vin->notifier.complete = rvin_group_notify_complete;
> > +	} else {
> > +		vin->notifier.bound = rvin_digital_notify_bound;
> > +		vin->notifier.unbind = rvin_digital_notify_unbind;
> > +		vin->notifier.complete = rvin_digital_notify_complete;
> > +	}
>
> Hum, if there is a digital subdevice you ignore to look for CSI-2
> devices? This feels wrong, it probably works (for now) since all CSI-2
> subdevs are found by VIN0 since it's probed first and the digital input
> is only valid for VIN4 and VIN5 right? I hope to remedy this before the
> VIN Gen3 code is ready for upstream and the goal is that each VIN should
> look for the subdevices that effects it self. With that change this will
> break :-(

This is something I probably did not get: I thought parallel input and
CSI-2 input where mutually exclusive. In particular, looking at chsel
tables (from Table 26.14 on), where routing between CSI inputs and VIN
channel is described, I did not get how parallel input fit in that
picture. My best assumption now is that when a channel is NC it means
it can be used for digital input?

>
> >
> >  	mutex_unlock(&vin->group->lock);
> >
> > --
> > 2.7.4
> >
>
> --
> Regards,
> Niklas Söderlund
