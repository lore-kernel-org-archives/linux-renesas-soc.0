Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49200 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965243AbeFZDFO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jun 2018 23:05:14 -0400
Date: Tue, 26 Jun 2018 07:05:10 +0400
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
Message-ID: <20180626030510.gq3xyejsrc5gd5wj@ninjato>
References: <20180529105847.15663-1-wsa+renesas@sang-engineering.com>
 <20180529105847.15663-2-wsa+renesas@sang-engineering.com>
 <TY2PR01MB2297BC5F12034143657590A7D86C0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <CAMuHMdXaspHUg3LF1Jckg5CWHZWRL6gKOeCv-LHk4uzsji2W1Q@mail.gmail.com>
 <OSBPR01MB2293BBBFEBF58E8D90F3B516D8630@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSBPR01MB229354C6675F1185BD182C54D8640@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <CAMuHMdV-vLn-C6HcZBLwJWbXq2S3e-iQdmQXCEXm23+cEvk8gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ntvp55rya5tnnkbm"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV-vLn-C6HcZBLwJWbXq2S3e-iQdmQXCEXm23+cEvk8gw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ntvp55rya5tnnkbm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I got information about this topic.
> >
> > < In CPG / MSSR point of view >
> >  - This needs 35 usec wait while asserting.
> >  - After deasserted a reset, no wait needs.
> >   - In other words, there is each hardware IP dependence.
>=20
> Let's call the above procedure A.
>=20
> > < In I2C point of view >
> >  - After deasserted the reset, this nees SRCR register polling.
>=20
> Let's call the above procedure B.
>=20
> > So, I don't think cpg_mssr_reset() checks the status bit after deassert=
ed a reset.
> > But, what do you think?
>=20
> cpg_mssr_reset() indeed does not check the status bit after deasserting
> the reset, as it follows procedure A.
>=20
> Such a check could be added, though. Then it'll become
> (let's call this procedure C):
>=20
>         /* Reset module */
>         spin_lock_irqsave(&priv->rmw_lock, flags);
>         value =3D readl(priv->base + SRCR(reg));
>         value |=3D bitmask;
>         writel(value, priv->base + SRCR(reg));
>         spin_unlock_irqrestore(&priv->rmw_lock, flags);
>=20
>         /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
>         udelay(35);
>=20
>         /* Release module from reset state */
>         writel(bitmask, priv->base + SRSTCLR(reg));
>=20
> +       /* Wait until deassertion has completed */
> +       while (readl(priv->base + SRCR(reg)) & bitmask)
> +               cpu_relax();
>=20
> Probably we need an upper limit on the number of loops, and call udelay(1)
> after each iteration?
>=20
>         for (i 0; i < 35; i++) {
>                 if (!(readl(priv->base + SRCR(reg)) & bitmask))
>                         return 0;
>                 udelay(1);
>         }
>         return -EIO;
>=20
> Any advice from the hardware team about that?
>=20
> But according to procedure A, the check is not needed?
> Probably because 35=C2=B5s is an upper limit satisfying all individual ha=
rdware
> modules?
>=20
> I'm wondering whether we could use procedure B in the general case,
> as it explicitly checks for completion?
>=20
> Procedure C is safest, though, so probably the way to go.

Any news about this topic?

And how to upstream all this? My I2C patch is clearly a bugfix, but the
necessary CPG update technically isn't? Not sure about this one...


--ntvp55rya5tnnkbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsxrWIACgkQFA3kzBSg
KbattxAAqERNNqMxQryj2hvJXyUp/+CYC/3j97QPFjEHdpGK4KvDIzT4ckqaurXj
uPtHAXP53uxlV4NrXWbvhEAfrfzgm2K3lckdClrEfnNBxaev+c8PwQoDAHh0GHKA
j/X0FpcIs6jc5qFk3H0Fn/FQ+CqrKp7iUthnZS5dG9hJIQLvmfWMAyfOvvsmSNfV
78Bz9A6E6Hu/LgH5n+PQql3zUrCuXGvm0gY7BG8Qyqu1X9YZTkmo0vAy6TwRNK2x
DpIYrkQR/eYaLMf7mZ16tZEFYutHpU6LPSjO2t5HeAh20cFk52dP0wP+Q/GVqNsn
hHVDb7FuujYpfxiKvBscXNXjQwBxjcAVn3Z8QBQW+SRlE9L9qQ878scRIm3FIHwY
HkgeoPK/RCM1bxu1+49HFVdyDajQ4PFR/rbsD/QeuvfqJ5hFE6wgFaIYG9hSo9GW
sJCBEdgTULls8Iz4vvGD4u4wLcXX9LgULLJSiDicDnfe0PFEdyMmH5HwvvGT1j8Y
Zs2UZIIgLfrC0ZO+yZ9i0Zy97QCmDYHGLewVigrUsI/J5lKxicruOh0krx0LbQCP
bt4sk2t2s1AVzzxtSJCx4kezNVIsmveI5hpuUCimmJcREj+GnBgwWrdFlbr6F39D
AsAZAR01hffCpoYzBJmo4tS9KOice2NQxgwMXP9B64SQ3lU0VvQ=
=LEDe
-----END PGP SIGNATURE-----

--ntvp55rya5tnnkbm--
