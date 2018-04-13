Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:36486 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752920AbeDMIfv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 04:35:51 -0400
Date: Fri, 13 Apr 2018 10:35:48 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
Subject: Re: [PATCH 1/5] mmc: renesas_sdhi_internal_dmac: limit DMA RX for
 old SoCs
Message-ID: <20180413083548.3655nepuqdjbjulk@katana>
References: <20180410093831.1759-1-wsa+renesas@sang-engineering.com>
 <20180410093831.1759-2-wsa+renesas@sang-engineering.com>
 <20180411071416.ohzwyhifviuoq7wo@verge.net.au>
 <20180412112142.mnxzv2hsggwbuta5@katana>
 <20180413081444.ai6eyujitcx2us5s@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bq3gkkgdzfgjpqqr"
Content-Disposition: inline
In-Reply-To: <20180413081444.ai6eyujitcx2us5s@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--bq3gkkgdzfgjpqqr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> As the implementation stands it is global - only one DMA RX stream may
> be in flight for the entire system. I am wondering if that is the right
> granularity for the restriction. Perhaps it could be per-SDHI device,
> allowing concurrent streams on different SDHI devices.

As we have only one DMA RX channel per device, there is no other
concurrency than the global concurrency.


--bq3gkkgdzfgjpqqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrQa9oACgkQFA3kzBSg
KbZw5xAAhlpQCmxXSmEkyw9ePvj6PgQ7djzfMMFAXMeEDo5jBfgaWGwk+cKZncnt
R1mFk0zkq+WMgKqzr8VeBShI/qyO+gcDjOMXmQz0B7gaIYn6rctCzkgX0EzBpuX9
Ueqjh7HEciBXr6oN2kcCjm9HX32bAcE0yI5mx4r4gGEGtImS9W+8jL8FEaDecZeg
3m+Xt1Y0YlZQSXpliAqxgj/NH0wGlp8t8Py2iTUWe9yfi7yuFNswzcYmpsjmJ4sk
vGE8RqxPZvG7QMtLdDkvTo51gn0G/MS3nQbvaXsTyceG5poEIG3/g6kUdtMgJ949
HPRlU2IkiBHG2+Y95RyBqh50EBm3Hc0TB8AlgChSNmxjfPUY5pz9046RSKF4Y4/Z
oJk3j7RA678VxHDaNaIcIn7YLgbrSxGdX5oTJ0DkqvxrReta9A/kuukWV53dyu0E
A3BSJTUQhcsGDUqlBKXmt+QMRW5HX+QZq91nXNchy0hqfFki2lafwJb/HlGaWL8z
HvjkO5KRQdGI6M5oeOE9VY+O+1G16p14aL/3xwpCtwzTJo15gL6c3bnhQ8dxhhOc
m75Y6rqSxC2r2ak+PU+8itXgvJ1guHhfhIXksW6tOiQCIXcNchpc74P8zfdnJlpk
3MnPCohKVh4NiYL6k0CZW6vYhgJZX/Ieu7bC9m3DILUl8D9yqRg=
=PXH2
-----END PGP SIGNATURE-----

--bq3gkkgdzfgjpqqr--
