Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41183 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753137AbcKELgf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 5 Nov 2016 07:36:35 -0400
Date: Sat, 5 Nov 2016 12:36:28 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org, magnus.damm@gmail.com
Subject: Re: [PATCH v2 0/5] r8a7796 I2C integration
Message-ID: <20161105113628.GB1581@katana>
References: <1477491249-2976-1-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline
In-Reply-To: <1477491249-2976-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This revision is based on renesas-devel-20161024-v4.9-rc2.  It adds the
> Reviewed-bys and the entries for SYS-DMAC2 in the applicable I2C nodes.  I
> have also made sure it works with 64-bit memory enabled.

Tested the whole series with I2C2 and I2C4 (manually activated) with DMA
and without. Dumping memory, changing some registers, scanning the bus -
all seems to work.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYHcQ8AAoJEBQN5MwUoCm2E8UP/1dPrRJdOZ9viCvBVIIVB/TK
m99R6f7rd6PCNOxv6WStk3YYG70NcOvje21wK3GfIN9B/G8Uu/hAkehn7xeP56d0
H3qbp4x9nYzDeaLNQY8dRG3zC9YP9OM6K6Diu/nUXR5bmbMsuh1EbMsGIwB0zzGH
iVrDpFOfDMLO9oCdnGQDV2Px88IkxIv47ilMs8gBQJP/aHd0qBVSl0ni2EFmD6wl
PvpNl7cKfMs1gUVjEzVtm3FGGBzA1Rbb10xZdlGbGvFpj6HsWODDqbQ95xHLrMxw
/N9rTYy2cBCvWJEHN+dLqdZhX/z7A9H83FtqTCDgr9RzUgCGTLsYQIZT1WEQsJfV
CLXzE+hBRbG4L5L/M41n0GTAgPqusCBpZwEumauPIf4xlEK85c3oNLo9wjzg2OXT
K3NSD3lrioat7wVuqmkxYX8ksBLwV5G56r752+4z6prRYVzB2WOH/NJth70a+R/Z
NkYKX6T59editjexaoKVWHfzTJIZfd28v8yAL0gw7XTxpbjVu4wnw0WPcSAyICr1
gREi48PRDDi4I2KmE//ovsr72MwPYd4n3LpxwGZ8gyG+xIoy/TCAGDXIuek7BCQq
zSUIyFmrh+p/aKi5hmohdta5Fk37bHhoFCe50EyeISMnbkzP/rzJOb9TadE6d9n5
PhGhBd0mVABFK0EANqyT
=BxGa
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
