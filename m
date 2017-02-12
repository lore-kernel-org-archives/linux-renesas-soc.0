Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:50605 "EHLO pokefinder.org"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751137AbdBLL1q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Feb 2017 06:27:46 -0500
Date: Sun, 12 Feb 2017 12:27:44 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/sdhi-autocmd12-resp for renesas drivers
Message-ID: <20170212112740.4dq5uqkmgeodmbsy@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qyvbhpgn4l3kd7as"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--qyvbhpgn4l3kd7as
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is a topic branch for renesas-drivers to report back autocmd12
responses for SDHI. It is based on mmc/next. Please pull.

Kind regards,

   Wolfram


The following changes since commit 0c3630150c9af658e7375c509c670fadf052cca8:

  mmc: core: start to break apart mmc_start_areq() (2017-02-03 10:50:23 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-autocmd12-resp

for you to fetch changes up to 22b13c28ac6b92f3acf7a5a91575b9da004c853a:

  mmc: host: tmio: fill in response from auto cmd12 (2017-02-07 11:47:26 +0100)

----------------------------------------------------------------
Wolfram Sang (4):
      mmc: host: tmio: use defines for CTL_STOP_INTERNAL_ACTION values
      mmc: host: tmio: fix minor typos in a comment
      mmc: host: tmio: don't BUG on unsupported stop commands
      mmc: host: tmio: fill in response from auto cmd12

 drivers/mmc/host/tmio_mmc.h     |  6 +++++-
 drivers/mmc/host/tmio_mmc_pio.c | 16 ++++++++++------
 2 files changed, 15 insertions(+), 7 deletions(-)

--qyvbhpgn4l3kd7as
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAligRpwACgkQFA3kzBSg
Kbaghg//SOWDcplHtC/J5pXqvV75Pop9sqH9Fg91nxZkR6f6QKmjCRYKXBQMdI5T
4SxaCP9+jt6PlchEl4WUxUSPCDBfSBpdlS+cN0xAhlAXqWwLYKT/4I4Y7DRtHZdn
OmPYv8grKgunKXyevMePINsuGx6hIFh53/ILXBJ/JoZkzMysJDdxenjSoTEhUsHI
hYYHF2LLUQwrEWArAcFVzm7jkrBk0NP5nhhW6febu9oQK3zdqdyNG5n0j3Nc7yJK
/YFn+mzeJg6bmpHfQ2bFmRLJsz2GeOyfpWcsByYAtRaseR8Yrbux1ava8KFI3YWn
PbO316CxK74HS+Tc8MDmPxuVOufNf7egZSqTNsg5tgCfFUkn8xNY7r8GUQm9cIyZ
HfP44RgQgNPc+sT5gqng5PbZnfVsXwbI6U+O47pdPedx1g5o2xIM5TUd+FbZx2c5
16SplzENEIQ7DEPvd2kVTy+PM5x48l3lH1v2I/xAJWU21qU5FEPkk0XT/T4uRFvJ
2McnbwRBkxOk6VRIhxWZ+7JGWl7XGpK42fj1qaKzU3Q83/pc5afw0IkqLhP8v0KA
rE1JkE67dTsm++nx8sxQ1V5zCa3W5bMG4Rd3r59e4wt362HF9LAwywutAx+Lg8V+
XaaFKGLcmyKQTlBgjCMnKNmwZub11Jz/IxIBXG54yUG12hNerrc=
=EiP0
-----END PGP SIGNATURE-----

--qyvbhpgn4l3kd7as--
