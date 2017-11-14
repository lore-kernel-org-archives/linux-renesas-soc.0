Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33153 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755923AbdKNXG6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2017 18:06:58 -0500
Date: Wed, 15 Nov 2017 00:06:57 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/mmc-delay-refactor-for-geert for
 renesas drivers
Message-ID: <20171114230653.onmwsrcqrcvybq7r@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ztoqlsp2wwpm647c"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ztoqlsp2wwpm647c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is a topic branch for renesas-drivers removing calls to udelay() in
both, TMIO core and the MMC core itself. I hope they land upstream in
v4.16. Would be nice to get them boot tested via renesas-drivers. The
test page can be found here:

https://elinux.org/Tests:mmc-delay-refactor

The branch is based on mmc/next (which should be soon in v4.15-rc1).

Thanks and kind regards,

   Wolfram


The following changes since commit 06641e8deae68ee2769c734158bc9170be257bb9:

  sdhci-fujitsu: add support for setting the CMD_DAT_DELAY attribute (2017-11-07 13:43:23 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/mmc-delay-refactor-for-geert

for you to fetch changes up to edfceba9d1b241e5258e80f997bb5579a5dea895:

  mmc: core: use usleep_range rather than HZ magic in mmc_delay() (2017-11-14 23:47:24 +0100)

----------------------------------------------------------------
Wolfram Sang (2):
      mmc: tmio: use usleep_range consistently
      mmc: core: use usleep_range rather than HZ magic in mmc_delay()

 drivers/mmc/core/core.h          | 8 +++-----
 drivers/mmc/host/tmio_mmc_core.c | 8 ++++----
 2 files changed, 7 insertions(+), 9 deletions(-)

--ztoqlsp2wwpm647c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAloLdwgACgkQFA3kzBSg
KbZGiA//QdUQ27XAMY03aMYgFklFgYiWmBnUV9dyD38JZ8cih/A+Gp8Vuw7+zISQ
TX6IjpoeRs/+qARF/b0j31zHNjU/8IYeGjkZSNnnc4ukwRPuakiZwi5/7zgLde5Y
ZjwCi3kMX9hlQDnXPSO979UPf+9z+Wxzh1PYXYetlJPOaj0gNgFmOx3X5Nezo+i7
SZohKeHRnWT1ILSmF+TPsCs28F6FS+a/qQPYtAF/oKYZeGymyJ42SjejmYEsnqJk
QODjX5tDYyCGCcD3T7bl8yCdEPsnlVO09ZdAHtyUlCaUX1A5bu7PmMcIOynP9ruA
HYfwbuAtBBERzT/6/v0d9Tpgv0gSRZiheRPLmYTGb6g49wWmoS7aCqa3/l1FG0n9
awfhTICEvLzD3MOO6nodAkksTJ+1QsqP7Iy458TrHTzjU4dQVNcmIxJX0lmSIvKQ
0iwG9TuOQafZBY/87wFItrmJ7XjFktxNeD00tOsIQDzqo452wxaFhq9g5voyxd+F
GVEsSS1uw5RjoScUKyg2UYyQb3aolyoHeUrJanMnfrQQkSd7fpGTuEPW7Wb3WBCf
EwjA9bfORNgRcFilblsm6OSW2dRNZnqj+GlvK0wAUbzfH4SsjBmRb0xe+TmCZmsY
4lOwKbzCZ/e/B2qfG7MDdCAaUX2cBHLBoElvnKOTFHiGNDKFyfM=
=EmD3
-----END PGP SIGNATURE-----

--ztoqlsp2wwpm647c--
