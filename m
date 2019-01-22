Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FDDC282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 17:07:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B94E20866
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 17:07:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TFh8pHR0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729472AbfAVRHz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 12:07:55 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51818 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729430AbfAVRHz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 12:07:55 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A9F5575;
        Tue, 22 Jan 2019 18:07:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1548176872;
        bh=lJ58TcMw8GV45d1NfpcTP1ty84Qi8d2LAzeREVqDLiM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TFh8pHR06uSc93SlhLNJ/kS7hBMNufibt5MKdEB8O6ohy+nv+WABndATT5kmSRVfB
         /1HuCnpZBjbUGOCpLjbHMULzfzh0mYsVaVTcXcqQwOMohiWevawXotPC2NT1NQJ0uX
         MvnfpruEZ2t4P7iTiILLpTXQRDrUmJm5TBBh7JRM=
Date:   Tue, 22 Jan 2019 19:07:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 4/5] ARM: dts: r8a7744: Add DU support
Message-ID: <20190122170751.GB26166@pendragon.ideasonboard.com>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-5-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1548170749-12773-5-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Tue, Jan 22, 2019 at 03:25:48PM +0000, Biju Das wrote:
> Add du node to r8a7744 SoC DT. Boards that want to enable the DU
> need to specify the output topology.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I expect Simon to pick this up.

> ---
>  arch/arm/boot/dts/r8a7744.dtsi | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
> index 8d25a0a..83804aa 100644
> --- a/arch/arm/boot/dts/r8a7744.dtsi
> +++ b/arch/arm/boot/dts/r8a7744.dtsi
> @@ -1645,8 +1645,14 @@
>  		};
>  
>  		du: display@feb00000 {
> -			reg = <0 0xfeb00000 0 0x40000>,
> -			      <0 0xfeb90000 0 0x1c>;
> +			compatible = "renesas,du-r8a7744";
> +			reg = <0 0xfeb00000 0 0x40000>;
> +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 724>,
> +				 <&cpg CPG_MOD 723>;
> +			clock-names = "du.0", "du.1";
> +			status = "disabled";
>  
>  			ports {
>  				#address-cells = <1>;
> @@ -1663,7 +1669,6 @@
>  					};
>  				};
>  			};
> -			/* placeholder */
>  		};
>  
>  		prr: chipid@ff000044 {

-- 
Regards,

Laurent Pinchart
