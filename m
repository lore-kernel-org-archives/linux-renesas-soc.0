Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:30453 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933600AbdKPJHb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2017 04:07:31 -0500
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "horms@verge.net.au" <horms@verge.net.au>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>
Subject: RE: [PATCH 2/3] arm64: dts: r8a7795: add DMA for SCIF2
Date: Thu, 16 Nov 2017 09:07:26 +0000
Message-ID: <TY1PR06MB0702DF2777513BC2E4E75C75B72E0@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <1510759510-30295-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1510759510-30295-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1510759510-30295-3-git-send-email-ulrich.hecht+renesas@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Ulrich,

> From: linux-renesas-soc-owner@vger.kernel.org [mailto:linux-renesas-soc-
> owner@vger.kernel.org] On Behalf Of Ulrich Hecht
> Sent: 15 November 2017 15:25
>=20
> Tested on Draak.

I guess you meant for the patch title to use r8a77995?

Kind regards, Chris


>=20
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 04a392a..5fa7572 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -393,6 +393,8 @@
>  				 <&cpg CPG_CORE R8A77995_CLK_S3D1C>,
>  				 <&scif_clk>;
>  			clock-names =3D "fck", "brg_int", "scif_clk";
> +			dmas =3D <&dmac1 0x13>, <&dmac1 0x12>;
> +			dma-names =3D "tx", "rx";
>  			power-domains =3D <&sysc
> R8A77995_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 310>;
>  			status =3D "disabled";
> --
> 2.7.4
