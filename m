Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33666 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727197AbeLJOH6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 09:07:58 -0500
Date: Mon, 10 Dec 2018 15:07:56 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Avri Altman <avri.altman@wdc.com>,
        Chris Ball <chris@printf.net>
Subject: Re: [PATCH mmc-utils] use proper type for RPMB blocks_cnt
Message-ID: <20181210140756.r4m4ymmgppyyhrvj@ninjato>
References: <20181130125447.32218-1-wsa+renesas@sang-engineering.com>
 <20181210121908.tf5o3fxdzapk3ele@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="euzuuijhqfqy7acy"
Content-Disposition: inline
In-Reply-To: <20181210121908.tf5o3fxdzapk3ele@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--euzuuijhqfqy7acy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 10, 2018 at 01:19:08PM +0100, Simon Horman wrote:
> On Fri, Nov 30, 2018 at 01:54:47PM +0100, Wolfram Sang wrote:
> > The JEDEC standard is confusing. The number of max blocks for reading
> > RPMB is determined by CMD23 which can hold an unsigned int and not only
> > u16. It is true that the current maximum is 64K of blocks, yet this may
> > be extended in the future. Let's not apply a limit here which should be
> > checked by the card.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> I am a little confused. What is the width of an unsigned int?
> If 4 bytes, would using uint32_t make this clearer?

Nope, because in struct mmc_ioc_cmd (used for the ioctl), the 'blocks'
variable which this value ultimately ends up in, is also unsigned int.


--euzuuijhqfqy7acy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwOczwACgkQFA3kzBSg
KbYPThAAjuv29u+yyRiRHYk59UhsyOfb+spsrmt3ncDbaKgV5XTa+BaJH5cNvTxs
HkWDz7HrgQVLMiOYfQGLOnT4RCO6sGnz4SHFsqwdbnjMT4WpywR0UQ8yuQzWdLj4
pRQGW1ctI7TUuR2PDLbCNCh9I2v+hmMfMLYl0Tl8MWxMKKovScLSV7rgISFQpDFN
FFCpxCNs0Xvax3pNXZEQfJieA7akLHOkV5AdGfl5qzF2zpxkggbofoDm7aEtokl9
Au9G205AW4H9oOUYjCwuhfv4RFywYfrSyLJZGkqqSKuciONNiaKpYmzb5RiITay/
RlGl/6m9DfwPnqLohwrIotqSCYwbAh1CBWwsBH7AUZOqK4AfBdhtFesxFiQK7sGv
7Sqjyk02PLhC8Ir4S9kgs4ylpvAuB/Hxj9FbVBos9Phy1Oq1Cfi1z4fLx+A/sGDt
TIJbdADzhiuD1YheFcCGEzHP0go10fceHj6ZHN9EqY6QHwubDgDS6YKARGaI3b/P
PYRg4kiInLWo40ump0/w/qcvNUWE7gL9dSO3zJduqluGPovIG95CzzFHzx+4q1Bd
6k8NYLHQZeg8cKMdhESBskqJVWr+aWkGos2oRUnb3rxNfSuXBuh3OXr4e3brJOm8
+hbVNVd+EEWNyI0/o5CXxbCYCLowHVJWVJRc7o+rAT+IEdBoBJo=
=RYsG
-----END PGP SIGNATURE-----

--euzuuijhqfqy7acy--
