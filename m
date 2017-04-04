Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39419 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753723AbdDDKFD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2017 06:05:03 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: koelsch: Correct clock frequency of X2 DU clock input
Date: Tue, 04 Apr 2017 13:05:47 +0300
Message-ID: <2246751.IOz92zzvZ6@avalon>
In-Reply-To: <1491213319-7668-1-git-send-email-geert+renesas@glider.be>
References: <1491213319-7668-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Monday 03 Apr 2017 11:55:19 Geert Uytterhoeven wrote:
> The X2 crystal oscillator on the Koelsch development board provides a
> 74.25 MHz clock, not a 148.5 MHz clock.
> 
> Fixes: cd21cb46e14aae3a ("ARM: shmobile: koelsch: Add DU external pixel
> clocks to DT") Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Confirmed by schematics, user manual, and physical inspection of 2
> Koelsch instances (my scope has not enough bandwidth to measure the
> actual frequency).

Stupid question, have you tested the corresponding (HDMI) DU output ? If so,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Probably this was copied from r8a7790-lager.dts, as Lager does have two
> identical crystal oscillators X2 and X13.
> 
> Note that X2 is socketed, so it can be changed.
> ---
>  arch/arm/boot/dts/r8a7791-koelsch.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts
> b/arch/arm/boot/dts/r8a7791-koelsch.dts index
> 59beb8402a36007b..001e6116c47c7c3b 100644
> --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
> @@ -292,7 +292,7 @@
>  	x2_clk: x2-clock {
>  		compatible = "fixed-clock";
>  		#clock-cells = <0>;
> -		clock-frequency = <148500000>;
> +		clock-frequency = <74250000>;
>  	};
> 
>  	x13_clk: x13-clock {

-- 
Regards,

Laurent Pinchart
