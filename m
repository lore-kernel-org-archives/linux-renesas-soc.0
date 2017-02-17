Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:42967 "EHLO pokefinder.org"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S934211AbdBQSZl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2017 13:25:41 -0500
Date: Fri, 17 Feb 2017 19:25:33 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/sdhi-dma-sync-v2 for renesas drivers
Message-ID: <20170217182516.n45yom44bosgb57j@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="truxekrak72yzuul"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--truxekrak72yzuul
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

since Ulf thinks this patch is a good idea, please pull this updated
branch (debug removed) into renesas/drivers. The branch is based on
mmc/next as of today.

Kind regards,

   Wolfram


The following changes since commit 8c7cdbf9272c300dc093da3c62fa3b4bc6dc960e:

  mmc: core: add mmc prefix for blk_fixups (2017-02-15 11:34:27 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-dma-sync-v2

for you to fetch changes up to f4af9bf51003a285e58a272e27e551658bab1b28:

  mmc: host: tmio: ensure end of DMA and SD access are in sync (2017-02-17 18:43:28 +0100)

----------------------------------------------------------------
Wolfram Sang (1):
      mmc: host: tmio: ensure end of DMA and SD access are in sync

 drivers/mmc/host/tmio_mmc.h     |  2 +-
 drivers/mmc/host/tmio_mmc_dma.c | 58 ++++++++++++++++++++++++-----------------
 drivers/mmc/host/tmio_mmc_pio.c |  4 +--
 3 files changed, 37 insertions(+), 27 deletions(-)

--truxekrak72yzuul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlinP/oACgkQFA3kzBSg
KbYOTw/+IzAfRQioEJWMRMzHt+y/yz5p2hPzYAoqp2xRn4Cl7PZK+tHErvyw6bAz
gWD6vagDubxeEnCUV8rP7PtnGhHPW3uLAuRSvIUsIxCTc6LI8xxnV1/cnj/rDfUR
Cy/yCOqhJhes5pAfV/WIuvkAZCzUcwwM3h+B1jUlpdE2qtWg8idJJ7vUsnNcEBvf
jRfpc+wTmpNBtF78dGO1RUuFxq+n9mtY7JrtYBvKJ41vMQ4y7O2R9HhLyPlUO8Sc
gIisA1FlBvFiCArvoqwUhexn+JTRGH+ErsOLsJQhCDO9Ldz8YBJxoW+Y2YfnzrdM
w3XWMIj+0BoJaddOSP3tZhQA1BhvpHcIQUOR7Pw/HKKCKT2ZHv2Jg7LK+inPlxg/
4w35zxyUAdGoxvYq0TMv0EVtbirAFb/Iq2BbmQdWVweu/gKlUYOqmObBEzs2k7mG
FJUFbYwteqkPzzJXCNP016f/2Vwy9caCz7O8uKP34RHvxwld0F/Uo/f8ybe3q4X9
7V0+Jm+B9WshK+KMwYla6qCGrHmIcUV+f0yQWRyh3vqSHdQJS9Z4Q2Ro4JGM4uRc
wXsDr+d8bVxpC8r4UulyXvZBONrzSBti1aI6uAY+y1qzTG3y45boAicExvuiEpp2
ZEr3mWBg0Kd8j2EX6/S8sTNoyZ6xqtaFHwYHC05+q9Am9ZNibms=
=qUqP
-----END PGP SIGNATURE-----

--truxekrak72yzuul--
