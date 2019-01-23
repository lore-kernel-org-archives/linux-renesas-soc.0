Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D84C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 18:43:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD1D821855
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 18:43:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbfAWSnB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 13:43:01 -0500
Received: from sauhun.de ([88.99.104.3]:35888 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725896AbfAWSnB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 13:43:01 -0500
Received: from localhost (p54B3320B.dip0.t-ipconnect.de [84.179.50.11])
        by pokefinder.org (Postfix) with ESMTPSA id 065652C54BC;
        Wed, 23 Jan 2019 19:42:58 +0100 (CET)
Date:   Wed, 23 Jan 2019 19:42:58 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms@verge.net.au>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Haavard Skinnemoen <hskinnemoen@gmail.com>
Subject: Re: [PATCH] i2c: gpio: merge two very similar comments
Message-ID: <20190123184258.GC1708@kunai>
References: <20190119113642.5348-1-wsa+renesas@sang-engineering.com>
 <20190123101854.ps42vsgehusaimi5@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Content-Disposition: inline
In-Reply-To: <20190123101854.ps42vsgehusaimi5@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 23, 2019 at 11:18:54AM +0100, Simon Horman wrote:
> On Sat, Jan 19, 2019 at 12:36:42PM +0100, Wolfram Sang wrote:
> > I think it is clear enough if we have the explanation once and make it
> > clear it is applicable for both SCL and SDA.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >  drivers/i2c/busses/i2c-gpio.c | 15 ++++-----------
> >  1 file changed, 4 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpi=
o.c
> > index c008d209f0b8..b9d43bc2853f 100644
> > --- a/drivers/i2c/busses/i2c-gpio.c
> > +++ b/drivers/i2c/busses/i2c-gpio.c
> > @@ -286,10 +286,10 @@ static int i2c_gpio_probe(struct platform_device =
*pdev)
> > =20
> >  	/*
> >  	 * First get the GPIO pins; if it fails, we'll defer the probe.
> > -	 * If the SDA line is marked from platform data or device tree as
> > -	 * "open drain" it means something outside of our control is making
> > -	 * this line being handled as open drain, and we should just handle
> > -	 * it as any other output. Else we enforce open drain as this is
> > +	 * If the SCL/SDA lines are marked from platform data or device tree
> > +	 * as "open drain" it means something outside of our control is making
> > +	 * these lines being handled as open drain, and we should just handle
> > +	 * them as any other output. Else we enforce open drain as this is
> >  	 * required for an I2C bus.
>=20
> <2c>
> 	If the SCL/SDA lines are marked "open drain" by platform data or
> 	device tree then this means that something outside of our control is
> 	marking these lines to be handled as open drain, and we should just
> 	handle them as we handle any other output. Else we enforce open
> 	drain as this is required for an I2C bus.
> </2c>

Cool, thanks Simon. Should I add your SoB when sending V2?


--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxItbIACgkQFA3kzBSg
KbZAdg//ZO6XV/tKWl8x5+NopG3FxzEq3viyiCzeQx3OVwu2iXR3mzpHf/lNy7Jz
0bH5D514njTJFxF156n4cwC5Kvd9iP2zoMGV53jSiN4FV8wXCDE2C2jDv9SBAU/U
kRcgvHAsketdVl1qsVFCs7ZmfqW6R5wZniThhfEcp6Ija6XB8paqcnKoxVfLEUUx
ID+90/PSuCCeO/1NUtbV4SM+A5EtmnhmmDlxSrJvty9IaPgGn5zR6VYwDLHwJltM
41fdlqMcGtOiZgbf2+aF55knJ8F0GPXSG+jSMk4dWK9EObvEmwuMGZlKzh2So/sf
Bz0mFGD/K2T/5SlYeAgsHTxoXAV2DPQXUXeo7mAl5mJUnxPy77oZTqHhBJ8uMsB2
UBWmC4At+lgxdXWQUNt+C2L1kGmsvBRzFmXRz6SGULw20gpVxaDPdA5GoxQrou85
twdOV96Eo4Kr7B+IpbEvmk1BLjSsp5uINMqyNikFccRELPijPi7+bk5UouyHnq+B
BO5J+or38WY3GDuSC5HFareZG4lbLTHUjUr3KJH+uIz3uDjqhD0/ef9wZsG+bTmx
W11nYn5tga7zFfMR8KPhYB8I0R6amWrUgfSnDF6LE3hn0x7b+89fC3uP+FKiY5tk
j+z7fExBDwC6WKHRG69qlu5df28GxemZg0j5vxbanD5h68/uE7g=
=bLdj
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--
