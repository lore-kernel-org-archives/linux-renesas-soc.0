Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:34026 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754620AbdHVHgV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 03:36:21 -0400
Date: Tue, 22 Aug 2017 09:36:19 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: Status of r8a7795 SDHI support?
Message-ID: <20170822073619.GB1451@katana>
References: <fd4fb97d-9284-f2fa-5719-e28e6cc2fe20@de.bosch.com>
 <20170818090042.z3jx6rufxuc56m2t@ninjato>
 <32eb505f-b622-2562-e6d0-818c6bbab32a@de.bosch.com>
 <20170821081808.7teztwh4hbz25zjq@ninjato>
 <977e03d5-f59d-b41e-9135-fc6dfc19482d@de.bosch.com>
 <06bc290a-8173-3d41-ff1e-8c26b4d4c093@de.bosch.com>
 <20170821134722.GA5226@katana>
 <fc4e436e-9b6c-d39a-2061-aeaa1a249cc4@de.bosch.com>
 <20170822065644.GA1451@katana>
 <770993ca-9bd5-4af3-6a76-69db6f2a0a0f@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline
In-Reply-To: <770993ca-9bd5-4af3-6a76-69db6f2a0a0f@de.bosch.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Btw, whats about HS400 support for the eMMC? As the eMMC is often the 'mass
> storage' device for the rootfs, the eMMC performance will have a direct
> influence to the overall system performance.

Sure, I know. We finally have Gen3 SDHI DMA upstream and SDR104 seems to
be stable as well (we are still testing corner cases, though). HS400
would obviously be next.


--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmb3u8ACgkQFA3kzBSg
Kbbo9g/+MvUnpnv337Lj27MM8tjOri1oQEZA07FkIlOyuLBCtVCpDUiB7IJIlYxn
yvxUo8oRUhkUrHaG8ynXchS//kAMllvUxEKa+IMsXlJz/TJCUMEMfhCeGCv41ehu
xZgZIrj9gSv5v7dDRhfMyMosuRLLakdKGzT7WEeHbhx1TI3+3HycYVJq+SfbW9Pw
vIjCbRlsIAtdFBgaL3Fppk+sQiJWdHX8FByMDqMyNqxSixjXAkeOTmQnNtl5Cat9
HmjDIOoJHTPBkPbUvC6KWJ/cFZ/HBvxvh7aPTSC8LkRedNsA3yPkb68rponGZda8
O1/N9qrWVBLJ6z0We9Q/zwaTTfYglYGmjXN9lHPN+Tgf5AmipFsG1m6P9/iwwaV7
+t7WgsvpHqr2oqAHFb1mhz5dyP3D2JYt9F3qEy1sx188kGWIa/nzI+NUKDcrpIzd
qezn5Za1Oz1TfZZol78ZXAwDoqxJ98Gwj5k+MbfoD2E/PFZCEW0OJJz4oeL5ckin
O32ACHnc5VlASWByRytZDc9WFSPqCbbq+K515flfdQVVtfjQUIE0Eoq/AO46+2Ze
qBHt1nrrfLF0wwC2oKRHCH8XMlGsvbHY7u70LwoNpG6RgXbdmkguWzz/IoSLrEHC
k5DJrDARaiDF7/Wb28OV3HnKag+DWW+5CDarcbScEgzCHxwUGBw=
=Dak9
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
