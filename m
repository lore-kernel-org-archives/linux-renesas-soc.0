Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:46642 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933134AbeAOMan (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 07:30:43 -0500
Received: by mail-lf0-f67.google.com with SMTP id q194so1686767lfe.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2018 04:30:42 -0800 (PST)
Subject: Re: [PATCH v2 06/12] ARM: dts: r8a7790: Convert to new LVDS DT
 bindings
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112231430.26943-7-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f4e4f645-8ae5-e871-834c-e275cc43eb84@cogentembedded.com>
Date: Mon, 15 Jan 2018 15:30:39 +0300
MIME-Version: 1.0
In-Reply-To: <20180112231430.26943-7-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 01/13/2018 02:14 AM, Laurent Pinchart wrote:

> The internal LVDS encoder now has DT bindings separate from the DU. Port
> the device tree over to the new model.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
[...]
> diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
> index 62baabd757b6..0fcd5e34ef82 100644
> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi
[...]
> @@ -1092,11 +1088,61 @@
>   			port@1 {
>   				reg = <1>;
>   				du_out_lvds0: endpoint {
> +					remote-endpoint = <&lvds0_in>;
>   				};
>   			};
>   			port@2 {
>   				reg = <2>;
>   				du_out_lvds1: endpoint {
> +					remote-endpoint = <&lvds1_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	lvds0: lvds@feb90000 {
> +		compatible = "renesas,lvds-r8a7790";

    Same question...

> +		reg = <0 0xfeb90000 0 0x1c>;
> +		clocks = <&cpg CPG_MOD 726>;
> +		status = "disabled";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				lvds0_in: endpoint {
> +					remote-endpoint = <&du_out_lvds0>;
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +				lvds0_out: endpoint {
> +				};
> +			};
> +		};
> +	};
> +
> +	lvds1: lvds@feb94000 {
> +		compatible = "renesas,lvds-r8a7790";

    Same question here as well...

MBR, Sergei
