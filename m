Return-Path: <SRS0=uGqO=RM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36ADC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 11:23:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF195207E0
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 11:23:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbfCILXj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 9 Mar 2019 06:23:39 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:51025 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfCILXj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Mar 2019 06:23:39 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 84196E0006;
        Sat,  9 Mar 2019 11:23:34 +0000 (UTC)
Date:   Sat, 9 Mar 2019 12:24:08 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH/RFC 06/15] drm: bridge: thc63: Report input bus mode
 through bridge timings
Message-ID: <20190309112408.2nvshh6hu6iachq3@uno.localdomain>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-7-laurent.pinchart+renesas@ideasonboard.com>
 <20190308173259.oize6d766dlzkz2q@uno.localdomain>
 <20190308180028.GB11318@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lingcuyw4pon3aty"
Content-Disposition: inline
In-Reply-To: <20190308180028.GB11318@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--lingcuyw4pon3aty
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent

On Fri, Mar 08, 2019 at 08:00:28PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Fri, Mar 08, 2019 at 06:32:59PM +0100, Jacopo Mondi wrote:
> > On Thu, Mar 07, 2019 at 01:23:36AM +0200, Laurent Pinchart wrote:
> > > Set a drm_bridge_timings in the drm_bridge, and use it to report the
> > > input bus mode (single-link or dual-link). The other fields of the
> > > timings structure are kept to 0 as they do not apply to LVDS buses.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  drivers/gpu/drm/bridge/thc63lvd1024.c | 46 ++++++++++++++++++++-------
> > >  1 file changed, 35 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> > > index b083a740565c..206b0af5e154 100644
> > > --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> > > +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> > > @@ -31,6 +31,8 @@ struct thc63_dev {
> > >
> > >  	struct drm_bridge bridge;
> > >  	struct drm_bridge *next;
> > > +
> > > +	struct drm_bridge_timings timings;
> > >  };
> > >
> > >  static inline struct thc63_dev *to_thc63(struct drm_bridge *bridge)
> > > @@ -48,15 +50,28 @@ static int thc63_attach(struct drm_bridge *bridge)
> > >  static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
> > >  					const struct drm_display_mode *mode)
> > >  {
> > > +	struct thc63_dev *thc63 = to_thc63(bridge);
> > > +	unsigned int min_freq;
> > > +	unsigned int max_freq;
> > > +
> > >  	/*
> > > -	 * The THC63LVD1024 clock frequency range is 8 to 135 MHz in single-in
> > > -	 * mode. Note that the limits are different in dual-in, single-out mode,
> > > -	 * and will need to be adjusted accordingly.
> > > +	 * The THC63LVD1024 pixel rate range is 8 to 135 MHz in all modes but
> > > +	 * dual-in, single-out where it is 40 to 150 MHz. As dual-in, dual-out
> > > +	 * isn't supported by the driver yet, simply derive the limits from the
> > > +	 * input mode.
> > >  	 */
> > > -	if (mode->clock < 8000)
> > > +	if (thc63->timings.dual_link) {
> > > +		min_freq = 40000;
> > > +		max_freq = 150000;
> > > +	} else {
> > > +		min_freq = 8000;
> > > +		max_freq = 135000;
> > > +	}
> > > +
> > > +	if (mode->clock < min_freq)
> > >  		return MODE_CLOCK_LOW;
> > >
> > > -	if (mode->clock > 135000)
> > > +	if (mode->clock > max_freq)
> > >  		return MODE_CLOCK_HIGH;
> > >
> > >  	return MODE_OK;
> > > @@ -101,19 +116,19 @@ static const struct drm_bridge_funcs thc63_bridge_func = {
> > >
> > >  static int thc63_parse_dt(struct thc63_dev *thc63)
> > >  {
> > > -	struct device_node *thc63_out;
> > > +	struct device_node *endpoint;
> > >  	struct device_node *remote;
> > >
> > > -	thc63_out = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
> > > -						  THC63_RGB_OUT0, -1);
> > > -	if (!thc63_out) {
> > > +	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
> > > +						 THC63_RGB_OUT0, -1);
> > > +	if (!endpoint) {
> > >  		dev_err(thc63->dev, "Missing endpoint in port@%u\n",
> > >  			THC63_RGB_OUT0);
> > >  		return -ENODEV;
> > >  	}
> > >
> > > -	remote = of_graph_get_remote_port_parent(thc63_out);
> > > -	of_node_put(thc63_out);
> > > +	remote = of_graph_get_remote_port_parent(endpoint);
> > > +	of_node_put(endpoint);
> > >  	if (!remote) {
> > >  		dev_err(thc63->dev, "Endpoint in port@%u unconnected\n",
> > >  			THC63_RGB_OUT0);
> > > @@ -132,6 +147,14 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
> > >  	if (!thc63->next)
> > >  		return -EPROBE_DEFER;
> > >
> > > +	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
> > > +						 THC63_LVDS_IN1, -1);
> > > +	of_node_put(endpoint);
> > > +
> >
> > Should you check if endpoint is enabled?
>
> Can endpoints be disabled ?

I meant the remote port parent, sorry about that.

Thanks
  j

>
> > By the way, this seems to me works properly, as in [12/15] if skip
> > creation of the LVDS1 encoder if it is operating in dual link mode.
> > Without that, we would hit again the issue of matching on device
> > nodes, as the same bridge would be attached twice, am I wrong?
> >
> > I feel we've been there already :)
> > https://lkml.org/lkml/2018/3/20/341
> >
> > and it is not just an issue on matching on endpoints, it's that the
> > drm bridge itself that would need to handle multiple attach/detaches..
>
> Correct. Thanks to 12/15 we don't need this yet :-)
>
> > > +	thc63->timings.dual_link = endpoint != NULL;
> > > +	dev_dbg(thc63->dev, "operating in %s-link mode\n",
> > > +		thc63->timings.dual_link ? "dual" : "single");
> > > +
> > >  	return 0;
> > >  }
> > >
> > > @@ -188,6 +211,7 @@ static int thc63_probe(struct platform_device *pdev)
> > >  	thc63->bridge.driver_private = thc63;
> > >  	thc63->bridge.of_node = pdev->dev.of_node;
> > >  	thc63->bridge.funcs = &thc63_bridge_func;
> > > +	thc63->bridge.timings = &thc63->timings;
> > >
> > >  	drm_bridge_add(&thc63->bridge);
> > >
>
> --
> Regards,
>
> Laurent Pinchart

--lingcuyw4pon3aty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlyDolgACgkQcjQGjxah
Vjy+Hg//YAegyptDilWJjaW+Lx3aE7Vv9B6OXE2m6lOyO+2wtZn0siVEmob2uVRX
sqdCDi1IWCJuZnTTp7YyVMizhG/27BaP4tkuJg64w8P1qLvzEP/Um6njxgOAYhjk
/wL94p5b3L0+STFfRm8RuNrWBg374DwzgEyoUvgANJXa9kKD1IyEFfjQQj6LgFMy
6vg2GwcyLyLeXcx9W2t6q+avBLxTV5ZFRIxEfKHhT2HD9cC3NvnTV2NzbF+ZK9jb
TqyoJgVdGBnLjtn0wIrWFJ7qw2lVBMK/9TdP+EnKHbWFH4iqrWBy64+5rUTxBr4E
ftSM/s6qSvATMC5pkSPK+sJwYiBzVTPGmxYzHK6fBl7CQh4k/y4l8ynyeAzj9AFr
giG0reI3oypf6u+W7uxAg3gcbtAL/f4fDe2KfpvQJ3BhC1aAuz4dHMNSS7FZXS0K
PVEMNfjJvDYCGs8/cDhqWAajTwDh+g5Y5WRAbsbUg/Xb2JUJlrjLyWLtQzlmqBix
i8L+icfr8xUiAIhQPxnLX0XReT0sNXEAgfW/83cEblYS4ok1oEiHmp6/LChsJ/ys
1U3/h4z3svkStFb5t1B4aNuxUdCVl/j5sSMbuN8V5XoxLAKfF9vlsXVJVHB3E+1u
OIX+uYnogpjjnHeQBeaW9+Mb6hV+bhyQEzt22zaoKIlHfivIeks=
=eUdM
-----END PGP SIGNATURE-----

--lingcuyw4pon3aty--
