Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41152 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751908AbdEOM3f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 08:29:35 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: r8a7795: salvator-x: Move HDMI0 to common Salvator-X board support
Date: Mon, 15 May 2017 15:29:39 +0300
Message-ID: <11510386.Oacl68du7i@avalon>
In-Reply-To: <1494850964-7246-3-git-send-email-geert+renesas@glider.be>
References: <1494850964-7246-1-git-send-email-geert+renesas@glider.be> <1494850964-7246-3-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Monday 15 May 2017 14:22:44 Geert Uytterhoeven wrote:
> The extensions to the first HDMI device and connector nodes apply to
> Salvator-X boards equipped with either an R-Car H3 or M3-W SoC.
> Hence move them from the R-Car H3 specific board file to the common
> Salvator-X board file.
> 
> The second HDMI device and connector nodes are left as-is, as R-Car M3-W
> has only one HDMI output.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I wonder whether this is really worth it, given that the number of HDMI ports 
is different between the two boards. I actually had similar patches in my tree 
and then decided to drop them, as I found that splitting the H3 Salvator-X 
HDMI ports salvator-x.dtsi and r8a7795-salvator-x.dts was getting pretty 
confusing.

> ---
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 17 -----------------
>  arch/arm64/boot/dts/renesas/salvator-x.dtsi        | 17 +++++++++++++++++
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts index
> fcd9ca73f2c76768..22e5324e7ada0eea 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> @@ -58,23 +58,6 @@
>  	status = "okay";
>  };
> 
> -&hdmi0 {
> -	status = "okay";
> -
> -	ports {
> -		port@1 {
> -			reg = <1>;
> -			rcar_dw_hdmi0_out: endpoint {
> -				remote-endpoint = <&hdmi0_con>;
> -			};
> -		};
> -	};
> -};
> -
> -&hdmi0_con {
> -	remote-endpoint = <&rcar_dw_hdmi0_out>;
> -};
> -
>  &hdmi1 {
>  	status = "okay";
> 
> diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> b/arch/arm64/boot/dts/renesas/salvator-x.dtsi index
> 5f0d4bdcd3b44aae..1f6b9fbb13af1ebf 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> @@ -294,6 +294,23 @@
>  	clock-frequency = <32768>;
>  };
> 
> +&hdmi0 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +			rcar_dw_hdmi0_out: endpoint {
> +				remote-endpoint = <&hdmi0_con>;
> +			};
> +		};
> +	};
> +};
> +
> +&hdmi0_con {
> +	remote-endpoint = <&rcar_dw_hdmi0_out>;
> +};
> +
>  &hsusb {
>  	status = "okay";
>  };

-- 
Regards,

Laurent Pinchart
