Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B06C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:46:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94A292133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:46:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="gRDQTkU4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732087AbeLQOq1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:46:27 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:42074 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731785AbeLQOq1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:46:27 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E927F25B7CF;
        Tue, 18 Dec 2018 01:46:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545057985; bh=HWf/dYpkp54vEyNVoMp1puf9zW1EkSMiNMk4xxNAgmo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gRDQTkU4jqdIQepRc4WIIHEDveAW3YQzYx8Qag3sVXzadyET0fZ+iWxVChBBvjme9
         8k5XTe8IfrBGQBR2Dt6G67ee4LhRpqz5zPW2PWzvC3QS0P34bp5QvaMgAF9nMNZKL9
         X+IYMtfdcoK8ogxG/Lfz3jVOnuU+WeZz1nOVX57k=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1672B94048A; Mon, 17 Dec 2018 15:46:23 +0100 (CET)
Date:   Mon, 17 Dec 2018 15:46:23 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 11/15] pinctrl: sh-pfc: Print actual field width for
 variable-width fields
Message-ID: <20181217144618.a6omxq2y4acydp75@verge.net.au>
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-12-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213182714.26094-12-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:27:10PM +0100, Geert Uytterhoeven wrote:
> The debug code in sh_pfc_write_config_reg() prints the width of the
> field being modified.
> 
> However, registers with a variable-width field layout are identified by
> pinmux_cfg_reg.field_width being zero, hence zeroes are printed instead
> of the actual field widths.
> 
> Fix this by printing the Hamming height of the field mask instead, which
> is correct for both fixed-width and variable-width fields.

s/height/width ?

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/pinctrl/sh-pfc/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
> index a10f7050a74f35ff..f1cfcc8c65446662 100644
> --- a/drivers/pinctrl/sh-pfc/core.c
> +++ b/drivers/pinctrl/sh-pfc/core.c
> @@ -221,7 +221,7 @@ static void sh_pfc_write_config_reg(struct sh_pfc *pfc,
>  
>  	dev_dbg(pfc->dev, "write_reg addr = %x, value = 0x%x, field = %u, "
>  		"r_width = %u, f_width = %u\n",
> -		crp->reg, value, field, crp->reg_width, crp->field_width);
> +		crp->reg, value, field, crp->reg_width, hweight32(mask));
>  
>  	mask = ~(mask << pos);
>  	value = value << pos;
> -- 
> 2.17.1
> 
