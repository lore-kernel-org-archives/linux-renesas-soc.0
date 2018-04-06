Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34948 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754035AbeDFN2T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Apr 2018 09:28:19 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 1/7] arm64: dts: renesas: r8a77970: add FCPVD support
Date: Fri, 06 Apr 2018 16:28:17 +0300
Message-ID: <22085242.zeaVs0iFPW@avalon>
In-Reply-To: <1523020092-25540-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1523020092-25540-1-git-send-email-jacopo+renesas@jmondi.org> <1523020092-25540-2-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Friday, 6 April 2018 16:08:06 EEST Jacopo Mondi wrote:
> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>=20
> Describe FCPVD0 in the R8A77970 device tree; it will be used by VSPD0 in
> the next patch...
>=20
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns@hitachi.com>.
>=20
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77970.dtsi index e8358d9..71f466d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -617,6 +617,14 @@
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
>  		};
> +
> +		fcpvd0: fcp@fea27000 {
> +			compatible =3D "renesas,fcpv";
> +			reg =3D <0 0xfea27000 0 0x200>;
> +			clocks =3D <&cpg CPG_MOD 603>;
> +			power-domains =3D <&sysc R8A77970_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 603>;
> +		};
>  	};
>=20
>  	timer {


=2D-=20
Regards,

Laurent Pinchart
