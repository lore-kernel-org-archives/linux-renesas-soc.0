Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37582 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727013AbeJQWTq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 18:19:46 -0400
Date: Wed, 17 Oct 2018 16:23:47 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <simon@horms.net>
Subject: Re: Delay between stop condition and start condition
Message-ID: <20181017142347.GA5141@kunai>
References: <TY1PR01MB1770A54E9823E9C6D0FC6986C0FD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20181017103208.GA1589@kunai>
 <8db1b1a0-6669-0d4e-7511-6fb44e309a4c@axentia.se>
 <20181017121607.GB3813@kunai>
 <20181017122141.GC3813@kunai>
 <TY1PR01MB177036EC6AEADEED8ECFA21FC0FF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <TY1PR01MB177036EC6AEADEED8ECFA21FC0FF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The passthrough mode is not default, it gets activated by the driver so that
> drm_get_edid can then fetch the EDID. One other nasty thing is that to end the conversation
> with the monitor you are supposed to write 0x00 to register 0x1a of the HDMI transmitter,
> which means the SoC puts address 0x39 on the bus, but the HDMI transmitter lets that
> through, the monitor NACKs the address (because its address is 0x50), and from that
> moment on the control is back with the HDMI transmitter.
> Unfortunately I don't have any other slave on the same bus, but I wonder what happens
> if someone else tries to use the same bus while the pass through mode is operating...

Wouldn't all this really speak for an i2c gate? Do all enablement stuff
in select(), all disablement stuff in deselect(), and make sure
deselect() is called after every transfer. That would mean the
passthrough is only active when the EDID eeprom is accessed. Would that
work? Given the above, it looks quite sane to do it like that in order
to avoid side-effects of the open passthrough.


--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvHRe8ACgkQFA3kzBSg
KbZfSQ//diJoC+tKjY4imDsXKaY6EJVK87RcjvyY2M0ckuv1C2nXvtxHQ76ZQ3Oj
NTjVds7MY1qD6l7hCsuzBtRo9C/epRr8mQxpfe9ryMFv2ih74KbPdPi+9HTnS6ql
wlVAkXDYelAkXtFr4L/vw3bYYMZWYh11lZ/kwQg20UvDJO3E8P4TsBSLjrO5Lg+s
GsT2n0xfEdv7NGSSgecMuAFVs4l6V3+WhnV3Q36mEuxaf3l9dbxrqKecORF607lh
TWWSSGiyLL8Kip2Cb+bV4VKUgxxDIVUnTcK9sYhYHc25o1i/0mCTjyXttggS3gIB
1CrVlsJc8BCZAmtRIzP9XFgXwzotiVbHP2Q+FIgAdKc1odvLsryQgE+fmjuPrB/P
gvXxdCEWZDVT1pqbiMVTgXb5V+JybgtjHsdr3iRjLfc1JK9GFcU4uDoazmBkzlwP
o3tKKFrCB/0WZ7aP7ebkRU8Fz1FUnh00OqMQkiIEP/0AWxWm9xNGLuS9D6knHJTX
IIxEmkI02EWSByumTcamMy+5OsBPKIBRl9EzzVkcFAmUDYG54DCwo+sM9f2z0kEp
CNtlbj88z+CsTxO1kmUu3ZTiNWbF5Ig7ataJqC1EaqpxEhTvYkEoH8XVpycwrluV
+JTjaPQSEXyz8VvesdbFN3YcLNXw4i+rtbd0iiaW37nknlkI4DE=
=84Lw
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
