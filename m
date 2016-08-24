Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:38967 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751972AbcHXGPi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2016 02:15:38 -0400
Date: Wed, 24 Aug 2016 08:15:27 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: renesas-drivers-2016-08-23-v4.8-rc3
Message-ID: <20160824061527.GB1663@katana>
References: <1471959320-16947-1-git-send-email-geert+renesas@glider.be>
 <874m6buh17.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline
In-Reply-To: <874m6buh17.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> 	09a28bb8b17e8cab3e9c120b7e37f631cc334a8f
> 	("ARM: dts: lager: use demuxer for IIC3/I2C3")

Can you try this patch I sent yesterday?

[PATCH] i2c: mux: demux-pinctrl: run properly with multiple instances


--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvTt+AAoJEBQN5MwUoCm2SesQAKtAQ80OjBOtW8BLtQOy+rsh
G94ujPZCmW6yTfb//mrjsYei2ASh4puT9/20+/MoMb0pyiBrtWAA/FHGGWU/DiOL
EXsZhy2TmyMedhm2mTf7ZX0v22fl6x/uaGL6SSB9MVGXl0d0Zqle3EDuIvnQFHGS
X0D9oOcsWEYtVwMitNjwZPcr77nqD+SLZTV1lckuyb3HxGm37dGU5iq99a7pUtdj
pnHracHAAgbIZFkd1IRDvBEo6jGMpq2YX9lMSJod0NHw9v15az39khEXjSkQElGr
vYwa0oDVD2Cslq/55ESG9XB4Ua+SRvhh2p3v5kqhL2avvMaElydsikXNFeLyhFkR
NL5jvnz6/6BsXTiDjfeurB0J18HdkVaSg8s+HLNvsQ8zT1FbhLGM5JXbKYppeh2s
2qRfLDKnB+nrVq1Z9JFqHLybNmaat6lwB/VPF22TQgx9UAWDjxdBzwJ6VFvpovQy
TAUbAHfTohKMTpVuBvZDxpmuptD5iZ4AGMD8+fRzpkdje1NcsnyZb2xJwkf7B3BI
qCFt+mmPCkhFBANiIoe8hl0Rzs634PA9QNj1O//mJFD64JKtKvSW5YDnTgGl31fg
Fp07FKcilYCsPANT4j78Bqx2zkbYrUi9JHLywOKrCmTHhgxWEbcm9qMTT6gZkMDV
6ad3zi0klpxnbUAyEygc
=UWR+
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
