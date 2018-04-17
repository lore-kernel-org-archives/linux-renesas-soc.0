Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:55408 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751927AbeDQKHH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 06:07:07 -0400
Date: Tue, 17 Apr 2018 12:07:05 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masaru Nagai <masaru.nagai.vx@renesas.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Subject: Re: [PATCH/RFC net-next 1/5] ravb: fix inconsistent lock state at
 enabling tx timestamp
Message-ID: <20180417100705.qd57z42h7ajxu24i@ninjato>
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
 <20180417085030.32650-2-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yff3gqv4othrmggo"
Content-Disposition: inline
In-Reply-To: <20180417085030.32650-2-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--yff3gqv4othrmggo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 17, 2018 at 10:50:26AM +0200, Simon Horman wrote:
> From: Masaru Nagai <masaru.nagai.vx@renesas.com>
>=20
> [   58.490829] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   58.495205] [ INFO: inconsistent lock state ]
> [   58.499583] 4.9.0-yocto-standard-00007-g2ef7caf #57 Not tainted
> [   58.505529] ---------------------------------
> [   58.509904] inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
> [   58.515939] swapper/0/0 [HC1[1]:SC1[1]:HE0:SE0] takes:
> [   58.521099]  (&(&list->lock)->rlock#2){?.-...}, at: [<ffff00000899f474=
>] skb_queue_tail+0x2c/0x68
> {HARDIRQ-ON-W} state was registered at:

Maybe add a short text to the log to describe the approach of this fix?


--yff3gqv4othrmggo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrVx0kACgkQFA3kzBSg
KbYbrA/+PWFm+eCVvYN+gC2MRWpUtt4Y255QlIkVcSy+YqYIwYKDiB4FeRAOGtwb
Z0kGpuIJxgRTYnyutwD9/0ql+ZZdMOJXshmYxDxw2afSbz5272oxqsQn4GjO3rb2
OvgWxtEU4OrwMv5wB0BFzQd0VRkXc9CVnycrdBsGCho79v6QwgO83789zl2hyDa8
JMSfBW4MpjwIisTvA0H+3zsk4fTerYc6DZMNN6XhvU76Wl193rHt7CBrP/CFR/lj
1qTue0gCLTh9ZdxaFba/YA+a4JFWIDZzY8pRDOlTEBh3xH0UhTYUGQ3SSrZgcpoN
GWTBPUfMogMeWJ0D0+f2rJW+OxFlaJbpMsZusBzhLjUTNK0gCgkyXW/pN7O5FHyH
jlP0vzdvKz1qqoz/NAjs78WvobxryyrzkTD5ct+4WEmFGGw5XPGE2Qzetg9bFF7u
xmHu/tdCCOg5ALHRqgqww9TY3sezfdfCXCgJYt+n4lDomJJHI/ycfw9/wmOFcSJG
u/w9ltbp8JOmmFbygYvvg5be7n3ClL2rP0ANUq/ODCYL4E0qtL3BACwFhTUPl2Yt
QO/qvjiG3FG1R5rVygNlxainZS1VHONBRXJrbIR9E9TJdzI0hKR/X7E5jOzRr5uM
R9hAAIgi8F7efdaCaDKHy/UoRFaiQCDdhw+60wm1+m3TQ9CmZew=
=Dq76
-----END PGP SIGNATURE-----

--yff3gqv4othrmggo--
