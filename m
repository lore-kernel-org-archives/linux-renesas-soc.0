Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41056 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbeJ2XlW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 19:41:22 -0400
Date: Mon, 29 Oct 2018 15:52:20 +0100
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 03/03] arm64: dts: renesas: r8a77990: Connect R-Car E3
 AVB to IPMMU
Message-ID: <20181029145220.rmbv2j7ann454fxs@verge.net.au>
References: <154014207424.4344.6894320987219157257.sendpatchset@octo>
 <154014210372.4344.14651283156002646732.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <154014210372.4344.14651283156002646732.sendpatchset@octo>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 22, 2018 at 02:15:03AM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm@opensource.se>
> 
> Hook up the R-Car E3 AVB device to IPMMU-DS0 16 as described in
> the data sheet.
> 
> Signed-off-by: Magnus Damm <damm@opensource.se>

Tested-by: Simon Horman <horms+renesas@verge.net.au>

I will apply this for v4.21.

> ---
> 
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- 0001/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ work/arch/arm64/boot/dts/renesas/r8a77990.dtsi	2018-10-22 01:48:50.488496607 +0900
> @@ -604,6 +604,7 @@
>  			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
>  			resets = <&cpg 812>;
>  			phy-mode = "rgmii";
> +			iommus = <&ipmmu_ds0 16>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			status = "disabled";
> 
