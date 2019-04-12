Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFABC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 11:10:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65CFF2083E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 11:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfDLLKP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 07:10:15 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:54560 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfDLLKO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 07:10:14 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9AB5925B807;
        Fri, 12 Apr 2019 21:10:12 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 934BF9403FF; Fri, 12 Apr 2019 13:10:10 +0200 (CEST)
Date:   Fri, 12 Apr 2019 13:10:10 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, devicetree@vger.kernel.org,
        biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com,
        kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH v2 19/20] spi: sh-msiof: Document r8a77470 bindings
Message-ID: <20190412111010.4o4chp4qmylo2q47@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-20-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-20-git-send-email-cv-dong@jinso.co.jp>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dong-san,

On Thu, Apr 11, 2019 at 04:54:21PM +0900, Cao Van Dong wrote:
> Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.

I think it is worth mentioning that no driver change is required as the
renesas,rcar-gen2-msiof fallback compatibility string will activate the
correct code.

> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

I think this patch should be reposted including the following recipients:

Rob Herring <robh+dt@kernel.org>
Mark Rutland <mark.rutland@arm.com>
linux-spi@vger.kernel.org

As well as the following who are already included:

Mark Brown <broonie@kernel.org>
devicetree@vger.kernel.org
linux-renesas-soc@vger.kernel.org

> ---
>  Documentation/devicetree/bindings/spi/sh-msiof.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
> index 37cf695..18e14ee 100644
> --- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
> +++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
> @@ -4,6 +4,7 @@ Required properties:
>  - compatible           : "renesas,msiof-r8a7743" (RZ/G1M)
>  			 "renesas,msiof-r8a7744" (RZ/G1N)
>  			 "renesas,msiof-r8a7745" (RZ/G1E)
> +			 "renesas,msiof-r8a77470" (RZ/G1C)
>  			 "renesas,msiof-r8a774a1" (RZ/G2M)
>  			 "renesas,msiof-r8a774c0" (RZ/G2E)
>  			 "renesas,msiof-r8a7790" (R-Car H2)
> -- 
> 2.7.4
> 
