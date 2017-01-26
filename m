Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:45170 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750998AbdAZLhB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 06:37:01 -0500
Date: Thu, 26 Jan 2017 12:36:57 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Message-ID: <20170126113657.GA2281@katana>
References: <20170104173954.3135-1-wsa+renesas@sang-engineering.com>
 <20170112224353.GB1490@katana>
 <20170113083719.GE2269@verge.net.au>
 <20170113083928.GD1446@katana>
 <20170126100116.GC21851@verge.net.au>
 <20170126100355.GA1435@katana>
 <20170126102713.GA27721@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <20170126102713.GA27721@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Do you have the HS200 enablement patches in that branch? They are
> > currently in -next.
>=20
> I tried mmc/next (but didn't notice anything special there).
> Which patches should I be looking for?

The series starting with 59c21074b582aa ("mmc: sh_mobile_sdhi: simplify
accessing DT data") up to 8c81459fa8adec ("mmc: sh_mobile_sdhi: enable
HS200").

Do you already fetch from Ulf's kernel.org tree? He switched away from
the Linaro tree for MMC for a while. I only realized when he complained
that he can't apply my patches.


--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYid9YAAoJEBQN5MwUoCm20vQP/1uFNXTfByg4IvF/8TD7KW3V
dPHtKhH/G+F7btVVf+R60TnAD3hPsp/pIOaABBqX+uFAYp5+T+5gGT2eJGZwuWSS
dBujw7nx2BB2rvcPmPTXLJ/8cFtL/dzEcUR/8GNPOSQm3KB7cxeGQwuUNq7KJwek
1SbKmdaMFgO9H1BTO6AlIja8q2+xEKZ82wW0YzJ3zVCiOP8A20P6wzZOdesHJI5U
8qBUKKdXV++mk0/X5CsFZFDykbDlHIzl0hA3WLt6yxHaVEhwKb+f0UA4ApoeeVdr
M1L/l3DceHMxkiIeI6AJzc+FNJPV5EaYSyaoKMI5Srx6e8YH14AGrTdoQ2J9KkcQ
Dd1Zu56QY0/xDLKylZjhMaMW4FR6B9OUnhZmo2b5POhJac4ykvhtl7eboOjfaQMq
aZODTLdZoQwSx6DvewyZ9lVWPZHJXpi6LvFAoZCQjDfJe6QrOsEuH1ht0ESwQ7JM
QSgwsYUkVQwNcJhe1jHsNMjn3uxQ3WShX9tmtMBJGivMc6XsqrVcB3f4QzUqiGwj
Pce3ih774rrngpz5tF/SOoYRRX3KwUOyGWPlSikwsQiF93apKyPcLfOI6YU4HEMW
0c3OiomNQ+h0N5mV4ehmy1iUD9V8EZ+40zltDEsjHAOhuyV6oaiJlfYBEmMK/rYH
3rm6PTDoDp9ZL0dPCi9C
=msX3
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
