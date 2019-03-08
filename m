Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119CCC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 16:24:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E06CA2085A
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 16:24:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbfCHQYq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 11:24:46 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:57427 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbfCHQYq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 11:24:46 -0500
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id F4080200012;
        Fri,  8 Mar 2019 16:24:42 +0000 (UTC)
Date:   Fri, 8 Mar 2019 17:25:12 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH/RFC 10/15] drm: rcar-du: lvds: Set LVEN and LVRES bits
 together on D3
Message-ID: <20190308162512.scfltn3657qp3l4v@uno.localdomain>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-11-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="73diefo4fyuwz5v2"
Content-Disposition: inline
In-Reply-To: <20190306232345.23052-11-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--73diefo4fyuwz5v2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Thu, Mar 07, 2019 at 01:23:40AM +0200, Laurent Pinchart wrote:
> On the D3 SoC the LVDS PHY must be enabled in the same register write
> that enables the LVDS output. Skip writing the LVEN bit independently
> on that platform, it will be set by the write that sets LVRES.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index b1abe737dc05..5ac92ee15be0 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -475,9 +475,13 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  	}
>
>  	if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
> -		/* Turn on the LVDS PHY. */
> +		/*
> +		 * Turn on the LVDS PHY. On D3, the LVEN and LVRES bit must be
> +		 * set at the same time, so don't write the register yet.
> +		 */
>  		lvdcr0 |= LVDCR0_LVEN;
> -		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +		if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_PWD))

This is quite obscure, and works because D3 is the only SoC that has
(quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) and (!(quirks & RCAR_LVDS_QUIRK_PWD)).

I guess there are not many ways around this.

> +			rcar_lvds_write(lvds, LVDCR0, lvdcr0);

I have verified this against the latest v1.50 datasheet, and it
matches what's reported in section 37.3.7 so please add my:
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

I would like just to add that the same section prescribes a precise
order in which LVDS0 and LVDS1 have to be configured when working with
vertical stripe output. Is that enforced in this series?

Thanks
   j

>  	}
>
>  	if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {
> --
> Regards,
>
> Laurent Pinchart
>

--73diefo4fyuwz5v2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlyCl2cACgkQcjQGjxah
VjzRWg//X98t3R3ocdpzIw4eq0eepVok69wqivZC5DKQ5/GpmGbb/KglUX2eDvzO
h7w1a7xpFxsTTgH4305FO3qz/UIuKaxSN5sO5BzkzKP4r5id4yKie5WD+J0E6P8U
WPPVm7I+DQ9xw0orF7lNqpxzNd7pGJrYWnH4+QAKLaWcC8MqFghflb3k4pCfpryI
jizjItkOFHEbT+K1+kJWYEXJVZhttMzUgYpELJKfqJYz3Hl5r1l6UT9EMOpAu3xw
mQU53VhApGvaYhh0NO3IkW8ZMTgMbLDxqIjNxq7lsnvDlVpIu0a+uqq/ZOiiH+Nx
pp8+3I1Am2b5G+3+qOiMEoKGGBne2kX3UOCVgr4sH1NF03qPoDD3MsNtvwCvGm2j
KwU8RErgS82ifV2aB1nwqjJ+cXmVZthOp2bTTLkv+S9802QNI4SKAsZbqHZnXPZ8
WijlMfXjONxTWneoaPfCZFoxo0Pf+Z7o8iGHs/NLXlj99/cFRPeBGtGO+28pwxUh
mSpAC/RtVr6+BcjywnMofOEpF/LotzK2v70UZyXrglG4wftpoJHG0VsAceJsln7b
DD3bOTdhZX7UcvxgkfdqCYRvub03qFxQOhfCy7g6Zyl6B7tnGaN61zULoEcLLaRh
79rZRsKSNSluDZcqUmQGD/RCb6D1yQTkRiv10ZOsLuYiQrCpk1s=
=XsD5
-----END PGP SIGNATURE-----

--73diefo4fyuwz5v2--
