Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:48166 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1423475AbdEAJMn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 May 2017 05:12:43 -0400
Date: Mon, 1 May 2017 11:12:40 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/sdhi-cmd23 for renesas drivers
Message-ID: <20170501091236.4nsznozv23wx2izm@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w3s262p5sphn5nfr"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--w3s262p5sphn5nfr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is a new topic branch for renesas-drivers based on mmc/next as of
today. There are likely going to be conflicts once Simon publishes his
SDHI DMA refactor work. Please drop this branch then, I think it is best
if I will provide you with a rebased version once this happens. We will
see. But for now, please pull.

Kind regards,

   Wolfram


The following changes since commit a627f025eb0534052ff451427c16750b3530634c:

  mmc: sdhci-of-esdhc: limit SD clock for ls1012a/ls1046a (2017-04-28 14:53:13 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-cmd23

for you to fetch changes up to 7e4df752d57931e2962254e18cee12890f9018ce:

  mmc: sdhi: add CMD23 support to R-Car Gen2 & Gen3 (2017-05-01 10:52:56 +0200)

----------------------------------------------------------------
Wolfram Sang (6):
      mmc: tmio: make tmio_mmc_request function more readable
      mmc: tmio: refactor handling mrq
      mmc: tmio: remove outdated comment
      mmc: tmio: move finish_request function further down
      mmc: tmio: add CMD23 support
      mmc: sdhi: add CMD23 support to R-Car Gen2 & Gen3

 drivers/mmc/host/sh_mobile_sdhi.c |   4 +-
 drivers/mmc/host/tmio_mmc_pio.c   | 135 ++++++++++++++++++++++----------------
 2 files changed, 80 insertions(+), 59 deletions(-)

--w3s262p5sphn5nfr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlkG/AQACgkQFA3kzBSg
KbakfBAAmAuHFeyeaA+sZX7Ko5fP9fvNoIKlUmz/rhq20E/7CPLMwRH1KfQEoUXD
kscILxFCaZySLa771sdIRyR5SS9ynAdP+dlkqDUZtvFtThkoroTx7qqdTLkkFTZf
qpgi0kBpoggqmw6pIR9XpqinupQgdfWcyH3UN3tQPjO7kvKAKM9wAtWFyUXvJ5cK
VDsAjUj8zUGROQo5j0pk9ygt8rW9/6FZO14udDTMU5YxG1N1tZBTo1rLtRYDlsyT
1PdF8HPVPK6HUiRNFsjeKSUKLe1PBmTtBOhHoe571Oa30pEfvhRdRv6oKKGW96Jz
mk5FpcO48Wz+BUgqilBUZqomkPGC87c8/v3k5wbS9PQg9yiu3qTtVUrcI1NDtW5l
H4uBMnShKW+OQ/9F9yTgZroI9Q8jEi2+vCMQ7O6VPGcp906Qz38rypqTjT37EMYz
4qXrDxvkpYyt00jZ0araZ5qV3ZoykmD00SGkWJ9B6LkR9N1BpTBSeC7qO661AHgE
NQgDRrmr3Y2qn04mCTv0xlzy5u9mmSH/GM2NozLYbfcQ10UqKoLuN1TbdvIVVdrK
+LZoZVmItNyO0QHrLBvJm1GBifSkJ2dRzzj+K//tX78g7zxzxdTv/cDIODmsmMBW
qli4r1Ei7ZmSNvFzcjZFH/W00U7m9OFPXvDUDxkeLQAb/Z169gs=
=ym6F
-----END PGP SIGNATURE-----

--w3s262p5sphn5nfr--
