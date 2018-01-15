Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:42480 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753741AbeAOM1y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 07:27:54 -0500
Received: by mail-lf0-f68.google.com with SMTP id q17so2952291lfa.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2018 04:27:53 -0800 (PST)
Subject: Re: [PATCH v2 07/12] ARM: dts: r8a7791: Convert to new LVDS DT
 bindings
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112231430.26943-8-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5d1f2d1a-b3dd-c795-bb50-5da19ca924a9@cogentembedded.com>
Date: Mon, 15 Jan 2018 15:27:50 +0300
MIME-Version: 1.0
In-Reply-To: <20180112231430.26943-8-laurent.pinchart+renesas@ideasonboard.com>
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
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index 67831d0405f3..b7fceb210de9 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
[...]
> @@ -1126,6 +1123,31 @@
>   			port@1 {
>   				reg = <1>;
>   				du_out_lvds0: endpoint {
> +					remote-endpoint = <&lvds0_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	lvds0: lvds@feb90000 {
> +		compatible = "renesas,lvds-r8a7791";

   Haven't we settled on <soc> going 1st, after the comma?

[...]

MBR, Sergei
