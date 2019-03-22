Return-Path: <SRS0=lsYt=RZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8240BC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 10:46:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 403BE218D4
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 10:46:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="fwcmAxPm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbfCVKqq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Mar 2019 06:46:46 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56062 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbfCVKqp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Mar 2019 06:46:45 -0400
Received: from penelope.horms.nl (unknown [195.39.71.253])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 985A525BEFD;
        Fri, 22 Mar 2019 21:46:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553251603; bh=VKItzqnLMDKsHrjj28xfTht19qKckU7kBAXQ6rbL734=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fwcmAxPmqGRTvG6g5teppl3rqg9aIpRMdxqXYh0aeWUPAjLJW4shbEb+lx+uNGcHm
         FpS0fHaA4uTQSABEVfUncddEq+Rn0uaYqSBdIsCja9WfDPOI9SvvWSYYKUG+yq61Gv
         0jbDPu7bIdQeZBWZkhgw/fFshIGl9KUfRbo+nx3Y=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id B775BE21330; Fri, 22 Mar 2019 11:46:41 +0100 (CET)
Date:   Fri, 22 Mar 2019 11:46:41 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 1/2] ARM: dts: r8a77470: Add DU support
Message-ID: <20190322104641.hywslvn6mt4pjqbr@verge.net.au>
References: <1552998099-22972-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1552998099-22972-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552998099-22972-2-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 19, 2019 at 12:21:38PM +0000, Fabrizio Castro wrote:
> This commit adds DU support to the RZ/G1C (a.k.a. r8a77470)
> specific device tree.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> index f4e232b..493cf2b 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -643,6 +643,38 @@
>  			resets = <&cpg 408>;
>  		};
>  
> +		du: display@feb00000 {
> +			compatible = "renesas,du-r8a77470";
> +			reg = <0 0xfeb00000 0 0x40000>;
> +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 724>,
> +				 <&cpg CPG_MOD 723>;

I do not see MSTP 7 bit 23 documented as used by DU
in the User's Manual: Hardware v1.00 Oct 13, 2017.

Do you have more recent documentation or some insight in this area?

> +			clock-names = "du.0", "du.1";
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					du_out_rgb0: endpoint {
> +					};
> +				};
> +				port@1 {
> +					reg = <1>;
> +					du_out_rgb1: endpoint {
> +					};
> +				};
> +				port@2 {
> +					reg = <2>;
> +					du_out_lvds0: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
>  		prr: chipid@ff000044 {
>  			compatible = "renesas,prr";
>  			reg = <0 0xff000044 0 4>;
> -- 
> 2.7.4
> 
