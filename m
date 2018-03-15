Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37772 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751731AbeCONib (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 09:38:31 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20180315133830euoutp02bb7c6433cd9d45daddf44b0adc902582~cG5clXXda1377213772euoutp02f
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Mar 2018 13:38:30 +0000 (GMT)
Subject: Re: [PATCH v4 3/3] arm64: dts: renesas: Add LVDS decoder to R-Car
 V3M Eagle
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, architt@codeaurora.org,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        robh+dt@kernel.org, mark.rutland@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <186a9adc-f5b8-cbd9-218c-5a0c48dbc9aa@samsung.com>
Date: Thu, 15 Mar 2018 14:38:22 +0100
MIME-Version: 1.0
In-Reply-To: <1521111391-3515-4-git-send-email-jacopo+renesas@jmondi.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
References: <1521111391-3515-1-git-send-email-jacopo+renesas@jmondi.org>
        <CGME20180315112823epcas5p3e8d475cddae340ce0625267f30d4b06a@epcas5p3.samsung.com>
        <1521111391-3515-4-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 15.03.2018 11:56, Jacopo Mondi wrote:
> The R-Car V3M Eagle board includes a transparent THC63LVD1024 LVDS
> decoder, connected to the on-chip LVDS encoder output on one side
> and to HDMI encoder ADV7511w on the other one.
>
> As the decoder does not need any configuration it has been so-far
> omitted from DTS. Now that a driver is available, describe it in DT
> as well.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej
> ---
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 33 +++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index c0fd144..69f43b8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -42,6 +42,33 @@
>  			};
>  		};
>  	};
> +
> +	thc63lvd1024: lvds-decoder {
> +		compatible = "thine,thc63lvd1024";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				thc63lvd1024_in_0: endpoint {
> +					remote-endpoint = <&lvds0_out>;
> +				};
> +			};
> +
> +			port@2{
> +				reg = <2>;
> +
> +				thc63lvd1024_out_2: endpoint {
> +					remote-endpoint = <&adv7511_in>;
> +				};
> +
> +			};
> +
> +		};
> +	};
>  };
>  
>  &avb {
> @@ -98,7 +125,7 @@
>  			port@0 {
>  				reg = <0>;
>  				adv7511_in: endpoint {
> -					remote-endpoint = <&lvds0_out>;
> +					remote-endpoint = <&thc63lvd1024_out_2>;
>  				};
>  			};
>  
> @@ -152,8 +179,8 @@
>  
>  	ports {
>  		port@1 {
> -			endpoint {
> -				remote-endpoint = <&adv7511_in>;
> +			lvds0_out: endpoint {
> +				remote-endpoint = <&thc63lvd1024_in_0>;
>  			};
>  		};
>  	};
