Return-Path: <linux-media-owner@vger.kernel.org>
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Tue, 13 Mar 2018 18:56:54 +0100
To: kieran.bingham@ideasonboard.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, tomoharu.fukawa.eb@renesas.com
Subject: Re: [PATCH 1/3] rcar-vin: remove duplicated check of state in irq
 handler
Message-ID: <20180313175654.GE10974@bigcity.dyn.berto.se>
References: <20180310000953.25366-1-niklas.soderlund+renesas@ragnatech.se>
 <20180310000953.25366-2-niklas.soderlund+renesas@ragnatech.se>
 <a6fa3bbf-52e5-5576-fbea-3a280a1c8bb1@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6fa3bbf-52e5-5576-fbea-3a280a1c8bb1@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thanks for your feedback.

On 2018-03-13 17:42:25 +0100, Kieran Bingham wrote:
> Hi Niklas,
> 
> Thanks for the patch series :) - I've been looking forward to seeing this one !
> 
> On 10/03/18 01:09, Niklas S�derlund wrote:
> > This is an error from when the driver where converted from soc-camera.
> > There is absolutely no gain to check the state variable two times to be
> > extra sure if the hardware is stopped.
> 
> I'll not say this isn't a redundant check ... but isn't the check against two
> different states, and thus the remaining check doesn't actually catch the case
> now where state == STOPPED ?

Thanks for noticing this, you are correct. I think I need to refresh my 
glasses subscription after missing this :-)

> 
> (Perhaps state != RUNNING would be better ?, but I haven't checked the rest of
> the code)

I will respin this in a v2 and either use state != RUNNING or at least 
combine the two checks to prevent future embarrassing mistakes like 
this.

> 
> --
> Kieran
> 
> 
> > 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-dma.c | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > index 23fdff7a7370842e..b4be75d5009080f7 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -916,12 +916,6 @@ static irqreturn_t rvin_irq(int irq, void *data)
> >  	rvin_ack_interrupt(vin);
> >  	handled = 1;
> >  
> > -	/* Nothing to do if capture status is 'STOPPED' */
> > -	if (vin->state == STOPPED) {
> > -		vin_dbg(vin, "IRQ while state stopped\n");
> > -		goto done;
> > -	}
> > -
> >  	/* Nothing to do if capture status is 'STOPPING' */
> >  	if (vin->state == STOPPING) {
> >  		vin_dbg(vin, "IRQ while state stopping\n");
> > 

-- 
Regards,
Niklas S�derlund
