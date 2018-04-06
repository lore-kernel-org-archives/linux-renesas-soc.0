Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34962 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755538AbeDFNdX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Apr 2018 09:33:23 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 2/7] arm64: dts: renesas: r8a77970: add VSPD support
Date: Fri, 06 Apr 2018 16:33:21 +0300
Message-ID: <3172265.bfWcyC1uqx@avalon>
In-Reply-To: <1523020092-25540-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1523020092-25540-1-git-send-email-jacopo+renesas@jmondi.org> <1523020092-25540-3-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Friday, 6 April 2018 16:08:07 EEST Jacopo Mondi wrote:
> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>=20
> Describe VSPD0 in the R8A77970 device tree; it will be used by DU in
> the next patch...
>=20
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns@hitachi.com>.
>=20
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77970.dtsi index 71f466d..db06c94 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -625,6 +625,16 @@
>  			power-domains =3D <&sysc R8A77970_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 603>;
>  		};
> +
> +		vspd0: vsp@fea20000 {
> +			compatible =3D "renesas,vsp2";
> +			reg =3D <0 0xfea20000 0 0x4000>;

You need to extend the memory region to include the V6_CLUTn_TBL* registers=
=2E I=20
would recommend simply extending it to 0x8000 as all other VSP instances, e=
ven=20
if the registers at 0x7000-0x7fff are not implemented.

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			interrupts =3D <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 623>;
> +			power-domains =3D <&sysc R8A77970_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 623>;
> +			renesas,fcp =3D <&fcpvd0>;
> +		};
>  	};
>=20
>  	timer {

=2D-=20
Regards,

Laurent Pinchart
