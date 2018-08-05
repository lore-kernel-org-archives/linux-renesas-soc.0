Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:37751 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbeHELEV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Aug 2018 07:04:21 -0400
Date: Sun, 5 Aug 2018 11:00:17 +0200
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
Subject: Re: [PATCH 10/14] arm64: dts: renesas: r8a77965: ulcb: Initial
 device tree
Message-ID: <20180805090017.GC9285@w540>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-11-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Content-Disposition: inline
In-Reply-To: <20180804231114.21420-11-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Engeniu,

On Sun, Aug 05, 2018 at 01:11:10AM +0200, Eugeniu Rosca wrote:
> Allow the bare M3-N-based ULCB board to boot.
>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  1 +
>  arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 5debb02fad2c..ad7be9a8ca56 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-ulcb.dtb
>  dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-ulcb-kf.dtb
>  dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-xs.dtb
>  dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb r8a77965-salvator-xs.dtb
> +dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb
>  dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
>  dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb r8a77980-v3hsk.dtb
>  dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts
> new file mode 100644
> index 000000000000..4dde14738fb0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the M3-N ULCB (R-Car Starter Kit Pro) board
> + *
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + * Copyright (C) 2018 Cogent Embedded, Inc.
> + *
> + * This file is licensed under the terms of the GNU General Public License
> + * version 2.  This program is licensed "as is" without any warranty of any
> + * kind, whether express or implied.
> + */

With SPDX identifier you can drop the license text from the patch

> +
> +/dts-v1/;
> +#include "r8a77965.dtsi"
> +#include "ulcb.dtsi"
> +
> +/ {
> +	model = "Renesas ULCB board based on r8a77965";
> +	compatible = "renesas,ulcb", "renesas,r8a77965";
> +
> +	memory@48000000 {
> +		device_type = "memory";
> +		/* first 128MB is reserved for secure area. */
> +		reg = <0x0 0x48000000 0x0 0x78000000>;
> +	};
> +};
I failed to find schematics for this board but comparing this with the M3-N
revision of Salvator-X, this seems correct to me.
> +
> +&du {
> +	clocks = <&cpg CPG_MOD 724>,
> +		 <&cpg CPG_MOD 723>,
> +		 <&cpg CPG_MOD 721>,
> +		 <&versaclock5 1>,
> +		 <&versaclock5 3>,
> +		 <&versaclock5 2>;
> +	clock-names = "du.0", "du.1", "du.3",
> +		      "dclkin.0", "dclkin.1", "dclkin.3";
> +};
Ditto.

With the license things fixed,
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j
> --
> 2.18.0
>

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbZryhAAoJEHI0Bo8WoVY8cTgP/iDhdNq3pxalZqvVsb8H/hkm
CjRVbbhNbnL1K14D4cn2YTq0ABnjW0yPS5pWV89bojIHt8jTdoLbaq7hBYKY9q6M
0cFCpwGsFsTUhiuQEMOjnYfh5mFUdJDLHlWA4WLyHRNIc0MMwxE7ZWnT1szRlKyx
BfAGsx0GOZz9WH5tnIg/6vCEMAEYX7rkEho0BS2J0a84XuETcVIm1iZpu3GvO4zM
ucyj2UixDDXXf1hHJ/hXHmUgCZ1rkqnIN5mtCdSnrQBfvWGz1MvrfrPhcN6o1K8n
UwSw6olOMuk3DQWD+PiOU9G1XxjuobUUOIguNInFQpIrrtNx7P9o8wh+EX39bY65
tm4w9Bd5OzmpufLKl58uNwAN7nWgH3b6wFCX9Hr+uDRzAbFwmQt+4oZvtoZRa7EW
2qfEDE95RQyfkp1XvQ5vrPbBw3Drciiwy+0pPCJCJatit5LEEoTPJ0xV3IEn1Toc
BQIV1DYJxxEYSD6JnE7S3duo5PVkD7Bt+UN1xsIxMDX9y7OeZO02+MZoJPznOHFC
cYdsMy221y/gjyoQS2/CFKvxiz3qf0Z/vKx9lue9Pjj0HUjTVcditEW58gKg77eF
SlDEeAqi9RnpqZa+MoY+8QLqX3julvgYQXBEzqhpKsW+zNFjvAnSCovv4TuryVRC
TPZQPc+kJMKte2AjoCVl
=W+Dy
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--
