Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B73DC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 09:59:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60B8A20856
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 09:59:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="YK0cTYwV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbfAWJ7Q (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 04:59:16 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:50960 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfAWJ7Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 04:59:16 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1EC3925BE34;
        Wed, 23 Jan 2019 20:59:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548237554; bh=avRLJdx7h6W3qWOzLBoApVJ/IT6l4JV/3MOWAto+vow=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YK0cTYwVpcPL5yn11b6p+GvlnrNU2WJxOmYRqgQ2D58HpjfC2wYm+xHcOxgRKzc7M
         EOYoOZrxsh8MbaKiNgODLPJlgczS/ccKf8HP6GNVR1m/4FBzo4L2vs9l5uJN4DDzmf
         ygTP38QBq79nyUFgzmFn4tbXMKxI4H9+YkkELdzk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 53EE9940471; Wed, 23 Jan 2019 10:59:12 +0100 (CET)
Date:   Wed, 23 Jan 2019 10:59:12 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        sergei.shtylyov@cogentembedded.com,
        Konstantin.Kozhevnikov@cogentembedded.com, geert+renesas@glider.be
Subject: Re: [PATCH/RFC 01/02] arm64: dts: renesas: r8a7795: Remove IMR-LX4
 device nodes
Message-ID: <20190123095911.m2y2opklkwi32qrj@verge.net.au>
References: <154807139502.25511.1919986589060151108.sendpatchset@octo>
 <154807140504.25511.16758316156851099392.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <154807140504.25511.16758316156851099392.sendpatchset@octo>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 21, 2019 at 08:50:05PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Get rid of undocumented IMR-LX4 device nodes for the r8a7795 SoC.
> 
> I would much prefer to have a proper driver with documented DT bindings
> in upstream instead. However removing DT nodes seems better than this
> current half-way state.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

I agree, likewise for patch 02/02.

Shall I go ahead and apply this series?

> ---
> 
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi |   40 ------------------------------
>  1 file changed, 40 deletions(-)
> 
> --- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2019-01-21 17:48:16.337551506 +0900
> @@ -2607,46 +2607,6 @@
>  			status = "disabled";
>  		};
>  
> -		imr-lx4@fe860000 {
> -			compatible = "renesas,r8a7795-imr-lx4",
> -				     "renesas,imr-lx4";
> -			reg = <0 0xfe860000 0 0x2000>;
> -			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 823>;
> -			power-domains = <&sysc R8A7795_PD_A3VC>;
> -			resets = <&cpg 823>;
> -		};
> -
> -		imr-lx4@fe870000 {
> -			compatible = "renesas,r8a7795-imr-lx4",
> -				     "renesas,imr-lx4";
> -			reg = <0 0xfe870000 0 0x2000>;
> -			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 822>;
> -			power-domains = <&sysc R8A7795_PD_A3VC>;
> -			resets = <&cpg 822>;
> -		};
> -
> -		imr-lx4@fe880000 {
> -			compatible = "renesas,r8a7795-imr-lx4",
> -				     "renesas,imr-lx4";
> -			reg = <0 0xfe880000 0 0x2000>;
> -			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 821>;
> -			power-domains = <&sysc R8A7795_PD_A3VC>;
> -			resets = <&cpg 821>;
> -		};
> -
> -		imr-lx4@fe890000 {
> -			compatible = "renesas,r8a7795-imr-lx4",
> -				     "renesas,imr-lx4";
> -			reg = <0 0xfe890000 0 0x2000>;
> -			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 820>;
> -			power-domains = <&sysc R8A7795_PD_A3VC>;
> -			resets = <&cpg 820>;
> -		};
> -
>  		fdp1@fe940000 {
>  			compatible = "renesas,fdp1";
>  			reg = <0 0xfe940000 0 0x2400>;
> 
