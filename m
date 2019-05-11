Return-Path: <SRS0=cdtB=TL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078A7C04AB1
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 11 May 2019 18:26:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C841E2173B
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 11 May 2019 18:26:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="udkL1xsJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbfEKS0H (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 11 May 2019 14:26:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57086 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfEKS0H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 14:26:07 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE234D5;
        Sat, 11 May 2019 20:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557599165;
        bh=NxadZbkqzAKGy4BPYF+TvcPGBvoKsYhKC6QFd40ZyO0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=udkL1xsJlXkbuuli5/asp/JL49B0fBEdP9c+gkBR3r100lf9TaqLY3yDU3pw6+a/6
         DUsv7shrctTRoVcIYwCGzrvyMXKBFyymRLZ1S6izuLlThx0qWWe83v+casaDhunx+W
         vNgSE6MAKsWMZziK/T0XSb/7Ur8v6h8Rq8mq0vEA=
Date:   Sat, 11 May 2019 21:25:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [RFC 9/9] arm64: dts: renesas: r8a7796: Add CMM units
Message-ID: <20190511182549.GG13043@pendragon.ideasonboard.com>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
 <20190508173428.22054-10-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190508173428.22054-10-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, May 08, 2019 at 07:34:28PM +0200, Jacopo Mondi wrote:
> Add CMM units to Renesas R-Car M3-W device tree and reference them from
> the Display Unit they are connected to.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index cdf784899cf8..b81c4711dce3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -2503,6 +2503,30 @@
>  			renesas,fcp = <&fcpf0>;
>  		};
>  
> +		cmm0: cmm@fea40000 {
> +			compatible = "renesas,cmm";
> +			reg = <0 0xfea40000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 711>;
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 711>;
> +		};
> +
> +		cmm1: cmm@fea50000 {
> +			compatible = "renesas,cmm";
> +			reg = <0 0xfea50000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 710>;
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 710>;
> +		};
> +
> +		cmm2: cmm@fea60000 {
> +			compatible = "renesas,cmm";
> +			reg = <0 0xfea60000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 709>;
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 709>;
> +		};
> +

This looks good to me.

>  		fcpf0: fcp@fe950000 {
>  			compatible = "renesas,fcpf";
>  			reg = <0 0xfe950000 0 0x200>;
> @@ -2763,6 +2787,7 @@
>  			status = "disabled";
>  
>  			vsps = <&vspd0 &vspd1 &vspd2>;
> +			cmms = <&cmm0 0 &cmm1 1 &cmm2 2>;

Apart from the indices that I don't think are needed this looks good to
me too,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  			ports {
>  				#address-cells = <1>;

-- 
Regards,

Laurent Pinchart
