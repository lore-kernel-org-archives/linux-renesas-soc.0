Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:50521 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752907AbeCTLH5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 07:07:57 -0400
Date: Tue, 20 Mar 2018 12:07:55 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-devel@nongnu.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] nvram: at24c: prevent segfault by checking
 "rom-size"
Message-ID: <20180320110754.ndtt7h432hna26pz@ninjato>
References: <20180319213101.6100-1-wsa+renesas@sang-engineering.com>
 <20180319213101.6100-2-wsa+renesas@sang-engineering.com>
 <3005cdd5-f3c4-a0c0-f6db-abc2b7bf759a@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wuwvp23ufiaqwga7"
Content-Disposition: inline
In-Reply-To: <3005cdd5-f3c4-a0c0-f6db-abc2b7bf759a@amsat.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--wuwvp23ufiaqwga7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +    if (!ee->rsize) {
> > +        ERR("rom-size not allowed to be 0\n");
>=20
> You can directly use error_report() in this patch.

My reasoning was that this patch is suitable for stable while the
error_report() stuff is not. I neither wanted to mix those two here nor
did I want to make the stable-patch depend on the non-stable patch. So,
I chose to use ERR here and fix all of ERR later. OK?


--wuwvp23ufiaqwga7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqw64cACgkQFA3kzBSg
KbaUzA//Q7PUUNgoVQ2hnaIPo8kCc5AkIfWek2tUFLGYQaK+3a6v2YhrAj3NnfpP
pZ3mH1LuX6WzIQ+0jK9Hx+Dl1rfBZ+TzBufuHRvifRkXL7I3RN5sMMk3ZKqldeHk
aTY+qms11p5vj5lOncXeI3u1MrpO/nQYixfEe807B7Q2a7M20DZF1MUzyPpDM2Ke
GVHt9xXv1CNcM6CsuKVezkFzKsy3iJgyLHWd8DVRF2ZWUR3ac/1STkAcGgmEM0Vv
nSoVwnDM0gN8KyoyUJ1n4qP2M/m4xfaVLFEMw51F9cUfLZOvW1/4zrxsUiseeGTF
SQ1FmWSwIDh+B5yRB8cclPK4AeaEb/rTCj5ZJ5WdYvWmMHIbebcLlMi278BOMBht
HRVwu9j4XV7AtTuETZxtC66+HKCmJiRj+06PthgpqyDqLt7LFVDLtVSZR0LBaRCe
N+96942fd3BYyVSPl5X71EHeSoVZLLF4rGbiRjDATCLjl8LQrGmtP8jgGQopnn0G
0/G10yEcsghvrWxCFCQeyhI2Y3ZqmCACLrJRdgsYaBEYW05eEB2OI8aKnrlV9zrY
PTF6c8mv5L2BhyazIURdi6ZpyuI79sjlm+eVmRL8oAjrs/6xtvMgmrB7O1PAXSSp
KdtBV5+65N1CC/MXA/EyXaFBLZC9fIVHxRh7GdG+jq9m59K2+uo=
=Y7Jl
-----END PGP SIGNATURE-----

--wuwvp23ufiaqwga7--
