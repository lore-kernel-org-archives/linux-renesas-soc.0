Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:40272 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbeHTOFi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 10:05:38 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <uli+renesas@fpond.eu>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PROTO][PATCH 07/10] arm64: dts: r8a77995-draak: set external clock for DU
Date: Mon, 20 Aug 2018 13:51:25 +0300
Message-ID: <11044309.AFJYkQDyTF@avalon>
In-Reply-To: <1534254604-24204-8-git-send-email-uli+renesas@fpond.eu>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu> <1534254604-24204-8-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

Thank you for the patch.

On Tuesday, 14 August 2018 16:50:01 EEST Ulrich Hecht wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts index a8e8f26..bd5c6fa
> 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -2,7 +2,7 @@
>  /*
>   * Device Tree Source for the Draak board
>   *
> - * Copyright (C) 2016 Renesas Electronics Corp.
> + * Copyright (C) 2016-2018 Renesas Electronics Corp.
>   * Copyright (C) 2017 Glider bvba
>   */
> 
> @@ -269,8 +269,10 @@
> 
>  	clocks = <&cpg CPG_MOD 724>,
>  		 <&cpg CPG_MOD 723>,
> -		 <&x12_clk>;
> -	clock-names = "du.0", "du.1", "dclkin.0";
> +		 <&x12_clk>,
> +		 <&extal_clk>;
> +	clock-names = "du.0", "du.1",
> +		      "dclkin.0", "extal";

This should be moved to the LVDS encoder DT node.

>  	ports {
>  		port@0 {

-- 
Regards,

Laurent Pinchart
