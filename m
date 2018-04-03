Return-Path: <linux-i2c-owner@vger.kernel.org>
Date: Tue, 3 Apr 2018 17:55:24 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH] i2c: rcar: initialize earlier using subsys_initcall()
Message-ID: <20180403155524.f7bjynyrr2uaxbvb@ninjato>
References: <1521197932-2073-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="euh6l4bxwb5kblho"
Content-Disposition: inline
In-Reply-To: <1521197932-2073-1-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--euh6l4bxwb5kblho
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vladimir and Eugeniu,

> The purpose of this patch looks pretty similar to:
> 104522806a7d ("i2c: designware: dw_i2c_init_driver as subsys initcall")
> 74f56c4ad4e4 ("i2c-bfin-twi: move setup to the earlier subsys initcall")
> b8680784875b ("i2c-gpio: Move initialization code to subsys_initcall()")
> 5d3f33318a6c ("[PATCH] i2c-imx: make bus available early")
> ccb3bc16b489 ("i2c-sh_mobile: change module_init() to subsys_initcall()")
> 18dc83a6ea48 ("i2c: i2c-s3c2410: Initialise Samsung I2C controller early")
> 2514cca06be9 ("[ARM] 5394/1: Add static bus numbering support to i2c-vers=
atile")
> 47a9b1379a5e ("i2c-pxa: Initialize early")
>=20
> However, the story behind it might be a bit different.

It definately is. The above drivers are very old, from the days where
-EPROBE_DEFER was non-existant. They needed subsys_initcall to be able
to boot. The reason they still have it is simple: reverting to
module_initcall could cause regressions.

This patch is about boot-time. Very different.

> Experimenting with async probing in various rcar-specific drivers (e.g.
> rcar-du, vsp1, rcar-fcp, rcar-vin), it was noticed that in most of
> the cases enabling async probing in one driver introduced some degree of
> inconsistency in the initialization of other builtin drivers.

I have to admit I never played with async probing...

> To give an example, with pure sequential driver initialization, based
> on 5 dmesg logs, the builtin kernel initialization deviation is
> around +/- 5ms, whereas after enabling async probing in e.g. vsp1
> driver, the variance is increased to sometimes +/- 80ms or more.

=2E.. so I can't tell if there is something which can be fixed on the
async probe side. I would naively think so.

> This patch fixes it and keeps the startup time consistent after
> switching certain i2c-dependent drivers to asynchronous probing on
> H3-es20-Salvator-X target.

I am not convinced "fix" is the right word here. Why is it not just a
workaround? Are there no other possibilities? I know other solutions are
usually complicated, but playing with init levels is fragile and caused
circular dependencies in the past, so I really don't like them.

> Another effect seems to be improving the init time of rcar_i2c_driver
> itself from ~7ms to ~1ms (assuming CONFIG_I2C_RCAR=3Dy).

That doesn't help the patch much ;), but still interesting because I didn't
expect that. Do you have an idea why?

Regards,

   Wolfram


--euh6l4bxwb5kblho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrDo+sACgkQFA3kzBSg
KbaLgQ/+N6MfC5DI4P3IRcsgHaQ1/3HuLFeX6dOPdBVqhf37e3BbKxLHGyqGnOB8
di6JjoicpCIX7xBffRblwYXSQn8JmHUoU4GDpIlRpEVI7JOxOvnML9tqGSOhzZUG
73rIeQPCoLPzo1inJCRvZGEUyOr7/Uuln7WJVzvDIJF+y0xfmZ0h45GHb1P3ioyU
evAgVC0Fq57zS36f/zlXi2PagR9+W9wOwmoKTph/qI4nADfdRWPWtRp3Cs597G4f
/RJrNDPPciyH7U5ZxQkTTSjlkeZdUEob6PX1cC4IpXE/CCZ0/fBEczq9Z/jcuT0I
mdUQWi126miTkCMPT4GJlzagTYg3/K/j5FpJLtR54mC2VIU8JVw5XmAH+0GNBiix
3FvDIAN5v+7OaPlfbWE6SlRGA5ABFdKf+Wpt2koXxpjkO9L3upqhqeXNAYioSLPq
rKAkOzKYkBQYF55L6T+PqyyfTHaXkxBoDCG0ZrmUhB7eKehlYOj0ECViVHhxRAWN
znN9ZfsQwG7m/54czYFal8aSJPfQfAsyi5Y2tfJbNEDR5tCF1NhTpvLVZYwhs+Dq
BFD44C+qpS/YZCQYi7IWs/5inEWW1tKbb2alWDjFVS88wVykugBpPRXZ53Z+1fwB
qp/YGkimjjWgizKX0D+SdSHn7JWd6NU2YH6AAtGjedrDMepoe5M=
=n/OQ
-----END PGP SIGNATURE-----

--euh6l4bxwb5kblho--
