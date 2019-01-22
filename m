Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60606C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 17:13:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 335972085A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 17:13:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sbybjU4L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbfAVRNa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 12:13:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51868 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729428AbfAVRN2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 12:13:28 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A52D4575;
        Tue, 22 Jan 2019 18:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1548177205;
        bh=/+ADa5pDbzfW4iYcbbF9jgy912z+n2+X8vtivwCsuiw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sbybjU4Lg1kjkpImI+M0O+oteBvOErjsJ+UlBsRvRceLbJfcRm1jJihZ55AO+J9zP
         20ImxzGxDLBc5Exs2t7IS+BZmd4fw1iqH4voN4x1LMBOcGs5g4Z/MVy31u/dAtIMUB
         n74Uq2joxdeMZehR7QvtsBXmmpWoN1pQPZQoy/iM=
Date:   Tue, 22 Jan 2019 19:13:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 1/5] ARM: dts: r8a7743: Convert to new LVDS DT bindings
Message-ID: <20190122171325.GC26166@pendragon.ideasonboard.com>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1548170749-12773-2-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Tue, Jan 22, 2019 at 03:25:45PM +0000, Biju Das wrote:
> The internal LVDS encoder now has DT bindings separate from the DU. Port
> the device tree over to the new model.
> 
> Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")

Sorry for the breakage. The DT and DU series raced each other, but I
should have still caught it.

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I expect Simon to pick this up.

> ---
>  arch/arm/boot/dts/r8a7743.dtsi | 36 ++++++++++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
> index 24e6c2b..de981d6 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -1660,15 +1660,12 @@
>  
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a7743";
> -			reg = <0 0xfeb00000 0 0x40000>,
> -			      <0 0xfeb90000 0 0x1c>;
> -			reg-names = "du", "lvds.0";
> +			reg = <0 0xfeb00000 0 0x40000>;
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 724>,
> -				 <&cpg CPG_MOD 723>,
> -				 <&cpg CPG_MOD 726>;
> -			clock-names = "du.0", "du.1", "lvds.0";
> +				 <&cpg CPG_MOD 723>;
> +			clock-names = "du.0", "du.1";
>  			status = "disabled";
>  
>  			ports {
> @@ -1683,6 +1680,33 @@
>  				port@1 {
>  					reg = <1>;
>  					du_out_lvds0: endpoint {
> +						remote-endpoint = <&lvds0_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds0: lvds@feb90000 {
> +			compatible = "renesas,r8a7743-lvds";
> +			reg = <0 0xfeb90000 0 0x1c>;
> +			clocks = <&cpg CPG_MOD 726>;
> +			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
> +			resets = <&cpg 726>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					lvds0_in: endpoint {
> +						remote-endpoint = <&du_out_lvds0>;
> +					};
> +				};
> +				port@1 {
> +					reg = <1>;
> +					lvds0_out: endpoint {
>  					};
>  				};
>  			};

-- 
Regards,

Laurent Pinchart
