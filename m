Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:55715 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbeHELFj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Aug 2018 07:05:39 -0400
Date: Sun, 5 Aug 2018 11:01:36 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: Re: [PATCH 14/14] arm64: dts: renesas: r8a77965: ulcb-kf: Initial
 device tree
Message-ID: <20180805090136.GD9285@w540>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-15-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="TybLhxa8M7aNoW+V"
Content-Disposition: inline
In-Reply-To: <20180804231114.21420-15-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--TybLhxa8M7aNoW+V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Eugeniu,

On Sun, Aug 05, 2018 at 01:11:14AM +0200, Eugeniu Rosca wrote:
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>  arch/arm64/boot/dts/renesas/Makefile             |  1 +
>  arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index ad7be9a8ca56..3e2c5be65a14 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -9,6 +9,7 @@ dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-ulcb-kf.dtb
>  dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-xs.dtb
>  dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb r8a77965-salvator-xs.dtb
>  dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb
> +dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb-kf.dtb
>  dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
>  dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb r8a77980-v3hsk.dtb
>  dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
> new file mode 100644
> index 000000000000..5c719fb87d8b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the M3-N ULCB Kingfisher board
> + *
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + * Copyright (C) 2018 Cogent Embedded, Inc.
> + *
> + * This file is licensed under the terms of the GNU General Public License
> + * version 2.  This program is licensed "as is" without any warranty of any
> + * kind, whether express or implied.
> + */

Drop the license text please :)

Thanks
  j
> +
> +#include "r8a77965-ulcb.dts"
> +#include "ulcb-kf.dtsi"
> +
> +/ {
> +	model = "Renesas ULCB Kingfisher board based on r8a77965";
> +	compatible = "shimafuji,kingfisher", "renesas,ulcb",
> +		     "renesas,r8a77965";
> +};
> --
> 2.18.0
>

--TybLhxa8M7aNoW+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbZrzwAAoJEHI0Bo8WoVY8jm8QAJ20oq2+dwwYfuwnKUHJQr+X
8s8DGOfXKSoWA12HPjlW7Nw/mzfYbfuK3ba3obOgdJeeRCV6xCb0f8CE3vVpy2FE
rfE+BahUNKRNqwJ0jPT5zJa82AjBEPce4ZW/cohSoLSXBuC/7ZVtuRO6oXpi+I1n
L1N6HQTIMLPhwc7B6A1FVxVdkWR6ns006bbpHB0iShZ4RHiLmRjaQgJjcgqwJ1pf
uIPMSE2kwYeyEX6h4Z0LQM3FNpMRbbEzoPm9wqw0untXVO+cI04B4Sc+RYzghMk3
BJwOhI1epf9Um3GSGSVdvplMQSrgDIDACkr/e5zrBQFIhKTR8EefSOX1uKQcN/+g
cVARIhgnZdHuoIF4kGwEdXg8WpVfpPAxCcR96QIxYRlZgnhbM+PRgoRQgAJrN6wa
iG24L2lSa5tAniJbxS2uObY6IgCsf1IXlK6kb3PAWLbpYFDmx0/KMpYqLywNju0G
o9hIF3dp/D4oomULK580Eu31gTdYRj92gWMEELFMm5XUSXes7tJzTrdjfP8VJthj
Pn/z7kG+jLE7bZXh+DQt0M02YIUMFRjR7PEdKbwpBSG0UQ5ikH+xooFrMl04BB6B
uWJknogVm5q4up5wpuf8P2rQbBbRUz5SvU9/KIlQhPt853H9d3XzESmyUYXdxVB/
uklV1losys5XbeJ+rXiZ
=c+VO
-----END PGP SIGNATURE-----

--TybLhxa8M7aNoW+V--
