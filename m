Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:46722 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755289AbdESNjQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2017 09:39:16 -0400
Date: Fri, 19 May 2017 15:39:14 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/sdhi-cmd23 for renesas drivers
Message-ID: <20170519133911.dwvwxecpx52wajiu@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ytbabqdvvf2dsveb"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ytbabqdvvf2dsveb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

because Simon's DMA rework is now in mmc/next, I rebased my CMD23 topic
on top of the rework. So, you should be able to simply keep pulling the
below branch. Let me know if something goes wrong...

Kind regards,

   Wolfram


The following changes since commit 9c11a7cb3d170468bf5d666e3acad4d570e5a677:

  Merge branch 'fixes' into next (2017-05-19 10:27:22 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-cmd23

for you to fetch changes up to b59ffe4f1c18b9c9b0f055838fc9fd926a3741db:

  mmc: sdhi: add CMD23 support to R-Car Gen2 & Gen3 (2017-05-19 15:14:35 +0200)

----------------------------------------------------------------
Wolfram Sang (6):
      mmc: tmio: make tmio_mmc_request function more readable
      mmc: tmio: refactor handling mrq
      mmc: tmio: remove outdated comment
      mmc: tmio: move finish_request function further down
      mmc: tmio: add CMD23 support
      mmc: sdhi: add CMD23 support to R-Car Gen2 & Gen3

 drivers/mmc/host/renesas_sdhi_sys_dmac.c |   6 +-
 drivers/mmc/host/tmio_mmc_core.c         | 135 ++++++++++++++++++-------------
 2 files changed, 82 insertions(+), 59 deletions(-)

--ytbabqdvvf2dsveb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlke9XsACgkQFA3kzBSg
KbbHjRAAl6LPXOMX1zKWHX7jjt0sDtV7XEM5plrKrZHEpClCiKFcAZunR3Jec9sS
BLkiXeeLKN3rSauYSOjRxUBeVOSL1xEcyvkIY1w1DiBCDaukl8ABFrWnv2QoJcaE
Q6gfZJG/r0rB/08GGe83b9+QHPA68qTnRLuBmaqPf+b0pdXBusufCb5EdZECMhyz
YdG8HKwDq6bPIoq/Px4SJWD4N30AklOYwIM+UBr2bMHQyIl9v3HvSWYXrwqcejmM
Wh43EGtNJ2g8zYoFNuPOl3CgXkpjTtMLdin45GLkGdee2ZLS4SArKzige0yxrP3z
r9omW4A/ClsUL30KyrMHFBDHoM8lZj6SfgAeg0FguBk8juv2r9BBk/EbiikxM1c1
E3/z1fRGsiwyedn1yPnB54m4xHOI+BG9NVbNKnSeAmbE2ljnmhTmDnFi1AwVxNCw
iBJsGp6jar1hQNi4pu7BO6jTHyQoWt0sIUaHG3AmsKIWAM8le5P23IltaeNZ/sOa
D4kWHYtkjWbe+Hiq2Z9JxZb2aMamGcDenyXeHMxI66/CVlCUcU0y/UQQDzq2kxxQ
U03Y5u2MEWd5guA6DB9D200QvgUSvO10qkTDPtv7GbcA3Hua/iTSY/DZ6XROpnkM
n8KhJ8OxztLcRuTHdYU894hynq29SUAxiD26sO+SqDRc6KC1QLk=
=qRi6
-----END PGP SIGNATURE-----

--ytbabqdvvf2dsveb--
