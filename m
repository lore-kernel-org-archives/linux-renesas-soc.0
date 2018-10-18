Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33068 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727596AbeJRTRu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Oct 2018 15:17:50 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r8a77965: Add LVDS support
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20181018004149.29448-1-laurent.pinchart+renesas@ideasonboard.com>
 <20181018004149.29448-4-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <1e5ca6fb-8d60-066f-c39a-ddaa24844211@ideasonboard.com>
Date: Thu, 18 Oct 2018 12:17:14 +0100
MIME-Version: 1.0
In-Reply-To: <20181018004149.29448-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On 18/10/18 01:41, Laurent Pinchart wrote:
> The M3-N (r8a77965) platform has oneLVDS encoder connected to the DU.

s/oneLVDS/one LVDS/

> Add the corresponding DT node and wire it up.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

With the title fixed,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 27 +++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index 83946ca2eba5..b984b85dc066 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -2153,6 +2153,33 @@
>  				port@2 {
>  					reg = <2>;
>  					du_out_lvds0: endpoint {
> +						remote-endpoint = <&lvds0_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds0: lvds@feb90000 {
> +			compatible = "renesas,r8a77965-lvds";
> +			reg = <0 0xfeb90000 0 0x14>;
> +			clocks = <&cpg CPG_MOD 727>;
> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
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
> +				port@1 {
> +					reg = <1>;
> +					lvds0_out: endpoint {
>  					};
>  				};
>  			};
> 
