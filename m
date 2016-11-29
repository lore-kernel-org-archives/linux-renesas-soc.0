Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34289 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751479AbcK2SvK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 13:51:10 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>,
        Xinliang Liu <z.liuxinliang@hisilicon.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Alison Wang <alison.wang@freescale.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        linux-renesas-soc@vger.kernel.org,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Rongrong Zou <zourongrong@gmail.com>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Vincent Abriou <vincent.abriou@st.com>
Subject: Re: [PATCH v3 03/13] drm: bridge: Link encoder and bridge in core code
Date: Tue, 29 Nov 2016 20:51:24 +0200
Message-ID: <1784422.tJdaWN1V2H@avalon>
In-Reply-To: <5506403.Ty4tXHheMg@avalon>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161129100527.d2tbv7vk75zqgkax@phenom.ffwll.local> <5506403.Ty4tXHheMg@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Tuesday 29 Nov 2016 20:02:01 Laurent Pinchart wrote:
> On Tuesday 29 Nov 2016 11:05:27 Daniel Vetter wrote:
> > On Tue, Nov 29, 2016 at 11:43:19AM +0200, Laurent Pinchart wrote:
> >> On Tuesday 29 Nov 2016 10:35:24 Daniel Vetter wrote:
> >>> On Tue, Nov 29, 2016 at 11:04:33AM +0200, Laurent Pinchart wrote:
> >>>> Instead of linking encoders and bridges in every driver (and getting
> >>>> it wrong half of the time, as many drivers forget to set the
> >>>> drm_bridge encoder pointer), do so in core code. The
> >>>> drm_bridge_attach() function needs the encoder and optional previous
> >>>> bridge to perform that task, update all the callers.
> >>>> 
> >>>> Signed-off-by: Laurent Pinchart
> >>>> <laurent.pinchart+renesas@ideasonboard.com>
> >>>> ---

[snip]

> >>>> diff --git a/drivers/gpu/drm/drm_bridge.c
> >>>> b/drivers/gpu/drm/drm_bridge.c
> >>>> index 0ee052b7c21a..850bd6509ef1 100644
> >>>> --- a/drivers/gpu/drm/drm_bridge.c
> >>>> +++ b/drivers/gpu/drm/drm_bridge.c
> 
> [snip]
> 
> >>>> -int drm_bridge_attach(struct drm_device *dev, struct drm_bridge
> >>>> *bridge)
> >>>> +int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge
> >>>> *bridge,
> >>>> +		      struct drm_bridge *previous)
> >>>>  {
> >>>> -	if (!dev || !bridge)
> >>>> +	int ret;
> >>>> +
> >>>> +	if (!encoder || !bridge)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	if (previous && (!previous->dev || previous->encoder !=
> >>>> encoder))
> >>>>  		return -EINVAL;
> >>> 
> >>> Not sure we want to allow setting both encoder and bridge for chaining.
> >>> I'd kinda expect that for chained use-case the bridge doesn't care that
> >>> much who started the chain. And if not we can always create a helper to
> >>> look up the drm_encoder.
> >> 
> >> As bridge drivers currently create connectors (I'd like to change that
> >> at some point, but one thing at a time) they need to call
> >> drm_mode_connector_attach_encoder() and thus need to have access to the
> >> drm_encoder object at the beginning of the chain. The drm_bridge
> >> structure has an encoder field, it seems to me that the easiest is to
> >> always populate it, regardless of the position of the bridge in the
> >> chain.
> > 
> > I mean the function inteface, not what we fill out in the drm_bridge
> > struct. I.e. instead of expecting callers to give you the encoder for
> > 
> > chained bridges, look it up yourself:
> > 	bridge->encoder = previous : previous->encoder ? encoder;
> > 
> > Or something  like that. Just feels confusing to connect a bridge to both
> > a bridge _and_ the first encoder.
> 
> Right. Archit proposed doing it the other way around:
> 
>         previous = encoder->bridge;
>         while (previous && previous->next)
>                 previous = previous->next;
> 
> That would simplify the API, at the cost of preventing us from catching
> drivers that attach bridges in the wrong order (through the !previous->dev
> check that you suggested should be turned into a WARN_ON). The previous-
> 
> >encoder != encoder check is also a safety net.
> 
> Any opinion on which option you like better ? I'd be very tempted to go for
> Archit's proposal as it removes the previous parameter from the API, if it
> wasn't for the loss of sanity checking.
> 
> > Wrt creating the connector: Some helpers to make that easier could be
> > useful, and probably we need a separate ->register callback. That's needed
> > for proper demidlayered init/teardown sequence anyway, and then the
> > drm_bridge.c code make sure to only call ->register for the very last
> > bridge. Other bridges could still create ther connectors (less conditions
> > in the code), as long as they don't register them no one will ever see
> > them ;-)

One thing at a time, we'll get there :-)

-- 
Regards,

Laurent Pinchart
