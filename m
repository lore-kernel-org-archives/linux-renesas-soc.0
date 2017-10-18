Return-Path: <devicetree-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH  1/2] ARM: dts: r8a7743: Add DU support
Date: Wed, 18 Oct 2017 15:26:37 +0300
Message-ID: <2905584.Wm5DR7hli8@avalon>
In-Reply-To: <1508319227-19679-2-git-send-email-biju.das@bp.renesas.com>
References: <1508319227-19679-1-git-send-email-biju.das@bp.renesas.com> <1508319227-19679-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

Thank you for the patch.

On Wednesday, 18 October 2017 12:33:46 EEST Biju Das wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/r8a7743.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
> index 7bbba4a..fafb10e 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -1033,6 +1033,36 @@
>  			};
>  		};
> 
> +		du: display@feb00000 {
> +			compatible = "renesas,du-r8a7743";
> +			reg = <0 0xfeb00000 0 0x40000>,
> +			      <0 0xfeb90000 0 0x1c>;
> +			reg-names = "du", "lvds.0";
> +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 724>,
> +				 <&cpg CPG_MOD 723>,
> +				 <&cpg CPG_MOD 726>;
> +			clock-names = "du.0", "du.1", "lvds.0";
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					du_out_rgb: endpoint {
> +					};
> +				};
> +				port@1 {
> +					reg = <1>;
> +					du_out_lvds0: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
>  		pci0: pci@ee090000 {
>  			compatible = "renesas,pci-r8a7743",
>  				     "renesas,pci-rcar-gen2";

-- 
Regards,

Laurent Pinchart

