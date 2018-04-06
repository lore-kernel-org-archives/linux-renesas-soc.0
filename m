Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35089 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752775AbeDFNvM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Apr 2018 09:51:12 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 7/7] arm64: dts: renesas: eagle: Add ADV7511W and HDMI output
Date: Fri, 06 Apr 2018 16:51:11 +0300
Message-ID: <2235860.8H9ojNphtF@avalon>
In-Reply-To: <1523020092-25540-8-git-send-email-jacopo+renesas@jmondi.org>
References: <1523020092-25540-1-git-send-email-jacopo+renesas@jmondi.org> <1523020092-25540-8-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Friday, 6 April 2018 16:08:12 EEST Jacopo Mondi wrote:
> From: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> Enable HDMI output adding the HDMI connector and the ADV7511W, connected
> to THC63LVD1024 LVDS decoder output.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 51 ++++++++++++++++++++=
++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts index 9d0e65d..e9f7b83
> 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -32,6 +32,17 @@
>  		reg =3D <0x0 0x48000000 0x0 0x38000000>;
>  	};
>=20
> +	hdmi-out {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con_out: endpoint {
> +				remote-endpoint =3D <&adv7511_out>;
> +			};
> +		};
> +	};
> +
>  	thc63lvd1024: lvds-decoder {
>  		compatible =3D "thine,thc63lvd1024";
>=20
> @@ -41,11 +52,17 @@
>=20
>  			port@0 {
>  				reg =3D <0>;
> -

This is unrelated, if you don't want a blank line here remove it from patch=
=20
6/7 :-)

>  				thc63lvd1024_in: endpoint {
>  					remote-endpoint =3D <&lvds0_out>;
>  				};
>  			};
> +
> +			port@2 {
> +				reg =3D <2>;
> +				thc63lvd1024_out: endpoint {
> +					remote-endpoint =3D <&adv7511_in>;
> +				};
> +			};
>  		};
>  	};
>  };
> @@ -85,6 +102,38 @@
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  	};
> +
> +	hdmi@39 {
> +		compatible =3D "adi,adv7511w";
> +		reg =3D <0x39>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <20 IRQ_TYPE_LEVEL_LOW>;
> +
> +		adi,input-depth =3D <8>;
> +		adi,input-colorspace =3D "rgb";
> +		adi,input-clock =3D "1x";
> +		adi,input-style =3D <1>;
> +		adi,input-justification =3D "evenly";
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +				adv7511_in: endpoint {
> +					remote-endpoint =3D <&thc63lvd1024_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
> +				adv7511_out: endpoint {
> +					remote-endpoint =3D <&hdmi_con_out>;
> +				};
> +			};
> +		};
> +	};
>  };
>=20
>  &pfc {

With patches 5/7, 6/7 and 7/7 merged together and the pinmux removed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

=2D-=20
Regards,

Laurent Pinchart
