Return-Path: <SRS0=rp0x=R6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A60C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 11:48:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 637CC206DF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 11:48:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Ixkv9cEE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728270AbfC0LsV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Mar 2019 07:48:21 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55925 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727557AbfC0LsV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Mar 2019 07:48:21 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F389425B757;
        Wed, 27 Mar 2019 22:48:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553687299; bh=6oJAq9WJtYXfwkmOrXySJ6mQ9HUkt1nZKKKcBQ3oamw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ixkv9cEEHDAUaRrd6q8Jsd/AdURZzI0LXgTFo1Jm770k/ljwUHK1MydKWLTm2/NQP
         4H7DAinXIHkQP7AbuhxQaWX7IDWaMO3i7CZ8BhzvsN28aQn1uQ2LtFSsYTlr8AJ3p3
         /7/OI+teJCJJEMscgWLv0xAGdJ27qgvE62srvdO4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 37D9D940376; Wed, 27 Mar 2019 12:48:17 +0100 (CET)
Date:   Wed, 27 Mar 2019 12:48:17 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH v3 04/10] sh: sh7786: Add explicit I/O cast to
 sh7786_mm_sel()
Message-ID: <20190327114816.f2jui4gyq3e3x2pf@verge.net.au>
References: <20190320102141.19316-1-geert+renesas@glider.be>
 <20190320102141.19316-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190320102141.19316-5-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 20, 2019 at 11:21:35AM +0100, Geert Uytterhoeven wrote:
> When compile-testing on arm:
> 
>     arch/sh/include/cpu-sh4/cpu/sh7786.h: In function ‘sh7786_mm_sel’:
>     arch/sh/include/cpu-sh4/cpu/sh7786.h:135:21: warning: passing argument 1 of ‘__raw_readl’ makes pointer from integer without a cast [-Wint-conversion]
>       return __raw_readl(0xFC400020) & 0x7;
> 			 ^~~~~~~~~~
>     In file included from include/linux/io.h:25:0,
> 		     from arch/sh/include/cpu-sh4/cpu/sh7786.h:14,
> 		     from drivers/pinctrl/sh-pfc/pfc-sh7786.c:15:
>     arch/arm/include/asm/io.h:113:21: note: expected ‘const volatile void *’ but argument is of type ‘unsigned int’
>      #define __raw_readl __raw_readl
> 			 ^
>     arch/arm/include/asm/io.h:114:19: note: in expansion of macro ‘__raw_readl’
>      static inline u32 __raw_readl(const volatile void __iomem *addr)
> 		       ^~~~~~~~~~~
> 
> __raw_readl() on SuperH is a macro that casts the passed I/O address to
> the correct type, while the implementations on most other architectures
> expect to be passed the correct pointer type.
> 
> Add an explicit cast to fix this.
> 
> Note that this also gets rid of a sparse warning on SuperH:
> 
>     arch/sh/include/cpu-sh4/cpu/sh7786.h:135:16: warning: incorrect type in argument 1 (different base types)
>     arch/sh/include/cpu-sh4/cpu/sh7786.h:135:16:    expected void const volatile [noderef] <asn:2>*<noident>
>     arch/sh/include/cpu-sh4/cpu/sh7786.h:135:16:    got unsigned int
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> As this is a dependency for sh-pfc compile-testing, I intend to queue
> this up in sh-pfc-for-v5.2.
> 
> v3:
>   - New.
> ---
>  arch/sh/include/cpu-sh4/cpu/sh7786.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/sh/include/cpu-sh4/cpu/sh7786.h b/arch/sh/include/cpu-sh4/cpu/sh7786.h
> index 8f9bfbf3cdb1097f..d6cce65b48713f60 100644
> --- a/arch/sh/include/cpu-sh4/cpu/sh7786.h
> +++ b/arch/sh/include/cpu-sh4/cpu/sh7786.h
> @@ -132,7 +132,7 @@ enum {
>  
>  static inline u32 sh7786_mm_sel(void)
>  {
> -	return __raw_readl(0xFC400020) & 0x7;
> +	return __raw_readl((const volatile void __iomem *)0xFC400020) & 0x7;
>  }
>  
>  #endif /* __CPU_SH7786_H__ */
> -- 
> 2.17.1
> 
