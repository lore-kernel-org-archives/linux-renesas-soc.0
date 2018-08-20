Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60682 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbeHTULz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 16:11:55 -0400
Date: Mon, 20 Aug 2018 18:55:29 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: tmio_mmc_core: don't claim spurious interrupts
Message-ID: <20180820165528.nuf3rmckuu7d4zqs@ninjato>
References: <f2295f99-2354-a2ad-5013-0501ecb0d3a1@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uvmq54rzifx6jyaz"
Content-Disposition: inline
In-Reply-To: <f2295f99-2354-a2ad-5013-0501ecb0d3a1@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--uvmq54rzifx6jyaz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2018 at 02:41:02PM +0300, Sergei Shtylyov wrote:
> I have encountered an interrupt storm  during the eMMC chip probing (and
> the chip finally didn't get detected). It  turned out  that U-Boot  left
> the DMAC interrupts enabled while the  Linux driver didn't use those.
> The SDHI driver's interrupt handler somehow  assumes that, even if a
> SDIO interrupt didn't happen, it should return IRQ_HANDLED. I think that
> if none of the enabled interrupts happened and got handled, we should
> return IRQ_NONE -- that  way the kernel IRQ code recoginizes a spurious
> interrupt and masks  it  off pretty quickly...
>=20
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Can be argued. Should come after Yamada-san's patches, I'd think. BTW
Sergei, did you test with SDIO devices?


--uvmq54rzifx6jyaz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt68oAACgkQFA3kzBSg
KbaqAhAAlLVL7O676PV0bGpyDfv88PGb3HfHn1SNmYsT/vhk6+3KX9nz87jX7shN
xkjcrvrDhsqAOHgqq9smxoLHv+gZLvwF4nj+BQ/Iv4Brg1KrfshQDj+K3H3RyZai
1iE2ot/cN//LEbvCenNuPjWRjGN0eL29FYrUUjC8bmEBk9KOTX3qkoUDgjixuhSo
wVreEClYhIVqosG8IdwhLLY/NSHMDKJI/5LBWgHvxVWjNGGgexgMbbPtLcsQicK3
Z6r+b/GZqv/2GK+XqoiEn+T2oA9tzQnDAsnRM2Lhkqcc4XOACQdfuCNb80BFiNpH
dXU/7OwCGSJZ8sY9BNEr/O9QqN2dXB7jrowzojybesFWR2ypnVbT7M+EcTPILm/y
I4XVE1CZFcPvffsqJwqvr4YflqvXNibKR22w/AdQvRXhrZd1IptXGnEEpH0se+0W
mwa+XiFqI04L7JMUZuoFlcV39/IgWTSH490S0Z1vz+fZxGeFpF1pwWROGKCUdE9r
uKdvTPHmhGoq8fwOZx+Rc9Elkl9UlIjf9eukgM4/NHh+mOj6ZYx9Nen/1w6PTwsu
eGOQgTWU3vjq/wgCqNKvBSHMKOZRAy5vt3Q3Yt+LuajXh2nMP6N5Bd4NdB6EoCIO
AtQTumd39V5gHL4JDB0V9kYYFDJd4JiKjubtxS4/j+CF3LSpv0Y=
=MEjg
-----END PGP SIGNATURE-----

--uvmq54rzifx6jyaz--
