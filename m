Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53260 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728552AbeH3P0w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 11:26:52 -0400
Date: Thu, 30 Aug 2018 13:25:10 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: set scatter/gather max
 segment size
Message-ID: <20180830112510.22cnusrzonnoexw6@ninjato>
References: <20180829222548.24399-1-niklas.soderlund+renesas@ragnatech.se>
 <20180830094911.wm4vqw5mrnrxhjda@ninjato>
 <20180830111610.GF28374@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n44ob5gqwshqwtsk"
Content-Disposition: inline
In-Reply-To: <20180830111610.GF28374@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--n44ob5gqwshqwtsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> We could do that but then we can't reset the struct device dma_parms=20
> member to NULL.

I think it is fine to skip this. From the device_add docs:

 * Do not call this routine or device_register() more than once for
 * any device structure.  The driver model core is not designed to work
 * with devices that get unregistered and then spring back to life.
 * (Among other things, it's very hard to guarantee that all references
 * to the previous incarnation of @dev have been dropped.)  Allocate
 * and register a fresh new struct device instead.

I also don't see any other dma_params user doing this (which is only an
indication, not a proof).


--n44ob5gqwshqwtsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluH1BIACgkQFA3kzBSg
KbYHeA//YJANoJ+FA8RuhvoyVxEwm3RvJl69Rg6RShC3jqDJQD5UC3wpogS3iC0K
q25R4eoasUQZssw98QrC5mOPkFMfpAaZfSrLOou11Esg8EYJELZPf79npwwgb/GV
Ldzzp6yCv4WrQKeZwywLom7I2ZxKjk+cuPLoQOmj3b10nhHctzCkp6wwyHfoGad2
eb13gB0huKspm4AfReYcfCpKV2NPK5xFfk3Gwb3nvnln/FGLomD8dIfNI68X0/jb
Bn6uitojGUJH6wTlBDUnIAUpvxRgJfov0DREhYXzcBb/PKtjLvorTCoa412dF64/
hVUqWj4L30bk6y7qR8OST8hl52fsKaB11v+wMllRKEYTtDzXVNaNMl+yqdrtbMXv
WRPWOs95/7ADbBG2XcsNAh2gclPFjhUnao0nhD5AktYsEXZAOUegpbYRrJkS4JB/
eNHBf3NPx2R4/c7tj4YSdyAJIpbaW9Ao0+wztOEP8WRaRvliocEzJDbHA06sAQt6
UdAbu6v04OplTpU217WpM4JDi6FZikMOKBgCSGXgAXHUCe2r/jKd3roU2hpdNgMt
E9D7PGY0Kq2VOC0jVhTSnvlaFyXHEdMS4jntvxe4D9E8qFC+VKNK8mK4hbqP/zpC
D51sR6DdrOLFJLFIGrRsXBXVgV+3BnkzitUqV/gXYGwlBtw/xk0=
=nMbI
-----END PGP SIGNATURE-----

--n44ob5gqwshqwtsk--
