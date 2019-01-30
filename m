Return-Path: <SRS0=dpDL=QG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2749C282D7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 09:58:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B13352080F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 09:58:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="TcZzHuP2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfA3J67 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 30 Jan 2019 04:58:59 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38984 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfA3J67 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jan 2019 04:58:59 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CAA4A25B813;
        Wed, 30 Jan 2019 20:58:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548842337; bh=vm37auMxN6vwtitYb0SCCpb6AqeydE0gYLNll8n6JWQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TcZzHuP2f0iXXTQWbjA04T+iDKExSdNcojCZtOVOE5LxTV2UGsJkZ/jo1LUWxO3vE
         zX/fB7qgnKsI2SN5UbQxHJvmp2aMTmGdDxG0cpfL/xDqVmwr1ib1gv8tqHviHyzfT8
         TGVybrvycHyMYg0cjuj/tfh5CHb3fcsw1ebpgjfM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DEB4594043D; Wed, 30 Jan 2019 10:58:54 +0100 (CET)
Date:   Wed, 30 Jan 2019 10:58:54 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: renesas: Fix SoC mismatch for Stout
Message-ID: <20190130095854.ue6o2sovkl2y5woi@verge.net.au>
References: <20190128085529.20538-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190128085529.20538-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 28, 2019 at 09:55:29AM +0100, Geert Uytterhoeven wrote:
> make dtbs_check:
> 
>     arch/arm/boot/dts/r8a7790-stout.dt.yaml: compatible: ['renesas,stout', 'renesas,r8a7790'] is not valid under any of the given schemas
> 
> The Stout development board has an R-Car H2 (r8a7790) SoC, not an R-Car
> H1 (r8a7779).
> 
> Fixes: 12749350567c819d ("dt-bindings: arm: Convert Renesas board/soc bindings to json-schema")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.1.

> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index cb9b4417e8a1cd75..19f379863d50bd41 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -130,13 +130,13 @@ properties:
>          items:
>            - enum:
>                - renesas,marzen # Marzen (R0P7779A00010S)
> -              - renesas,stout # Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
>            - const: renesas,r8a7779
>  
>        - description: R-Car H2 (R8A77900)
>          items:
>            - enum:
>                - renesas,lager # Lager (RTP0RC7790SEB00010S)
> +              - renesas,stout # Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
>            - const: renesas,r8a7790
>  
>        - description: R-Car M2-W (R8A77910)
> -- 
> 2.17.1
> 
