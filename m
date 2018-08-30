Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:52732 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726419AbeH3Nud (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 09:50:33 -0400
Date: Thu, 30 Aug 2018 11:49:12 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: set scatter/gather max
 segment size
Message-ID: <20180830094911.wm4vqw5mrnrxhjda@ninjato>
References: <20180829222548.24399-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dpnr26o7zomhwhes"
Content-Disposition: inline
In-Reply-To: <20180829222548.24399-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--dpnr26o7zomhwhes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Niklas,

> +	if (!dev->dma_parms) {
> +		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);

Can't we use devm_kzalloc and skip the custom remove function?

Thanks,

   Wolfram

--dpnr26o7zomhwhes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluHvZcACgkQFA3kzBSg
KbZRlQ/7BhZvMCOLBQEMwrfC4rv40YLuLXPiAWVvMfhYCvnPP9vRbos5J6IPkgBR
wYCueoPwtTzEtbidKSIvh4okaJjjhzUZVIyAEezD5fPs8KT38ygE6BjHzkQiLEKA
BBG50ZP3gJrgjXqd5q3zREOtbXWO63UifQyHVmFc3HkPDeGh20luwFr1KNp6PHFA
gI4aWo5Fihgiummdlv43uCEnaBnFOzCRtmnALX2eJ2mwB0tqAWRbHXwDC4wGml+E
ysbblf/sR3OcuCcnTULfB3A29HGmHIL5poL2rdP3uXw77F9W1lNYX+eurXuCh+A3
yHHZ9TQpdExLmchaIQgwn6gkYhf3YyggizYuUivIR0tNZHcW6sRbbPu3ucmpDAfH
eAouWXmRNDymKKqkDh2CLNPhjPp/MjfkffD5NGTDbxlICM9+8OhnTCaMQ6v7obHp
UVeugFGgAwpIS+enAX9eMM5n1fPBXJebt5geNvjRfOa83l+PePeBbYSEcblQ9w9Q
+jrb3YmBaMJYtcCYCOMNgmOCkwQd2NDLeQUKFJvyHABiPMn1a07b4aFCrxp7+n0f
0MkTrhEK8r8bxhEnETF1/yBjKmjvq4ytJHmNK2VwygYj1UcXGfAlMLayWLenfg0E
QseFYomh0afWKTKEpG6ycgMZFv491WKLrXE/dwrUF2nVggOJN08=
=/LBy
-----END PGP SIGNATURE-----

--dpnr26o7zomhwhes--
