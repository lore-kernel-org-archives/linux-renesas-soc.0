Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38394 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751639AbdFOTZU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2017 15:25:20 -0400
Date: Thu, 15 Jun 2017 21:25:18 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/i2c-core-dma for renesas drivers
Message-ID: <20170615192514.bwf52gi7di436bkm@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iu7xm3ngzpqbdece"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--iu7xm3ngzpqbdece
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is a topic branch for renesas-drivers adding better DMA support to
the I2C core. It is based on i2c/for-next with the branch
'renesas/arm64-dt-for-v4.13' from Simon merged as well. Please pull.

Kind regards,

   Wolfram


The following changes since commit b41c5497755a66628e2ebf4641ce2849c79bb731:

  Merge remote-tracking branch 'renesas/arm64-dt-for-v4.13' into renesas/topic/i2c-core-dma (2017-06-15 16:14:46 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/i2c-core-dma

for you to fetch changes up to 0780b6c3d3e6079635cfbae3386a1e196da78925:

  i2c: rcar: check for DMA-capable buffers (2017-06-15 16:27:49 +0200)

----------------------------------------------------------------
Wolfram Sang (4):
      i2c: add helpers to ease DMA handling
      i2c: add docs to clarify DMA handling
      i2c: sh_mobile: use helper to decide if DMA is useful
      i2c: rcar: check for DMA-capable buffers

 Documentation/i2c/DMA-considerations | 37 ++++++++++++++++++++
 drivers/i2c/busses/i2c-rcar.c        | 18 +++++++---
 drivers/i2c/busses/i2c-sh_mobile.c   |  8 +++--
 include/linux/i2c.h                  | 65 ++++++++++++++++++++++++++++++++++++
 4 files changed, 121 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/i2c/DMA-considerations

--iu7xm3ngzpqbdece
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAllC3xoACgkQFA3kzBSg
KbYDDA//QXNPm2z7roS8JeA9l0W/pIQz+ZQhWE4CsiL8+NCTwXn+v41tBh4vlPkM
xoXm1IBjWQt9k8aA+FXyclTYpxwVOIvGCUkJWL4oQDa228mVBH1G3x+OSYrA1rH9
1Ra2Vy5oSxD0ZBmzez0tj1Vl6p/qXuVkPAskNZ7/rKJwy8Ft054xcVx18E37H42w
OAaLrK3UHUC17oNO2O/D552yQCCeG6BxxDndEGNQDZVwh1QANZ2umq9PJr7lV50+
YqvGi53Bp/cmDywLwnbuhlRIZLtyIu/R0kDDHOBhqz8Xoh+Xn+8u9/W6feqpu85i
DsBALdB7xPT8qMtKq9ZS79CH1lwp685fGlz+sI3cq3fCcCJX4C+EtPCwWG0LRvma
SN9Z791+xNXnG5TfvhWXRaGXgF2c53hlar/+iXC3lNZyoZzQEAfXecLDNwDHXFk4
kVGUmpz1U5iATlh2R08JcHsYxCAvKmKktCFDWIYafxy8uySSF7JIu3qmGclSO7uC
xWr2vVOJYF5UAIeI/Yz2Gbvd0DUazgFTPKu0bgXEnQL5IS7rxGXqLX8ryI11X9v8
qfq33o7QTrUikPFUSYRHP/C69uAI+hofQ2pIlgWedRC+C8wO3LgdGHNvMcjCRMvn
7V60XBjWB4HKectP3N1NxDqm08wGXVOtwo+X0zF2Uvg+eZ8h4N8=
=DhOo
-----END PGP SIGNATURE-----

--iu7xm3ngzpqbdece--
