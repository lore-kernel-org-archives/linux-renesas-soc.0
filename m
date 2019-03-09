Return-Path: <SRS0=uGqO=RM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303A5C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 11:26:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA0F9207E0
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 11:26:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tThziCyk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbfCIL0H (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 9 Mar 2019 06:26:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39334 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbfCIL0H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Mar 2019 06:26:07 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87A9E49;
        Sat,  9 Mar 2019 12:26:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1552130763;
        bh=+z0McpVDw9FqQhFndbafLO7aiSsGZpQE+B+a7XA0ZR4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tThziCyksSjbWVyxIuFKsHr44hWTJC4WVBVs4nkECDNPRxXmhFhyzgRXkfW+ce8s5
         n/8kMHpTgrN41LYHW/eDBGBEGACFi6nrk9rviMGDq1wzPMEa7Sgg1K9AiUikE4aQv5
         xRHuJKbyJQkLgyc4E4N0Cm8DdQOlA8paZxgb2PnU=
Date:   Sat, 9 Mar 2019 13:25:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH/RFC 11/15] drm: rcar-du: lvds: Add support for dual-link
 mode
Message-ID: <20190309112556.GA4924@pendragon.ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-12-laurent.pinchart+renesas@ideasonboard.com>
 <20190308172023.vtsvouwo4ltxzgx2@uno.localdomain>
 <20190308181239.GD11318@pendragon.ideasonboard.com>
 <20190309111132.qxpppbokn3stfjhl@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190309111132.qxpppbokn3stfjhl@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Sat, Mar 09, 2019 at 12:11:32PM +0100, Jacopo Mondi wrote:
> On Fri, Mar 08, 2019 at 08:12:39PM +0200, Laurent Pinchart wrote:
> > On Fri, Mar 08, 2019 at 06:20:23PM +0100, Jacopo Mondi wrote:
> >> On Thu, Mar 07, 2019 at 01:23:41AM +0200, Laurent Pinchart wrote:
> >>> In dual-link mode the LVDS0 encoder transmits even-numbered pixels, and
> >>> sends odd-numbered pixels to the LVDS1 encoder for transmission on a
> >>> separate link.
> >>>
> >>> To implement support for this mode of operation, determine if the LVDS
> >>> connection operates in dual-link mode by querying the next device in the
> >>> pipeline, locate the companion encoder, and control it directly through
> >>> its bridge operations.
> >>>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>> ---
> >>>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 104 ++++++++++++++++++++++++----
> >>>  drivers/gpu/drm/rcar-du/rcar_lvds.h |   5 ++
> >>>  2 files changed, 96 insertions(+), 13 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> >>> index 5ac92ee15be0..90d33514bb3e 100644
> >>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> >>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> >>> @@ -66,6 +66,9 @@ struct rcar_lvds {
> >>>
> >>>  	struct drm_display_mode display_mode;
> >>>  	enum rcar_lvds_mode mode;
> >>> +
> >>> +	struct drm_bridge *companion;
> >>> +	bool dual_link;
> >>>  };
> >>>
> >>>  #define bridge_to_rcar_lvds(bridge) \
> >>> @@ -400,11 +403,6 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
> >>>  {
> >>>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> >>>  	const struct drm_display_mode *mode = &lvds->display_mode;
> >>> -	/*
> >>> -	 * FIXME: We should really retrieve the CRTC through the state, but how
> >>> -	 * do we get a state pointer?
> >>> -	 */
> >>> -	struct drm_crtc *crtc = lvds->bridge.encoder->crtc;
> >>>  	u32 lvdhcr;
> >>>  	u32 lvdcr0;
> >>>  	int ret;
> >>> @@ -413,6 +411,10 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
> >>>  	if (ret < 0)
> >>>  		return;
> >>>
> >>> +	/* Enable the companion LVDS encoder in dual-link mode. */
> >>> +	if (lvds->dual_link && lvds->companion)
> >>> +		lvds->companion->funcs->enable(lvds->companion);
> >>> +
> >>>  	/*
> >>>  	 * Hardcode the channels and control signals routing for now.
> >>>  	 *
> >>> @@ -435,17 +437,33 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
> >>>  	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
> >>>
> >>>  	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) {
> >>> -		/* Disable dual-link mode. */
> >>> -		rcar_lvds_write(lvds, LVDSTRIPE, 0);
> >>> +		/*
> >>> +		 * Configure vertical stripe based on the mode of operation of
> >>> +		 * the connected device.
> >>> +		 */
> >>> +		rcar_lvds_write(lvds, LVDSTRIPE,
> >>> +				lvds->dual_link ? LVDSTRIPE_ST_ON : 0);
> >>>  	}
> >>>
> >>> -	/* PLL clock configuration. */
> >>> -	lvds->info->pll_setup(lvds, mode->clock * 1000);
> >>> +	/*
> >>> +	 * PLL clock configuration on all instances but the companion in
> >>> +	 * dual-link mode.
> >>> +	 */
> >>> +	if (!lvds->dual_link || lvds->companion)
> >>> +		lvds->info->pll_setup(lvds, mode->clock * 1000);
> >>>
> >>>  	/* Set the LVDS mode and select the input. */
> >>>  	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
> >>> -	if (drm_crtc_index(crtc) == 2)
> >>> -		lvdcr0 |= LVDCR0_DUSEL;
> >>> +
> >>> +	if (lvds->bridge.encoder) {
> >>> +		/*
> >>> +		 * FIXME: We should really retrieve the CRTC through the state,
> >>> +		 * but how do we get a state pointer?
> >>> +		 */
> >>> +		if (drm_crtc_index(lvds->bridge.encoder->crtc) == 2)
> >>> +			lvdcr0 |= LVDCR0_DUSEL;
> >>> +	}
> >>> +
> >>>  	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> >>>
> >>>  	/* Turn all the channels on. */
> >>> @@ -512,6 +530,10 @@ static void rcar_lvds_disable(struct drm_bridge *bridge)
> >>>  	rcar_lvds_write(lvds, LVDCR1, 0);
> >>>  	rcar_lvds_write(lvds, LVDPLLCR, 0);
> >>>
> >>> +	/* Disable the companion LVDS encoder in dual-link mode. */
> >>> +	if (lvds->dual_link && lvds->companion)
> >>> +		lvds->companion->funcs->disable(lvds->companion);
> >>> +
> >>>  	clk_disable_unprepare(lvds->clocks.mod);
> >>>  }
> >>>
> >>> @@ -628,10 +650,54 @@ static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
> >>>  	.mode_set = rcar_lvds_mode_set,
> >>>  };
> >>>
> >>> +bool rcar_lvds_dual_link(struct drm_bridge *bridge)
> >>> +{
> >>> +	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> >>> +
> >>> +	return lvds->dual_link;
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(rcar_lvds_dual_link);
> >>> +
> >>>  /* -----------------------------------------------------------------------------
> >>>   * Probe & Remove
> >>>   */
> >>>
> >>> +static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
> >>> +{
> >>> +	const struct of_device_id *match;
> >>> +	struct device_node *companion;
> >>> +	struct device *dev = lvds->dev;
> >>> +	int ret = 0;
> >>> +
> >>> +	/* Locate the companion LVDS encoder for dual-link operation, if any. */
> >>> +	companion = of_parse_phandle(dev->of_node, "renesas,companion", 0);
> >>> +	if (!companion)
> >>> +		return -ENODEV;
> >>> +
> >>> +	/*
> >>> +	 * Sanity check: the companion encoder must have the same compatible
> >>> +	 * string.
> >>> +	 */
> >>> +	match = of_match_device(dev->driver->of_match_table, dev);
> >>> +	if (!of_device_is_compatible(companion, match->compatible)) {
> >>> +		ret = -ENODEV;
> >>> +		goto done;
> >>> +	}
> >>> +
> >>> +	lvds->companion = of_drm_find_bridge(companion);
> >>> +	if (!lvds->companion) {
> >>> +		ret = -EPROBE_DEFER;
> >>> +		goto done;
> >>> +	}
> >>> +
> >>> +	dev_dbg(dev, "Found companion encoder %pOF\n", companion);
> >>> +
> >>> +done:
> >>> +	of_node_put(companion);
> >>> +
> >>> +	return ret;
> >>> +}
> >>> +
> >>>  static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
> >>>  {
> >>>  	struct device_node *local_output = NULL;
> >>> @@ -682,14 +748,26 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
> >>>
> >>>  	if (is_bridge) {
> >>>  		lvds->next_bridge = of_drm_find_bridge(remote);
> >>> -		if (!lvds->next_bridge)
> >>> +		if (!lvds->next_bridge) {
> >>>  			ret = -EPROBE_DEFER;
> >>> +			goto done;
> >>> +		}
> >>> +
> >>> +		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
> >>> +			lvds->dual_link = lvds->next_bridge->timings
> >>> +					? lvds->next_bridge->timings->dual_link
> >>> +					: false;
> >>
> >> I wonder if, in all this patch, you could not use "lvds->companion" in
> >> place of "lvds->dual_link", and thus drop that from timings. This mean
> >> "renesas,companion" would only be used when operating in dual link
> >> mode, which might be less nice (and could actually called differently
> >> in that case).
> >>
> >> Both the THC631024 and the rcar_du-lvds driver would decide
> >> independently if they operate in dual link mode or not (one counting
> >> its endpoints, the other inspecting the "renesas,companion" property).
> >
> > I decided to specify the companion in DT regardless of which operating
> > mode is used, as it's a property of the LVDS encoder, not of the
> > operating mode. Furthermore, I can foresee setups where the mode would
> > be selected dynamically at runtime. Our development boards don't allow
> > that as they hardcode the mode using DIP switches, but nothing would
> > prevent the mode selection signals to be connected to GPIOs. I thus
> > think lvds->companion should point to the companion unconditionally, and
> > lvds->dual_link should select the operating mode. The dual_link field is
> > currently set at probe time as I have no need for dynamic configuration
> > of the mode and no mean of testing it, so I decided not to implement
> > dynamic switching yet.
> 
> Fine, I tried thinking up a bit if the "renesas,companion" property
> could have been made an endpoint property, to be specified in both
> the rcar-lvds endpoints and in the DU endpoints, so that the
> rcar_du_encoder does not need to pick into the lvds-encoder to know
> if it is operating in dual link mode or not and skip creation of the
> encoder associated to LVDS1 in such a case.
> 
> Furthermore, we could make a "vstripe-even" "vstripe-odd" endpoint
> properties, that would allow you to control the ST_SWAP field of
> LVDSTRIPE register, and create another endpoint property that contains
> the phandle to the companion, like "dual-link-companion" or
> "dual-link-slave". Those properties would need to be specified in both
> DU and LVDS endpoints though, which might be clunky, but that would
> possibly save a few cross-driver calls.

Regarding the stripe odd/even control, I think this should be handled
dynamically without involving DT. We will need an API for bridges to
report what order(s) they support, and allow the remote component to be
configured accordingly. A DT property isn't needed for this.

Regarding the companion, it's not a generic concept. It happens that
Renesas decided to implement dual-link support by configuring one of the
two LVDS encoders as a master and the other one as a slave, but there
could be other options. That's why I made this a Renesas-specific
property. I believe it is placed correctly in the LVDS encoder DT node,
and not in the port or endpoint, as it's a property of the LVDS encoder
itself.

Other models are possible though, I could have added a third port to the
LVDS encoders to model this connection, but as ports don't indicate a
direction, I would have needed an extra property anyway to differentiate
between the master and the slave.

> Anyway, just putting a few more options on the table, if you have
> already considered those feel free to stick to this implementation...
> 
> >> The only place where this might be tricky is the here above
> >>
> >>  +	/*
> >>  +	 * PLL clock configuration on all instances but the companion in
> >>  +	 * dual-link mode.
> >>  +	 */
> >>  +	if (!lvds->dual_link || lvds->companion)
> >>  +		lvds->info->pll_setup(lvds, mode->clock * 1000);
> >>
> >> but that would remove the need for the thc63 bridge to report its
> >> operating mode in timings...
> >>
> >>>  	} else {
> >>>  		lvds->panel = of_drm_find_panel(remote);
> >>> -		if (IS_ERR(lvds->panel))
> >>> +		if (IS_ERR(lvds->panel)) {
> >>>  			ret = PTR_ERR(lvds->panel);
> >>> +			goto done;
> >>> +		}
> >>>  	}
> >>>
> >>> +	if (lvds->dual_link)
> >>
> >> Note: if (!is_bridge) you would never set lvds->dual_link, so this
> >> should be moved inside the here above "if (is_bridge)"
> >
> > I don't yet, but nothing prevents a panel from operating in dual mode,
> > even if not implemented yet. That's why I've move this check out of the
> > bridge/panel conditional code.
> 
> I see, still right now is of no use. It's fine though, really minor
> stuff.
> 
> >>> +		ret = rcar_lvds_parse_dt_companion(lvds);
> >>> +
> >>>  done:
> >>>  	of_node_put(local_output);
> >>>  	of_node_put(remote_input);
> >>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.h b/drivers/gpu/drm/rcar-du/rcar_lvds.h
> >>> index a709cae1bc32..222ec0e60785 100644
> >>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.h
> >>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.h
> >>> @@ -15,6 +15,7 @@ struct drm_bridge;
> >>>  #if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
> >>>  int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq);
> >>>  void rcar_lvds_clk_disable(struct drm_bridge *bridge);
> >>> +bool rcar_lvds_dual_link(struct drm_bridge *bridge);
> >>>  #else
> >>>  static inline int rcar_lvds_clk_enable(struct drm_bridge *bridge,
> >>>  				       unsigned long freq)
> >>> @@ -22,6 +23,10 @@ static inline int rcar_lvds_clk_enable(struct drm_bridge *bridge,
> >>>  	return -ENOSYS;
> >>>  }
> >>>  static inline void rcar_lvds_clk_disable(struct drm_bridge *bridge) { }
> >>> +static inline bool rcar_lvds_dual_link(struct drm_bridge *bridge)
> >>> +{
> >>> +	return false;
> >>> +}
> >>>  #endif /* CONFIG_DRM_RCAR_LVDS */
> >>>
> >>>  #endif /* __RCAR_LVDS_H__ */

-- 
Regards,

Laurent Pinchart
