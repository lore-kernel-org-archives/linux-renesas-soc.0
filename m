Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983F9C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 11:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6FB6020663
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 11:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbfCDLNw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 06:13:52 -0500
Received: from sauhun.de ([88.99.104.3]:53018 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbfCDLNw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 06:13:52 -0500
Received: from localhost (p54B337B5.dip0.t-ipconnect.de [84.179.55.181])
        by pokefinder.org (Postfix) with ESMTPSA id CD15A2C3637;
        Mon,  4 Mar 2019 12:13:49 +0100 (CET)
Date:   Mon, 4 Mar 2019 12:13:49 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] ARM: dts: alt: Add DA9063 PMIC node
Message-ID: <20190304111349.GB1000@kunai>
References: <20190303190059.31155-1-marek.vasut@gmail.com>
 <CAMuHMdWStD+on70-e1p0SXbe2igNJxDM1RzeYsdXW+80SA9+sw@mail.gmail.com>
 <20190304105705.GA1000@kunai>
 <e5be6861-70d1-e60e-4838-a89b219bee05@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline
In-Reply-To: <e5be6861-70d1-e60e-4838-a89b219bee05@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2019 at 11:59:48AM +0100, Marek Vasut wrote:
> On 3/4/19 11:57 AM, Wolfram Sang wrote:
> >=20
> >>> Add DA9063 PMIC node to the I2C bus.
> >>>
> >>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>
> >> Thanks for your patch!
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >=20
> > Thanks for CCing me, I didn't get and missed the original patch.
> >=20
> >>> +++ b/arch/arm/boot/dts/r8a7794-alt.dts
> >>> @@ -377,6 +377,27 @@
> >>>         pinctrl-names =3D "i2c-exio4";
> >>>  };
> >>>
> >>> +&i2c7 {
> >>> +       status =3D "okay";
> >>> +       clock-frequency =3D <100000>;
> >>
> >> According to the DA9063 datasheet, the PMIC supports up to 400 kHz.
> >> It looks like there are no other devices on the bus.
> >>
> >> Wolfram, what's your stance on this?
> >=20
> > Yes, please. I thought this was standard on Gen2 IIC_DVFS busses, but
> > seems not. Probably it slipped through the cracks.
>=20
> Do we want to update all of the other boards too ?
>=20
> I'd be cautious about the DVFS I2C, running faster while talking to the
> PMIC and reading/writing a few registers brings little benefit, while
> the signal integrity might be impacted.

Can be argued. I think if we would apply some testing on top of this
change, we will find that it will work. But we would in deed need this
testing as verification, and this is not our top priority project. But
if someone feels like running some i2c dumping over night, well,
why not..


--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlx9CG0ACgkQFA3kzBSg
KbaFuA//bUF+TvT2LjDMnMFuQfvpzqAp1SnBmUXOPnUbL4wtEY7a5d9xZ7ArwfJa
m4n0kD1FoZqXqrBP0EUKkE4gJb0ji+aFZrBREfWy0bei51uwKCKOyNRkLzsDAA4X
q+MG+ghZW+gUiB93TXyFZz5msMz/VFgOk2gGupxqADUxMY88xeLTHpHsJl3ie0TT
UeNFGSmcmAzkyNtPnIaJzm0Dx7wZ+1eNz0z2+ecoPMTMFw2DCMug4zsY9f8u7HDj
ZPkQXcOFP009qovwjCgzSl4chX5TTA6MZcoaZFa1Ylb7mVIBncb5m7sX6IwWzmex
HlQ7TKuP0PKGin0n4Gl6gDbpmFdndgy94TO7qilRlq2Vg/P2MJPxztoKQLOggkoD
VLuvK8YTsikOcZfhgHILIkiGTEa6q7xCZfaBnXYSIuZJ18Lnz0pO9xnNRC79TCiJ
TxpYf6TFRqk4xR40LFidIXLP8eXCyR2UFIhAISPNt9LyQZHhS2rC4+wbXmdeo3kI
+pzgW+Hno8KhDY37tCwFkBlOoEp0+JaA89wpnfBbCbIVO7xGWp2LCCN0oZAMS2ZO
yP2mFabXMcTGK7VFcA4iuXsYxl93zidgtOtObwk3fRcZlQEqH6Qv3tUH+CRvHLJs
Q+EcDcDmCfqvJm5dirHFqyvTTgtG8BUT8AXyn+kC23ylj9xvHNk=
=trPV
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
