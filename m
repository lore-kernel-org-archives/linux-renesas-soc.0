Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33143 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751242AbdH3KKZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 06:10:25 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: r8a7795: Drop bogus HDMI node names suffixes
Date: Wed, 30 Aug 2017 13:10:58 +0300
Message-ID: <3276171.anaVMsVBRO@avalon>
In-Reply-To: <1504087397-6211-1-git-send-email-geert+renesas@glider.be>
References: <1504087397-6211-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Wednesday, 30 August 2017 13:03:17 EEST Geert Uytterhoeven wrote:
> Node names should not use numerical suffixes if the nodes can be
> distinguished by unit-address.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> b/arch/arm64/boot/dts/renesas/r8a7795.dtsi index
> 8b4dbce860001224..e1ced54d11322cb4 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -2702,7 +2702,7 @@
>  			renesas,fcp = <&fcpf1>;
>  		};
> 
> -		hdmi0: hdmi0@fead0000 {
> +		hdmi0: hdmi@fead0000 {
>  			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
>  			reg = <0 0xfead0000 0 0x10000>;
>  			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
> @@ -2727,7 +2727,7 @@
>  			};
>  		};
> 
> -		hdmi1: hdmi1@feae0000 {
> +		hdmi1: hdmi@feae0000 {
>  			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
>  			reg = <0 0xfeae0000 0 0x10000>;
>  			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;


-- 
Regards,

Laurent Pinchart
