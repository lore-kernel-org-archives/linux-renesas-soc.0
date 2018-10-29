Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41045 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbeJ2XlM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 19:41:12 -0400
Date: Mon, 29 Oct 2018 15:52:10 +0100
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/03] arm64: dts: renesas: r8a77965: Connect R-Car M3-N
 AVB to IPMMU
Message-ID: <20181029145210.gcelchankttgqoxb@verge.net.au>
References: <154014207424.4344.6894320987219157257.sendpatchset@octo>
 <154014208447.4344.743576721786725309.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <154014208447.4344.743576721786725309.sendpatchset@octo>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 22, 2018 at 02:14:44AM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm@opensource.se>
> 
> Hook up the R-Car M3-N AVB device to IPMMU-DS0 16 as described in
> the data sheet.
> 
> Signed-off-by: Magnus Damm <damm@opensource.se>

Tested-by: Simon Horman <horms+renesas@verge.net.au>

I will apply this for v4.21.


> ---
> 
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- 0001/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ work/arch/arm64/boot/dts/renesas/r8a77965.dtsi	2018-10-22 01:46:02.498689171 +0900
> @@ -900,6 +900,7 @@
>  			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
>  			resets = <&cpg 812>;
>  			phy-mode = "rgmii";
> +			iommus = <&ipmmu_ds0 16>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			status = "disabled";
> 
