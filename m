Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0591DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 18:07:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C948220851
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 18:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R5jdQJpB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbfCHSHM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 13:07:12 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37572 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbfCHSHM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 13:07:12 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74C97309;
        Fri,  8 Mar 2019 19:07:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1552068429;
        bh=VYnsb2oLlg71FGJY8UIlafnYfXsi79Opc6um6Snj+LY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R5jdQJpB3qSksMLSG8/4W445hPKUHFpK1Ep3I1QFUqbj94aQcmaRMwGkBmjcr4qnc
         wZ8JdB7tqBbfISWJjH1IfC4xoq0WbMei/Ro+6tgETo0M+08S13rgHhwlk7/z0qjXfp
         +P40vrOPsMbwvwSJggofOXUiNx3hFDY79eUxCwI0=
Date:   Fri, 8 Mar 2019 20:07:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH/RFC 10/15] drm: rcar-du: lvds: Set LVEN and LVRES bits
 together on D3
Message-ID: <20190308180703.GC11318@pendragon.ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-11-laurent.pinchart+renesas@ideasonboard.com>
 <20190308162512.scfltn3657qp3l4v@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190308162512.scfltn3657qp3l4v@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Fri, Mar 08, 2019 at 05:25:12PM +0100, Jacopo Mondi wrote:
> On Thu, Mar 07, 2019 at 01:23:40AM +0200, Laurent Pinchart wrote:
> > On the D3 SoC the LVDS PHY must be enabled in the same register write
> > that enables the LVDS output. Skip writing the LVEN bit independently
> > on that platform, it will be set by the write that sets LVRES.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > index b1abe737dc05..5ac92ee15be0 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > @@ -475,9 +475,13 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
> >  	}
> >
> >  	if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
> > -		/* Turn on the LVDS PHY. */
> > +		/*
> > +		 * Turn on the LVDS PHY. On D3, the LVEN and LVRES bit must be
> > +		 * set at the same time, so don't write the register yet.
> > +		 */
> >  		lvdcr0 |= LVDCR0_LVEN;
> > -		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> > +		if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_PWD))
> 
> This is quite obscure, and works because D3 is the only SoC that has
> (quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) and (!(quirks & RCAR_LVDS_QUIRK_PWD)).
> 
> I guess there are not many ways around this.

We could add a model field to the info structure, or another quirk, but
I'd rather not add yet another if it's not needed for now. I agree it's
not very nice though, it bothered me too when I wrote the code.

> > +			rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> 
> I have verified this against the latest v1.50 datasheet, and it
> matches what's reported in section 37.3.7 so please add my:
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> I would like just to add that the same section prescribes a precise
> order in which LVDS0 and LVDS1 have to be configured when working with
> vertical stripe output. Is that enforced in this series?

It is, the companion is enabled before and disabled after the master for
this reason. My code initially violated the constraint, and the HDMI
output remained blank.

Note that figure 37.9 describes a sequence where register writes are
interleaved. As it's titled "The sample setting of the vertical stripe
output", I've considered it as a sample only.

> >  	}
> >
> >  	if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {

-- 
Regards,

Laurent Pinchart
