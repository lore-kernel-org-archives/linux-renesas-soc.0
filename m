Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:51924 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388006AbeGKQ5a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 12:57:30 -0400
Date: Wed, 11 Jul 2018 18:52:16 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/2] i2c: recovery: add get_bus_free callback
Message-ID: <20180711165216.hl5ajk5w2uxceiq6@ninjato>
References: <20180710222423.7792-1-wsa+renesas@sang-engineering.com>
 <20180710222423.7792-2-wsa+renesas@sang-engineering.com>
 <e87cb471-e26b-5f57-c1f7-4d403c476a9d@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e74wqgbj54vef76y"
Content-Disposition: inline
In-Reply-To: <e87cb471-e26b-5f57-c1f7-4d403c476a9d@axentia.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--e74wqgbj54vef76y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Hmmm, the name i2c_generic_bus_free suggests that scl should also be checked,
> because the *bus* isn't really free unless both lines are high? No? Or, maybe
> just rename to i2c_generic_sda_free (or something)?

Well, technically, bus recovery is just for resurrecting a stuck low
SDA. So, I'd think checking if SDA went high again should do it.

However, there is HW (at least Renesas R-Car) which cannot read SDA
directly. It will just return the result of its internal 'bus_free'
logic. Whatever that is. I think it wants to see a STOP but that may be
only part of it.

I wanted to have an option to make use of such a feature if we can't
read SDA. It is better than nothing. But since it doesn't reflect the
state of SDA directly, I decided for another callback.

> More importantly, isn't a ->get_bus_free implementation a sufficient requirement
> for recovery? I.e. even if both ->get_sda and ->set_sda are missing?

In my case, it isn't. It needs set_sda (== STOP) to achieve a useful
result. Hmm, I think this needs better documentation...


--e74wqgbj54vef76y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltGNcAACgkQFA3kzBSg
KbZagxAAsxQbaAJtbvuxl9jCw88651ksSGDdQDllgqisL4VEeFLKeZCZcx54DXaW
6mwa6BHpRiHLhIqeaq/NTMP+jB/cBkmPPvjdzFnOdFqY8+PdDGb1Evaxmr3Bju+W
gcME6EwzxiLWfXy3mf2kLVr7d8NU+dAMZ4vpO3MSi7PYsPjBsnGTQQq0w+aWHvfD
tPUI0IkJZtUd/kAyZxBCTkcmGsYFLxHekpCVsj7eSnt9bL5K1QoUb/laOpTSC0sB
0SwD9VflsYQt1giIB2plSv+cpmvX8Hk6DEsvgPoVoV/Mle2DwXCZGqzWNy5fPO3t
BTI0MNlmFsTIJ5MKQxr7ft4PAodYp8YI7XPNRdWCCe2//cFDSNIkCCv1RF61bWFM
JItlKmdXglBVRQlp5HDTmmVj7h2qMeMJbUvNgjjztGMahNWyt7b6Tiob6bBPgWK8
4K94swt58khnMvnYP5o+cOqG2Vnh26OKKCtlRM3UJIRLhbA8izw5UlSEppaokPBZ
Mjtwd9faYtATE4reSNHDnYAhZZtZj3Fdg2SjkDW0qL/ttMQ1J4fU9AUCA3+wRYjb
9kbOAaTqsVEfise9tVVTgeDBWdlTHZDbd0rrQAX3vz0r1rM4sqlt9rsWmCy1w22t
od637nK3QmPUKKPd7RqYnlrNAx0W5/kwisYI8nSXFHlFn2WDba8=
=zH9Y
-----END PGP SIGNATURE-----

--e74wqgbj54vef76y--
