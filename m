Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:35437 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752014AbdCPLL1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2017 07:11:27 -0400
Date: Thu, 16 Mar 2017 12:00:17 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/sdhi-dma-sync-v3 for renesas drivers
Message-ID: <20170316110013.kmjytn4jipo6sacj@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4z22ftpwp7zrr2g6"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--4z22ftpwp7zrr2g6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is an updated topic branch (v3 instead of v2) for renesas-drivers,
also rebased to current mmc/next. Please pull.

Kind regards,

   Wolfram


The following changes since commit 05d1ea17f58de925e46d97b305d3cacbb84a0eb6:

  Merge branch 'fixes' into next (2017-03-14 17:19:20 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-dma-sync-v3

for you to fetch changes up to 1309db3202ae35b0372f414dbc50ad6889027b5e:

  mmc: tmio: always unmap DMA before waiting for interrupt (2017-03-16 11:37:58 +0100)

----------------------------------------------------------------
Wolfram Sang (1):
      mmc: tmio: always unmap DMA before waiting for interrupt

 drivers/mmc/host/tmio_mmc_dma.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

--4z22ftpwp7zrr2g6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAljKcD0ACgkQFA3kzBSg
Kbb89w//ap/lgfDhkKPEJxq3HWAtv89DOo75BVx6icN2kXww47VFoQCOz1HZzDR/
9ujb+wRbDeoJFCe2m6m8WI6yCF5NULELYMiEChYCTsgq6BBXK7ZBRNMEJgnKq6OU
3brNrQ4yZPxhPBamyQpryr43bvakzK8kEdD5240C3KwLCg1phrQiTtgLyljt7FIO
ePi6kzThwTFjTTIvt+/Su9gk6lrvQ0QyTuhcgLWn5CJECxxMwXfYMa29TEzqEMdm
AvbRHmYkrksseY4ycVRzi0M6Jo+cgZb4Ixbnq3seV/7B3CnRDUtupPRsdXdbkv/z
ZGB+gLc33AqWMlorkUZx4o5VXNs5tPIhKOMWygDA/9PAQ1/81Qe8PAoQtITzVXQl
YXrJ8p2wN00ZifitUTCzUgHw94hrQC5Sl9/ncjy1PydV8QSdR0FWAgijgiwxn+HJ
k4UE+Ndmh9OyJPcX3LND9ekWffQsyS8HiBM7iatMEpc3jUCTg/j9iQcKs/EU7cuo
O27s//Fo5S6bIgr6+sJNRRM5oFVlt8y3R88MNuUwDXB/a2hoNvZJtghxf6/SDnzD
oF5i0WINJYKib9GJDXnvSPgT+0aSyLuXQ+WikjlC6B5mt0+raoC+bQ7qTPdmFyNi
dpum/MTeB8CXbEijUqPaxdvGjXKms8xjBV0g4OApZHU5pTOvWq4=
=JcZM
-----END PGP SIGNATURE-----

--4z22ftpwp7zrr2g6--
