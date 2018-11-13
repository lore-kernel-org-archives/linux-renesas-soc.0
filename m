Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47412 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732104AbeKMVbl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 16:31:41 -0500
Date: Tue, 13 Nov 2018 12:33:55 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Hoan <na-hoan@jinso.co.jp>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        wsa@sang-engineering.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [v2 PATCH] thermal: rcar_gen3_thermal: Fix init value of IRQCTL
 register
Message-ID: <20181113113355.aowqsxuyvxpabjod@ninjato>
References: <1540433621-24114-1-git-send-email-na-hoan@jinso.co.jp>
 <20181105140913.GA461@bigcity.dyn.berto.se>
 <9343e7ef-e20a-b60e-b0f6-0b86662fee3a@jinso.co.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="v573kmn6uezl5nkk"
Content-Disposition: inline
In-Reply-To: <9343e7ef-e20a-b60e-b0f6-0b86662fee3a@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--v573kmn6uezl5nkk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > Fix setting value for IRQCTL register. We are setting the last 6 bits
> > > of (IRQCTL) to be 1 (0x3f), this is only suitable for H3ES1.*, accord=
ing
> > > to new Hardware manual values 1 are "setting prohibited" for Gen3!
> > Hum, as you point out this change is not suitable for H3 ES1.x so this
> > would introduce a regression, which is not good. I will leave the final
> > word to Wolfram but in my view you need to introduce quirk handling to
> > keep support for H3 ES1.x or blacklist that SoC in the driver.
>=20
> With this patch and current state of the Gen3 thermal driver, H3ES1.* is
> still correctly supported.
>=20
> =C2=A0=C2=A0=C2=A0 priv->thermal_init =3D rcar_gen3_thermal_init;
> =C2=A0=C2=A0=C2=A0 if (soc_device_match(r8a7795es1))
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 priv->thermal_init =3D rcar_gen3_th=
ermal_init_r8a7795es1;

Makes sense to me. Niklas?


--v573kmn6uezl5nkk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvqtp8ACgkQFA3kzBSg
Kbb68hAAlAH7+ZTlBAavpr+tWOBm5CGEGv+g4XhQ1dZDB4VZKjx4SEFDpOs6h3xw
VmlS4h8xrsuxYJA7z8hK6Dp0uVXCYU5+kDYpKMe3pDMWG8/6iV8YfMJzrfXkA3hj
8JLCShvjpWj55N2w+r24bUS27mMtFIEhgEhvHgZdBvAX++pGFvEB7viZEt7B6ZmX
qTlrSeb3pZGypgVbJkxLyOxxkl57pGO2Oylt0W7x1hdlkbFeeqjqoI5nyETvwOUf
TmkzDl/vGq5Wa6MnILHqWf8xJaRiMCd04Nu3XMBwUPpj47Kp+nkOVGdgrkCwlsAG
w5wnXasjw4oY+bxYuqJeVkCcaxKdlFN7k2EM9rfve3mtQV0WWhMIfT9/Lmzm2S8B
jwtx+1OiwGg0zOO44n4FnsIwAYBLmQ3CpyI5EJFM9295aHMv/hJupUa3/GldKCmh
TmHz6tgv7a8fUYhl9hyXQq60XNatwSYKgpOUN+CvSp9UIydIJIB06TEmPRH43tWj
gvRzyHirWePOqqpoIveuQnZeMs5ud0kumYE11ccDZ+8+hwBLI6OGIiMUqWu6Tt2J
kJno7lgvej8Kmxr435H51SRKLgo1MoCXuejLYH/4amIrMdCp6matmpQf+ZG74t34
IFpzW5YeU80V0xZYqQY599RbIRrUlJTtF5I9fpERv0HPHAhCvJs=
=0YxC
-----END PGP SIGNATURE-----

--v573kmn6uezl5nkk--
