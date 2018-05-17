Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41028 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751977AbeEQI77 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 May 2018 04:59:59 -0400
Date: Thu, 17 May 2018 10:59:40 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm: rcar-du: lvds: Add R8A77995 support
Message-ID: <20180517085940.cwd3hthnecpwxrrm@verge.net.au>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526386840-15368-3-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20180516075419.lpwb2yusthmm74mx@verge.net.au>
 <cd2ca96a-cfc6-bf34-6c4d-299798d9f8ea@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd2ca96a-cfc6-bf34-6c4d-299798d9f8ea@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 16, 2018 at 11:59:32AM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 5/16/2018 10:54 AM, Simon Horman wrote:
> 
> > > Add support for the R-Car D3 (R8A77995) SoC to the LVDS encoder driver.
> > > 
> > > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > > ---
> > >   drivers/gpu/drm/rcar-du/rcar_lvds.c | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > > index 3d2d3bb..58fb9f8 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > > @@ -511,6 +511,11 @@ static const struct rcar_lvds_device_info rcar_lvds_r8a77970_info = {
> > >   	.quirks = RCAR_LVDS_QUIRK_GEN2_PLLCR | RCAR_LVDS_QUIRK_GEN3_LVEN,
> > >   };
> > > +static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
> > > +	.gen = 3,
> > > +	.quirks = RCAR_LVDS_QUIRK_GEN3_LVEN,
> > > +};
> > 
> > This new structure seems to be identical to rcar_lvds_r8a77970_info.
> > Could we consolidate somehow?
> 
>    In my book, that one has 2 quirk flags. What tree are you looking at?

True, my eyes seem to have deceived me.
