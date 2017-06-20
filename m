Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:47087 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751144AbdFTH2i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2017 03:28:38 -0400
Date: Tue, 20 Jun 2017 09:28:29 +0200
From: jmondi <jacopo@jmondi.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1 05/12] media: rcar: vin: Prepare to parse Gen3 digital
 input
Message-ID: <20170620072829.GB27008@w540>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
 <1497891889-8038-6-git-send-email-jacopo+renesas@jmondi.org>
 <20170619193946.GF11365@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170619193946.GF11365@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,
    thanks for review

On Mon, Jun 19, 2017 at 09:39:46PM +0200, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for your patch.
>
> On 2017-06-19 19:04:42 +0200, Jacopo Mondi wrote:
> > Support parsing digital input on configurable port id and reg
> > properties. Also make the function return -ENOENT when no subdevice is
> > found.
> > This change is needed to support parsing digital input on Gen3.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > index 175f138..ef61bcc 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -511,7 +511,9 @@ static int rvin_digital_notify_bound(struct v4l2_async_notifier *notifier,
> >  	return 0;
> >  }
> >
> > -static int rvin_digital_graph_parse(struct rvin_dev *vin)
> > +static int rvin_digital_graph_parse(struct rvin_dev *vin,
> > +				    unsigned int port,
> > +				    unsigned int reg)
> >  {
> >  	struct device_node *ep, *np;
> >  	int ret;
> > @@ -519,13 +521,9 @@ static int rvin_digital_graph_parse(struct rvin_dev *vin)
> >  	vin->digital.asd.match.fwnode.fwnode = NULL;
> >  	vin->digital.subdev = NULL;
> >
> > -	/*
> > -	 * Port 0 id 0 is local digital input, try to get it.
> > -	 * Not all instances can or will have this, that is OK
> > -	 */
> > -	ep = of_graph_get_endpoint_by_regs(vin->dev->of_node, 0, 0);
> > +	ep = of_graph_get_endpoint_by_regs(vin->dev->of_node, port, reg);
>
> I don't think it's necessary to supply the port and reg from the caller.
> If the DT proposed in rcar_vin.txt is used.
>
> >  	if (!ep)
> > -		return 0;
> > +		return -ENOENT;
>
> I'm not saying this is wrong, but why do you change this? I can't see a
> clear advantage in doing so. And if do it I think it should be done in a
> separate patch explaining why.

For both questions, as I parse entries in port@2 and
rvin_digital_notify_bound was intended to use port@0 by default I made
port and reg parameters. I use -ENOENT to distinguish the case where
no endpoint has been found

>
> >
> >  	np = of_graph_get_remote_port_parent(ep);
> >  	if (!np) {
> > @@ -555,11 +553,15 @@ static int rvin_digital_graph_init(struct rvin_dev *vin)
> >  	if (ret)
> >  		return ret;
> >
> > -	ret = rvin_digital_graph_parse(vin);
> > -	if (ret)
> > +	/*
> > +	 * Port 0 id 0 is local digital input, try to get it.
> > +	 * Not all instances can or will have this, that is OK
> > +	 */
> > +	ret = rvin_digital_graph_parse(vin, 0, 0);
> > +	if (ret && ret != -ENOENT)
> >  		return ret;
> >
> > -	if (!vin->digital.asd.match.fwnode.fwnode) {
> > +	if (ret == -ENOENT) {
> >  		vin_dbg(vin, "No digital subdevice found\n");
> >  		return -ENODEV;
> >  	}
> > --
> > 2.7.4
> >
>
> --
> Regards,
> Niklas Söderlund
