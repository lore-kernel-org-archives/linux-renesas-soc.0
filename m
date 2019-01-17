Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B36DC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:18:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C188E20851
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:18:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfAQKS1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 05:18:27 -0500
Received: from sauhun.de ([88.99.104.3]:38702 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726029AbfAQKS1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 05:18:27 -0500
Received: from localhost (p54B33243.dip0.t-ipconnect.de [84.179.50.67])
        by pokefinder.org (Postfix) with ESMTPSA id 65C452C3F83;
        Thu, 17 Jan 2019 11:18:25 +0100 (CET)
Date:   Thu, 17 Jan 2019 11:18:24 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC/RFT 1/7] i2c: sh_mobile: simplify sending address for RX
Message-ID: <20190117101824.7knzifej66j2lo3o@ninjato>
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
 <20190116210555.12209-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdVMQp9YOTc-WDSLkTdeYppHMO0sTBF3fkkxn-VvBUbZUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mn24xgtq7u7z5vmj"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVMQp9YOTc-WDSLkTdeYppHMO0sTBF3fkkxn-VvBUbZUw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--mn24xgtq7u7z5vmj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2019 at 11:11:09AM +0100, Geert Uytterhoeven wrote:
> Hi Wolfram,
>=20
> On Thu, Jan 17, 2019 at 1:36 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > pd->pos won't be smaller than -1, so we can simplify the logic.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Thanks for your patch!
>=20
> > --- a/drivers/i2c/busses/i2c-sh_mobile.c
> > +++ b/drivers/i2c/busses/i2c-sh_mobile.c
> > @@ -392,13 +392,9 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i=
2c_data *pd)
> >         int real_pos;
> >
> >         do {
> > -               if (pd->pos <=3D -1) {
>=20
> If this condition is never true, shouldn't the block just be removed inst=
ead?

"pd->pos won't be *smaller* than -1"


--mn24xgtq7u7z5vmj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxAVmwACgkQFA3kzBSg
KbYTEhAAl0vtv4wgqZmWPHVVZnPa78gzyMOFXKJUEBSmqWpfOUPSysJvnmi0FCNy
PiXa5pQnMsZUfDqLa9MRdxjomEdVKAEir8G+VX+wPWEzzfFDljRQGv9gGvySXRZq
kKWHMmrcI7hgMf3l9cRUPYXMPrl5utIyoyGr83Jah5P12qViBS6IINxhNdWslfoz
Za2VedQDCETgt2OmCQMQynGbEhOkY71lg8kKQkZnhlw0MehjRXb9e01dn6RX0N4J
WiXxs3SVbWSpIsnw3Km/KEBkxdh6nXoWdc508I9+VYtly14JgPL/IqCVbP3qvHAU
uRtfFd4+XXFfg8uH9TK8jOdIweESkcSkhGZxS5xLVdXMibssiySAkAMwwrcsyGay
/23VnTFtj7B96rLMir71Gk+Aa/aulgbgCg0TJdCTWGRTlwNAQTezetPjteDBE9vF
ysYvpn7kVgxgNsbM5vpSIzsu8dPLGpSD8PF+JS7ONmPWfOi6xjnYPt7VSIAy+rQG
KHGkSRLyr1tjzNt3l6suTKn0SZwxcOb6VW4Dtb3XPmDkF3vu+l1bFED4mOUGVzGF
9IhQIl6Fgu0b7LpIQJ3VWrGpGwKRr3NJ5kEcBcTejcJc6/g+Yn5PU+StjTUFAFVk
03RsOvdlSNVAgV4XLb8nm39nqDvIgotZjEaw91VS9uDIcHeqboQ=
=J6ey
-----END PGP SIGNATURE-----

--mn24xgtq7u7z5vmj--
