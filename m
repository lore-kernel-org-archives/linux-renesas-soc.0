Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C412C282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 12:27:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 61CC62086C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 12:27:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="JO1Lm920"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfA1M14 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 07:27:56 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59868 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbfA1M14 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 07:27:56 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CD12125BE02;
        Mon, 28 Jan 2019 23:27:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548678474; bh=S/x/nrxxGg5iqBxOQ+kadwFpAHX1iGTakpBxTxw4viQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JO1Lm920yDFD0v8+2FDVPE1GJzjdi33VR0TgHQ9X8iO986lIpHDcrQ1is/JBYZVyC
         4xfpw3x0n6U4ZUDf3MYGL7aaP+KSbo/ZJsRHj7HGdDMDEy/+VpCum+KiMjJfzVwa0z
         /x+TBCNfTXUcA0+DieZAZEUskkNwk1+KTlXhSSak=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 405AD9403E0; Mon, 28 Jan 2019 13:27:52 +0100 (CET)
Date:   Mon, 28 Jan 2019 13:27:52 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 01/10] pinctrl: sh-pfc: Validate fixed-size field
 widths at build time
Message-ID: <20190128122752.duimvrycnspdrko4@verge.net.au>
References: <20190125165305.8567-1-geert+renesas@glider.be>
 <20190125165305.8567-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190125165305.8567-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 25, 2019 at 05:52:56PM +0100, Geert Uytterhoeven wrote:
> Add a build-time check, to ensure the register and field widths in
> descriptors for config registers with fixed-width fields are sane.
> This helps catching bugs early.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Convert from run-time to build-time check.

Nice :)

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/pinctrl/sh-pfc/sh_pfc.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
> index 46d477ff510921f3..56016cb76769c97b 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -126,7 +126,8 @@ struct pinmux_cfg_reg {
>   * one for each possible combination of the register field bit values.
>   */
>  #define PINMUX_CFG_REG(name, r, r_width, f_width) \
> -	.reg = r, .reg_width = r_width, .field_width = f_width,		\
> +	.reg = r, .reg_width = r_width,					\
> +	.field_width = f_width + BUILD_BUG_ON_ZERO(r_width % f_width),	\
>  	.enum_ids = (const u16 [(r_width / f_width) * (1 << f_width)])
>  
>  /*
> -- 
> 2.17.1
> 
