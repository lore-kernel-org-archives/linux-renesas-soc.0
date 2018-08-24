Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45624 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbeHXMTc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 08:19:32 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH 1/2] arm64: dts: r8a77965: add FDP1 device nodes
Date: Fri, 24 Aug 2018 11:45:52 +0300
Message-ID: <8040588.1BRXcikCUd@avalon>
In-Reply-To: <1535086349-10657-2-git-send-email-na-hoan@jinso.co.jp>
References: <1535086349-10657-1-git-send-email-na-hoan@jinso.co.jp> <1535086349-10657-2-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Nguyen An,

Thank you for the patch.

On Friday, 24 August 2018 07:52:28 EEST Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>

You're missing a commit message. I agree that for simple patches like this one 
the subject line often contains enough information, but adding a commit 
message is still a good practice that we try to enforce through the kernel. 
For instance, looking at git history for r8a7796, you could use

"The r8a77965 has a single FDP1 instance."

> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Simon, could you update the commit message when taking this patch in your 
tree, to avoid the need for a v2 ?

> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77965.dtsi index 9c4f405..bef519f 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -1578,6 +1578,16 @@
>  			status = "disabled";
>  		};
> 
> +		fdp1@fe940000 {
> +			compatible = "renesas,fdp1";
> +			reg = <0 0xfe940000 0 0x2400>;
> +			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 119>;
> +			power-domains = <&sysc R8A77965_PD_A3VP>;
> +			resets = <&cpg 119>;
> +			renesas,fcp = <&fcpf0>;
> +		};
> +
>  		fcpf0: fcp@fe950000 {
>  			compatible = "renesas,fcpf";
>  			reg = <0 0xfe950000 0 0x200>;

-- 
Regards,

Laurent Pinchart
