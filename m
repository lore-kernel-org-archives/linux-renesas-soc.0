Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:60648 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751701AbcLOKsy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Dec 2016 05:48:54 -0500
Date: Thu, 15 Dec 2016 11:42:08 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/sdhi-emmc-hs for renesas drivers
Message-ID: <20161215104204.GA1962@katana>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is a topic branch for renesas-drivers adding HS200 support to SDHI.
It is based on the tag "renesas-drivers-2016-12-06-v4.9-rc8" because the
feature is built on top of the SDR104 series by Simon which was merged
upstream just recently in the merge window. Is this okay? Or do you
prefer another branch based on v4.10-rc1 once it is available?

Kind regards,

   Wolfram


The following changes since commit 2122ab4824fda8009d20b754f80eefa66e5b4b18:

  Merge branch 'r8a7795-hdmi-out-dts-v1' of git://github.com/uli/kernel into renesas-drivers (2016-12-06 14:18:10 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-emmc-hs

for you to fetch changes up to 9f9bc225f2ada33944f95d928a9a9190b7497e33:

  arm64: dts: r8a7796: enable HS200 for eMMC (2016-12-12 14:56:02 +0100)

----------------------------------------------------------------
Wolfram Sang (9):
      mmc: sh_mobile_sdhi: simplify accessing DT data
      mmc: sh_mobile_sdhi: improve prerequisite for hw_reset
      mmc: sh_mobile_sdhi: improve prerequisites for tuning
      mmc: sh_mobile_sdhi: remove superfluous check in hw_reset
      mmc: sh_mobile_sdhi: remove superfluous check in init_tuning
      mmc: sh_mobile_sdhi: remove superfluous check in SCC error check
      mmc: sh_mobile_sdhi: enable HS200
      arm64: dts: r8a7795: enable HS200 for eMMC
      arm64: dts: r8a7796: enable HS200 for eMMC

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  1 +
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  1 +
 drivers/mmc/host/sh_mobile_sdhi.c                  | 67 ++++++++--------------
 3 files changed, 27 insertions(+), 42 deletions(-)

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYUnN8AAoJEBQN5MwUoCm2aaAP/1V7LuQdA7Dp5vgNfY/XABrL
phkuVCdVD3TO0OhxVjc5Cd0ng7fPgLuULKAsk8xKEAAnEyFlcA00BN7H+4Ew24Qn
bCCY9SzCd/1VS6FrLTKLE2ZWV6egf37VcSd1jR5GGSvu28l/QRqs5NL3gGhCFiPR
Mm2gCciPeE+H6tQJGEeEzFW10d7tTrPEk/iM+csWmU4ws90y7o4bdbOzd1HPsznB
WZa4n+iH1bGq1M2kTTcKenS+7aWBk2A9SPXvo990wG7FwRez9xdyESbbKAdZMGXO
aVo3ov3/UgRDG4a6H26SiIS83Q/ruZ5qYEPqgksPtqJ9O6aFFlNIhEq9xNxMTH2B
ieR4ygJJWD2MnRQj7LQ51aptTBslWZ4K8JYPD8zzNwA2+/cwTwtUrmyou/uOgBfj
CQ6KiiZ3AJIfxGKCzGJaMZ2L9fdGQbSYfCbl4J9r4DrGWVYGfCL4DaBcdv2KiDBt
hdUwY3ZxVkpOBOG7Jk8Hb7OU3EoWgu6p11OyY78IzIoUZJqEQ4EmSpcdDg77ibIK
9ISPknDysnGIC+EooHxP5AfCKvwT6enSC4ju+vATFJq78E8p4dWiZEpAYiTKoJ9F
/+2+2qiiNLY0GURSLs7NYpCpUE8aduzuErixayBW00IrkJb68XhT/Ek/tuXPsJJy
KE9LrJB/lDn44n5mEK4S
=AfUI
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
