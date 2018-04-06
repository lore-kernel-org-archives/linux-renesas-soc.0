Return-Path: <devicetree-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 4/7] arm64: dts: renesas: r8a77970: add the LVDS instance
Date: Fri, 06 Apr 2018 16:38:17 +0300
Message-ID: <3587638.6pi5kZKTO5@avalon>
In-Reply-To: <1523020092-25540-5-git-send-email-jacopo+renesas@jmondi.org>
References: <1523020092-25540-1-git-send-email-jacopo+renesas@jmondi.org> <1523020092-25540-5-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Friday, 6 April 2018 16:08:09 EEST Jacopo Mondi wrote:
> From: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> Add the LVDS device to r8a77970.dtsi in a disabled state. Also connect
> the it to the LVDS output of the DU. While at it align the endpoint name
> of the du to du_out_lvds0 which is used in other Renesas DTS files to
> describe this link.

The endpoint could be renamed in patch 3/7, but it's not a big deal.

> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 29 +++++++++++++++++++++++++=
++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77970.dtsi index e649e86..b48d62c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -658,7 +658,34 @@
>=20
>  				port@1 {
>  					reg =3D <1>;
> -					du_out_lvds: endpoint {
> +					du_out_lvds0: endpoint {
> +						remote-endpoint =3D <&lvds0_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds0: lvds@feb90000 {
> +			compatible =3D "renesas,r8a77970-lvds";
> +			reg =3D <0 0xfeb90000 0 0x14>;
> +			clocks =3D <&cpg CPG_MOD 727>;
> +			power-domains =3D <&sysc R8A77970_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 727>;
> +			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +					lvds0_in: endpoint {
> +						remote-endpoint =3D <&du_out_lvds0>;
> +					};
> +				};
> +				port@1 {
> +					reg =3D <1>;
> +					lvds0_out: endpoint {
>  					};
>  				};
>  			};

=2D-=20
Regards,

Laurent Pinchart



