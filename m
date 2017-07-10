Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52346 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753991AbdGJNJN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2017 09:09:13 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: renesas: ulcb: Add HDMI output connector
Date: Mon, 10 Jul 2017 16:09:14 +0300
Message-ID: <2531734.5WngiEmILA@avalon>
In-Reply-To: <1499395056-14375-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com> <1499395056-14375-1-git-send-email-vladimir.barinov@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vladimir,

Thank you for the patch.

On Friday 07 Jul 2017 05:37:36 Vladimir Barinov wrote:
> From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
> 
> The ULCB board has one HDMI output connector.
> 
> This connector is available on both the H3 and M3-W ULCB boards.
> Add this to the ulcb.dtsi file.
> 
> Signed-off-by: Vladimir Barinov
> <vladimir.barinov+renesas@cogentembedded.com> ---
>  arch/arm64/boot/dts/renesas/ulcb.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> b/arch/arm64/boot/dts/renesas/ulcb.dtsi index 6f0a7ca..fc5408d 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> @@ -34,6 +34,17 @@
>  		clock-frequency = <11289600>;
>  	};
> 
> +	hdmi0-out {
> +		compatible = "hdmi-connector";
> +		label = "HDMI0 OUT";

As far as I know there is no "HDMI0 OUT" label on the board or casing. You can 
remove the label property. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		type = "a";
> +
> +		port {
> +			hdmi0_con: endpoint {
> +			};
> +		};
> +	};
> +
>  	keyboard {
>  		compatible = "gpio-keys";

-- 
Regards,

Laurent Pinchart
