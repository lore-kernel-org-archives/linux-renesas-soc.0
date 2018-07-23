Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:50370 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388125AbeGWS5p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 14:57:45 -0400
Date: Mon, 23 Jul 2018 19:55:22 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/1] i2c: rcar: handle RXDMA HW behaviour on Gen3
Message-ID: <20180723175522.fo3bxauuwjg73vpf@ninjato>
References: <20180628204538.866-1-wsa+renesas@sang-engineering.com>
 <20180628204538.866-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4sov2msmlepi5i2j"
Content-Disposition: inline
In-Reply-To: <20180628204538.866-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--4sov2msmlepi5i2j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 10:45:38PM +0200, Wolfram Sang wrote:
> On Gen3, we can only do RXDMA once per transfer reliably. For that, we
> must reset the device, then we can have RXDMA once. This patch
> implements this. When there is no reset controller or the reset fails,
> RXDMA will be blocked completely. Otherwise, it will be disabled after
> the first RXDMA transfer. Based on a commit from the BSP by Hiromitsu
> Yamasaki, yet completely refactored to handle multiple read messages
> within one transfer.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--4sov2msmlepi5i2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltWFokACgkQFA3kzBSg
KbZS3g//Wisf5o1e68GszuECgSmZcdAxku+uEMQ1HVbQttVzZfq4ZYgf8MTssYj7
NDZJfaWwGmSOBQZD/oXdh/as/ODGk/EwdbV4i9XwhMfaIbaCZhaOntw6bPtSQTvF
Pf7TRjCrJ1zwSi6EMyOs6IhaQaUwv5PTJYU2BN1DKcDyNJTL1qLk6bXA/wWnvLcK
n4NJakX9Sxogzfpy0hishM8rfkPUAtnIZVn7KVBpJyWp5N4A8bZ/NBZdI+06lv0P
p6yRCyR3AWVCtTq9WIf+KgTDVCmGmJN7Xc2blcWt1cuuIkPd97FAhEq9mPt224tz
UaZPDA81OfJc9vYjA4qFIfXPvIuIXe10VupU8c8q9wUeT45vbWMtGQSWNtf7pAgS
3YIO/yGhxvDJ1EeoKyFSe35N7WsNQjQiFPUo/taeb2KO5FCMzpbrwuxmRBebW2y8
KAdxKgrxbrBRdTvi++7uvZKUss8bHa9WIMz7jHW8UT3WXcOqDfjaHd1/E2LHJtyB
RNPvor4jRdNDq6DBO/KrdDBDfjB1bFVA3eM92txE1QdRxw1aceTwCPv/df3UHp5U
gxQEU5TzsrgtpZ7xMEeKjpip12qbyKRRkS9eVHUAESSq6xb1WD3Qw8nfv9x1vsWv
JnPp1Rw3ptsQCeGcmoCctUrIYWYW1/FYX0XdFS1zMN6dd9ZFFzs=
=H/dr
-----END PGP SIGNATURE-----

--4sov2msmlepi5i2j--
