Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEB4C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 10:58:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 038222083E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 10:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfDLK6h (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 06:58:37 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:53446 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfDLK6h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 06:58:37 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5CE7E25AD68;
        Fri, 12 Apr 2019 20:58:35 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 553669403FF; Fri, 12 Apr 2019 12:58:33 +0200 (CEST)
Date:   Fri, 12 Apr 2019 12:58:33 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, devicetree@vger.kernel.org,
        biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com,
        kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH v2 17/20] dt-bindings: pwm: Document r8a77470 bindings
Message-ID: <20190412105833.m7krdipwhs5fo7jr@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-18-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-18-git-send-email-cv-dong@jinso.co.jp>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 11, 2019 at 04:54:19PM +0900, Cao Van Dong wrote:
> Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

I think it is worth mentioning that no driver update is required because
using the renesas,pwm-rcar fallback compat string will activate the correct
code.

I think this patch should be reposted including the following recipients:

Thierry Reding <thierry.reding@gmail.com>
Rob Herring <robh+dt@kernel.org>
Mark Rutland <mark.rutland@arm.com>
linux-pwm@vger.kernel.org

As well as the following that are already included:
linux-renesas-soc@vger.kernel.org
devicetree@vger.kernel.org

> ---
>  Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
> index fbd6a4f..cba6ace 100644
> --- a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
> +++ b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
> @@ -5,6 +5,7 @@ Required Properties:
>   - "renesas,pwm-r8a7743": for RZ/G1M
>   - "renesas,pwm-r8a7744": for RZ/G1N
>   - "renesas,pwm-r8a7745": for RZ/G1E
> + - "renesas,pwm-r8a77470": for RZ/G1C
>   - "renesas,pwm-r8a774a1": for RZ/G2M
>   - "renesas,pwm-r8a774c0": for RZ/G2E
>   - "renesas,pwm-r8a7778": for R-Car M1A
> -- 
> 2.7.4
> 
