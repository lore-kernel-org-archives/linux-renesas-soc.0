Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59773 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933881AbdHYPxZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2017 11:53:25 -0400
Date: Fri, 25 Aug 2017 17:53:23 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/i2c-fault-injection for renesas drivers
Message-ID: <20170825155319.5h5qfezsrdvnbhpk@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vucn4uz44gd4mguf"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--vucn4uz44gd4mguf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is a topic branch for renesas-drivers introducing the I2C fault
injection feature. Because of the DTS addition, it is based on
renesas-drivers/master. Please let me know if there is more suitable
base and I will happily rebase it for you.

Kind regards,

   Wolfram


The following changes since commit 91538653fd513606684cae7b58972966b0279ca3:

  media: rcar-csi2: Fix section mismatch from rcar_csi2_probe() (2017-08-16 19:26:39 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/i2c-fault-injection

for you to fetch changes up to 4051abe643e3995ec4c7e42d1e27793bbf36cedc:

  i2c: gpio: add fault injector (2017-08-25 17:24:38 +0200)

----------------------------------------------------------------
Wolfram Sang (2):
      arm64: dts: salvator-common: add GPIO based I2C bus
      i2c: gpio: add fault injector

 Documentation/i2c/gpio-fault-injection           |  54 +++++++++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi |  11 +++
 drivers/i2c/busses/Kconfig                       |   8 ++
 drivers/i2c/busses/i2c-gpio.c                    | 112 +++++++++++++++++++++++
 4 files changed, 185 insertions(+)
 create mode 100644 Documentation/i2c/gpio-fault-injection

--vucn4uz44gd4mguf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmgR+oACgkQFA3kzBSg
KbYA7RAAjev3enPrLgza0x91peLfenfdb/fOi8XUhCfNm8bgSKDDlh9oZrQLBbU0
lN/gFprig5KLVvwm3QmGfCPsOGYNYyLtGe7Y/2GM7kHMBFhIAneQW91EXiJKtL92
8karUn/EXByfl2T4D5G56BkK+Dl7AT5clfrpb6LzyDyzsz3hH2wdOuPP9TnvhvfK
XCosxpYauZ8gKW9LNLDKagXn5xzUT28OymTrU7yYdbTudmW+2FTonB5Ie9fOm9Du
yx6fUN76d/a8fPE6XnEAJtIO9r+r9HH4iHB6UWmzWsUp3xotflnXYMdik9xZtLyO
NHFxa2ktjhnXrsbma3DoOeSEcL9Dyt2vZcf6kz3X3ssYgW5PXvArYFxQxkCd7F9b
AXkmY29HpYSZ9HpFG401oHRtcqpcJ9feoVEOc5a0/PGYTrOSidkFIL/StuRQNa1H
B5sdJ7hiFJB1GbYy/a/mTtbgth4q+dICoBPHKeJuJA3UClC+e28vo/QET7T8jR0O
cW9zxP6CKNch98wgxNLkWoD04ubF1K7uRaWbsqV3j55W2hAqmh2LiF1frrySe+/w
3XAvC/2FP6XfQ/ySSh2FnIALSW6UKFGKnudbYKF7YDH/YZvt9/y+RXPoqFXEsTG/
rYvGAwmq9AHXAnf6+kBQdSSlnBvV/G26lpkQoVv7Jdz7lAJd+xE=
=TPKn
-----END PGP SIGNATURE-----

--vucn4uz44gd4mguf--
