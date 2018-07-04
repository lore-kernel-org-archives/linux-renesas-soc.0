Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57472 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933664AbeGDMZB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 08:25:01 -0400
Date: Wed, 4 Jul 2018 14:24:59 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: renesas_sdhi: mapping sg segment longer than device claims to
 support
Message-ID: <20180704122459.p5yqu2olgznkeqtx@ninjato>
References: <CAMuHMdWR0KuVyXu-Gg1JGNUu7xS1rT9Rg9siGXAjDGBm+O6G=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ihubqrq4eehdvvd4"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWR0KuVyXu-Gg1JGNUu7xS1rT9Rg9siGXAjDGBm+O6G=w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ihubqrq4eehdvvd4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2018 at 02:40:33PM +0200, Geert Uytterhoeven wrote:

> Hi all,
>=20
> With the new CONFIG_DMA_API_DEBUG_SG option enabled, I get the following
> warning (actual value of len varies) during boot on various R-Car Gen3
> platforms:
>=20
>  renesas_sdhi_internal_dmac ee140000.sd: DMA-API: mapping sg segment
> longer than device claims to support [len=3D98304] [max=3D65536]

Looks like our internal DMA engine needs to use this new thing:

dma_get_max_seg_size()

which means we need a 'struct device_dma_parameters' somewhere.

Yet, I wonder why the sys-dmac part of Gen2 doesn't trigger this? I
don't see the R-Car DMAC driver setting such a struct? Am I missing
something?

Regards,

   Wolfram


--ihubqrq4eehdvvd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAls8vJcACgkQFA3kzBSg
Kba1Jg//ekzEMgidf2pQ5shdOGlDJ+i8QMWGkbaKqZmbY+AaFowq1Ps0yM44L9kY
lzTZYBuOeVglF7ol97Zj+T9hGUg0QReQP+Zqch3na3ldPrYNbuaTj4mpUGJ+3ZIH
nlRzwAi7A20G6Eh7wkGVTqcWZ2ortztNkqp/km0jAzWjmpirLDxtNdPCiJJAW/th
IP7bRurLtr36l5L7Q57Ppb6s0/HraU6aYxe6pBY3XO87NsqOKwgqMfBG4cEb7gIf
KH8omWCixtptK+LhSGO4ZdsvrUURLO1K5ZNzWo8akXBSJnr0l04nSsRwyAYAlCSy
StJg1nE5P+CoDzRBpV9r5u0aBvh6n2noZ6I9iaOCe4lohZKzKLw1/qVMAcvi8yur
1PVqZKIkmXtOCslyfI2NdEgFuDLzjg/TEZKpp2prAH0D9TfwaB79N/QM/7/B4QfA
qZ/o2WxrHT9Ug+zOdj9UWVJf0djByKULJnyKRwCnNSYUiYJ4ptB20bO0xcxlq8/D
6FpjsoI/m+gw8yBbIOzQlsP5demht3l0lQVDWDhUjZyVKp1wLPCs8Yl9YpbpD7DJ
6iU2vk08Ok5DiAu0CocLPJqUez5FvTZjeX7TUazvWI6JEV6JrcB3HfzLYikVT96D
DiSIfa9wCl9AcFHRj1EiMNSW0xBrRRhR+5rforXchKVgrqUNhe8=
=Jgxe
-----END PGP SIGNATURE-----

--ihubqrq4eehdvvd4--
