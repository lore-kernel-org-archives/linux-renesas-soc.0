Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:45804 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751723AbeBWJwD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Feb 2018 04:52:03 -0500
Received: by mail-lf0-f66.google.com with SMTP id x196so11517611lfd.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2018 01:52:02 -0800 (PST)
Subject: Re: [PATCH v4 11/16] ARM: dts: r8a7791: Convert to new LVDS DT
 bindings
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180220231046.32638-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180220231046.32638-12-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <29b21328-c718-91a5-fc49-5034715f5539@cogentembedded.com>
Date: Fri, 23 Feb 2018 12:51:59 +0300
MIME-Version: 1.0
In-Reply-To: <20180220231046.32638-12-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2/21/2018 2:10 AM, Laurent Pinchart wrote:

> The internal LVDS encoder now has DT bindings separate from the DU. Port
> the device tree over to the new model.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

[...]
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index 008a260f86a5..8660f8a329c7 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
[...]
> @@ -1126,6 +1123,33 @@
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

    I suggest that we use the label "lvds" w/o #, compatible with the manual...

[...]

MBR, Sergei
