Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:43912 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752390AbeDCRIb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Apr 2018 13:08:31 -0400
Date: Tue, 3 Apr 2018 19:08:30 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH] i2c: rcar: initialize earlier using subsys_initcall()
Message-ID: <20180403170829.iaieac5wk4hkleme@ninjato>
References: <1521197932-2073-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <20180403155524.f7bjynyrr2uaxbvb@ninjato>
 <a3d7b5d2-3a1c-7bc6-dc5c-4dc4d658ba40@mentor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ltan6phs2qwud2my"
Content-Disposition: inline
In-Reply-To: <a3d7b5d2-3a1c-7bc6-dc5c-4dc4d658ba40@mentor.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ltan6phs2qwud2my
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Thus putting an I2C master controller device driver to the same late
> init level means that due to the concurrency there will be lots of
> probe defers of endpoint device drivers, and making "heavy" device
> drivers like rcar-vin to be run in asyncronous probe increases boot
> time dispersion (rcar-vin is already probed, it's time to probe a
> sensor, but I2C controller is not yet ready to operate, defer).

I do understand the problem. Yet, the root casue is that deferred
probing is only an interim solution not well suited for such cases.

> I don't suppose that the proposed change has any single negative
> side effect, well, right, probe/remove code becomes more awkward,
> but in general the expected effect to boot time improvement should
> cover it, I hope.

We once had a discussion where one guy needed subsys_initcall and the
other one needed module_init because of different use cases. That was
not great.

I am fully aware some probe ordering solution in Linux is much desired.
But fine-tuning init levels is a workaround. Even worse, it will
reduce the pressure for a proper solution. And if we ever get that
solution, different init levels will likely make the conversion harder.

So, I do understand your customers want such a patch for their use case.
But I don't think it is a good idea for the upstream kernel.

I'd think this is an out-of-tree patch for now. I'll talk with some
other people about their view, but I remain very sceptic.

> >> Another effect seems to be improving the init time of rcar_i2c_driver
> >> itself from ~7ms to ~1ms (assuming CONFIG_I2C_RCAR=3Dy).
> >=20
> > That doesn't help the patch much ;), but still interesting because I di=
dn't
> > expect that. Do you have an idea why?

Still interested.


--ltan6phs2qwud2my
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrDtQ0ACgkQFA3kzBSg
KbYjaw//dGYIGhk0wWCCFxkUgvP53/GVC0qN3bAUrWDUoTc+WAwfrT5e4kkoUHMs
kqGbJxbfGTJ+AP9T4KF7czt5AxKZ7VmMr4rG5p1nsVcophWcP/Kh3mwzRevu8yqC
eImw3qQVXIRXIxHc5fwIJEfcgqvN+UkDQt4hsdQBmUQ4AOfFyx6PXH3Qr+X5X1WH
Wi8iEK+HqJ++qtWzjrTD2KHvxlvCK+2KDEJsNrQ0LGq2c50l3rumSV3TNcco9bTx
4fS3umiTrd84nLxUhYsy2dKeC0sgxNnxZmKycKnAc5qDGHpnZbk2j/umjtrigv0D
a3wYQVw16cOypGrJngqgzGB4goXm6yHuakGsQhDaBhmj23iJxzn4DQuwDrwAxK4y
7Qnc6ZqS7RZGi4MQjXD3uTWl+2d2Il3KKWazaoi7Ft/nZrMX9F/aUUamkBw3QETI
L6etSiBpt1KLw5/ILhJkfDQ5DtbK86cXGYeVqxdD8DSGDJTWikWIMHT9PH2iQb4V
2fS9osKEQs2tJ37x146W+2PoUCeMYgjiINprVeEnT3tRlPZPs4wZSmiGoqd6BZM1
giQl3Lz3ML4UJxAIHpIKp7OsnBw2psJgNXQBsuxxpiqYeyclBb5G1d9GJhnVM3Bb
Rn8LGWC0J9la7MiKwd35yQLA65VqntmfQvQavQdfqqi3LeeSmyk=
=yiwT
-----END PGP SIGNATURE-----

--ltan6phs2qwud2my--
