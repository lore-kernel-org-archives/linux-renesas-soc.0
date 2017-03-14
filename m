Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56280 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750815AbdCNK2O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 06:28:14 -0400
Date: Tue, 14 Mar 2017 11:28:10 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/sdhi-autocmd12-resp-v3 for renesas
 drivers
Message-ID: <20170314102806.2sxatl7kqom5dmaa@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nh3w7kx2wu4m4kcx"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--nh3w7kx2wu4m4kcx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is an updated topic branch for renesas-drivers, the old one being
'renesas/topic/sdhi-autocmd12-resp'. It is mainly a rebase to v4.11-rc2
(without any conflicts), but I thought I still let you know.

Kind regards,

   Wolfram


The following changes since commit 4495c08e84729385774601b5146d51d9e5849f81:

  Linux 4.11-rc2 (2017-03-12 14:47:08 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-autocmd12-resp-v3

for you to fetch changes up to aedacdd7519ad363bc1c74f7ae9ea365ae9aa27b:

  mmc: core: check also R1 response for stop commands (2017-03-14 10:57:59 +0100)

----------------------------------------------------------------
Wolfram Sang (5):
      mmc: tmio: use defines for CTL_STOP_INTERNAL_ACTION values
      mmc: tmio: fix minor typos in comments
      mmc: tmio: don't BUG on unsupported stop commands
      mmc: tmio: fill in response from auto cmd12
      mmc: core: check also R1 response for stop commands


with much appreciated quality assurance from
----------------------------------------------------------------
Simon Horman (4):
      (Rev.) mmc: tmio: fill in response from auto cmd12
      (Rev.) mmc: tmio: don't BUG on unsupported stop commands
      (Rev.) mmc: tmio: fix minor typos in comments
      (Rev.) mmc: tmio: use defines for CTL_STOP_INTERNAL_ACTION values

Yoshihiro Shimoda (1):
      (Test) mmc: tmio: fill in response from auto cmd12

 drivers/mmc/core/block.c        | 11 ++++++++++-
 drivers/mmc/host/tmio_mmc.h     | 10 +++++++---
 drivers/mmc/host/tmio_mmc_pio.c | 16 ++++++++++------
 3 files changed, 27 insertions(+), 10 deletions(-)

--nh3w7kx2wu4m4kcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAljHxbIACgkQFA3kzBSg
KbbdyQ//VsUbspONX7Mv4fxgl8V2EU1sbwHGYwqm6MA51MpqCynkarML2QRbJc7i
RaMPbYSkWRCGRyg8qGVidLiMuWw3HLecgUES7C07y5QKJK1iqk4MQOnWwlopd8Tc
TR7YI3BS47PguTZWb9FneRIYQ/u8BVS+bR8+hjfp7YmaE4TQQb1EyF0gJwPaMtYd
jPIGO3FyTROOLyiXzIJNQReJk1EYEdgXfJdaR1plY/1ceQBGH4s222xXj/p8LNo3
Wzpxv00SVnqcnbAGv+PTOQ4zW52OdjNoaFiBv4UdMeGW4P809iP+heS5ma9IlQEC
RZ0DTzZO/fUBzW9Gx/Um8WPXSX8nXbQOz+ST+itbbscJoofRjNirCVkk5xr5ZgEj
ac1C7FSBl6vl9LmMr/s/dZAdHrNoqRYd7thBCMRpWLd0RIZdlaNkaBTpzbsJK1HC
OGNqni/kiG5FkSFsqDAPx1rVqf7GrR320UzEOhpl0dtHlMioGQvJ6DVuqltMKVzh
vWSgtJnd53VNjQGfucVF2GaG7q3tXy4/YwJdMcP35G4PGqBpGx9h3lCbgHT5OLpJ
5tgQlfW+UXkevmvlc7CShxmXTcSO7nrFEbV07lBKvV9b/Aw3Ckdwxkxn+H/qLhCm
JWCqt78JHqoAcM41Z8NQwKJpaP6OAJTr+7T27GOAtCukP+/+pxY=
=WAf1
-----END PGP SIGNATURE-----

--nh3w7kx2wu4m4kcx--
