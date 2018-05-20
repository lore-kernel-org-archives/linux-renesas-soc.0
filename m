Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33104 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750800AbeETIu2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 May 2018 04:50:28 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r8a77995: Add LVDS support
Date: Sun, 20 May 2018 11:50:50 +0300
Message-ID: <3087943.gJsCFVCJnt@avalon>
In-Reply-To: <1526386840-15368-4-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1526386840-15368-4-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

Thank you for the patch.

On Tuesday, 15 May 2018 15:20:38 EEST Ulrich Hecht wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The r8a77995 D3 platform has 2 LVDS channels connected to the DU.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> [uli: moved lvds* into the soc node, added PM domains, resets]
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 56 ++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77995.dtsi index ba98865..8e78110d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -757,12 +757,68 @@
>  				port@1 {
>  					reg = <1>;
>  					du_out_lvds0: endpoint {
> +						remote-endpoint = <&lvds0_in>;
>  					};
>  				};
> 
>  				port@2 {
>  					reg = <2>;
>  					du_out_lvds1: endpoint {
> +						remote-endpoint = <&lvds1_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds0: lvds-encoder@feb90000 {
> +			compatible = "renesas,r8a77995-lvds";
> +			reg = <0 0xfeb90000 0 0x20>;
> +			clocks = <&cpg CPG_MOD 727>;
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets = <&cpg 727>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					lvds0_in: endpoint {
> +						remote-endpoint = <&du_out_lvds0>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					lvds0_out: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds1: lvds-encoder@feb90100 {
> +			compatible = "renesas,r8a77995-lvds";
> +			reg = <0 0xfeb90100 0 0x20>;
> +			clocks = <&cpg CPG_MOD 727>;
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets = <&cpg 727>;

While there seems to be a single clock for both LVDS encoders, it appears that 
two separate reset lines are used.

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Given that the LVDS encoder driver isn't functional yet I wouldn't rule out a 
need to update the LVDS DT bindings in order to properly support D3. I don't 
mind if this patch gets merged already (provided the reset problem gets fixed 
of course), as long as it won't be considered a blocker for DT bindings 
rework. Otherwise I'd prefer delaying upstreaming until the whole series can 
be tested.

> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					lvds1_in: endpoint {
> +						remote-endpoint = <&du_out_lvds1>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					lvds1_out: endpoint {
>  					};
>  				};
>  			};

-- 
Regards,

Laurent Pinchart
