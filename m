Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:48658 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730074AbeKWKQj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 05:16:39 -0500
Date: Fri, 23 Nov 2018 00:34:52 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Avri Altman <Avri.Altman@wdc.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH 1/3] mmc: core: validate user input for RPMB block
 count
Message-ID: <20181122233452.GA991@kunai>
References: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
 <20181120230832.1840-2-wsa+renesas@sang-engineering.com>
 <SN6PR04MB49251A94A2BF6E60D12919E1FCDB0@SN6PR04MB4925.namprd04.prod.outlook.com>
 <20181122140510.GA1070@kunai>
 <SN6PR04MB49253CEB654E5FE5C69992A1FCDB0@SN6PR04MB4925.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <SN6PR04MB49253CEB654E5FE5C69992A1FCDB0@SN6PR04MB4925.namprd04.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This might explain why the community people hate JEDEC guys so much.

:D

Okay, this u16 problem of block count exists in mmc-tools, too.

And I'd like to resend this series with a comment added to explain the
situation. Because the specs seem to be easy to get wrong here.

>  So this line in mmc_set_blockcount performs an unnecessary input validation.

Even wrong input validation, as I understand it.

> > So you suggest dropping this patch and keep the others, did I get this
> > right? Would be fine with me.
> Yes. Thanks.

Good, let's do this then.


--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlv3PRgACgkQFA3kzBSg
KbYaSA//T47Th2NCBKDxciIKSIRVUH8aHUCDfUThHzNgxtnoDopv8SlahdKTpMeh
2lZlnFKreaONyUpIkJPHfiG48iYt3yxpzOk1bUNQjMRp6XB0/xh4cOjtjDISwrbB
jaiJ2cDUjF927Dd8ZVPqN4jlXWKQHSjWTHowHZyGvRLxT/cPcORaHYEKLV/hwbmx
U54vnO2dCBynykKIbEoXvoi5C9gfGGHod0fdi5xlEae3eP08CVEzdiinZfQGgeoZ
q7VZuNud8GEcew/WIACYMiLrHcJvKiX4HjZ+W+OF0qMLA43VS7ybcAhzIwepVeiY
47aCW/36W0moKEFx09HlZa2riUn9vSmm47W7+nHcmxyvfTKJ5jBOrAnvhe1cHUZL
3KohEaxduXYoTcQcSzrAlNvjpyWpHdUnpXWlF27Z8NTp/NMyHajnOo9XR/YOotEs
UhLihrX7wPEvlN9wjWzUZQnKHB1yALvDQ9+amEFUzeNjZM6u7M5x55ybF7VYlgT5
zqdu6FMNjvmKv/uKwlO98nAAwAtFyjZIFJRQiX5IheJLEjBuriQB4pBeUGGGZKfr
L6ESwlAyKBOpAmQBqdeMlDTl0JVUxLmIoi5rtYhrowOlAThBi4KpQE3pW35A8pym
aJ50fbAr+Z48L+Kk5cgNB5WHNV4Y/nk3vlStoIR5309oIP2U9II=
=oGaA
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
