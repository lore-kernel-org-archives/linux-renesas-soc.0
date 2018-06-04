Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:51940 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752187AbeFDHc6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 03:32:58 -0400
Date: Mon, 4 Jun 2018 09:32:56 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mmc: renesas_sdhi: really fix WP logic regressions
Message-ID: <20180604073256.leexbgdqfvjz7eyo@katana>
References: <20180601110037.3400-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFpTG2kEEAe_hjRe-8vyuHW11i4NRmnNMeEcFxpBC=D48w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gorj3xn3pksexvui"
Content-Disposition: inline
In-Reply-To: <CAPDyKFpTG2kEEAe_hjRe-8vyuHW11i4NRmnNMeEcFxpBC=D48w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--gorj3xn3pksexvui
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 04, 2018 at 08:44:42AM +0200, Ulf Hansson wrote:
> On 1 June 2018 at 13:00, Wolfram Sang <wsa+renesas@sang-engineering.com> =
wrote:
> > This reverts commit e060d376cc61 ("mmc: renesas_sdhi: fix WP detection")
> > and adds some code to really fix the regressions.
> >
> > It was missed so far that Renesas R-Car instantiations of SDHI chose to
> > disable internal WP and used the existence of "wp-gpios" to en/disable
> > WP at all.
> >
> > With the first refactoring by Yamada-san with commit  ("mmc:
> > renesas_sdhi: use MMC_CAP2_NO_WRITE_PROTECT instead of TMIO own flag"),
> > WP was always disabled even when GPIOs were present. With Wolfram's
> > first fix which gets now reverted, GPIOs were honored. But when not
> > available, the fallback was to internal WP and not to disabled WP. This
> > caused wrong WP status on uSD card slots.
> >
> > Restore the old behaviour now. By default, WP is disabled. When a GPIO
> > is found, the GPIO re-enables WP. We will think about possible better
> > ways to handle this in the future.
> >
> > Tested on a previously regressing Renesas Lager board (H2) and a still
> > working Renesas Salvator-X board (M3-W).
> >
> > Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Unfortunate this didn't make it for 4.17, however I have applied it for 4=
=2E18.

With stable attached?


--gorj3xn3pksexvui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsU6yMACgkQFA3kzBSg
KbbW5g//TWU2We2g5FpHeJ1+32dIeLK6yRmmiDntX3nrGOvw9QYjpSXKEKtGneIO
8JV+q3UKUWsz+8lJHtN1AASVlatEiLj8oqfZg1dqea0/DQPmnTxVLBlucAU9E2tf
JAKpfkUBowt5j4KHkAkGoFwBJ871XJ3uQRjb/W0Mco/WCToI/EB4LrPnrMbAGFLB
T3G3mzBmGF1jTZ9CK2UyidUuTzFQ9tpVGESy+RdxWCsvSNkZ3TWtvNQMGiNpMvWM
eCoNbqSIqkYx+EOVmssTNHf2Z9PfDOhHd3oAxehkFFr87YWb7MlziL+9Uto4IfkH
R9E1jjKSA3H6GFNR5lp6j3aP4H3WgBU5wSaVZlbqSMfpyChdEIii2U2mF7cMdXry
bCJNOP0h3dlb4IXuy0mHQfLobmnoo8B1tooala7TRRiXI57xCoVuAdwEDObsLtXW
6niWA0/Q0obHGb/2wrGkp+iJ6d02Ejj6HwegflK3ZKddMh4JDvQaCTsLXhiEqr5W
9yDbIab9MmyesxIh4JdVH97c2eenco2jSzKSH3RAvLlNxjUw0iLzXcwwHOmK3n4W
NiI78iuSO7jE6iz0vGB11E8wAsuq7keK3GUCilv3mSLKM5uYescyTJ+6qKI+koBC
+461Hoc77GyjW6SUdzm62iFEEAC8p01fndFw6u7l6RTJjSbZWCE=
=3uNq
-----END PGP SIGNATURE-----

--gorj3xn3pksexvui--
