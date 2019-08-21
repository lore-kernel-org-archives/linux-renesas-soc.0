Return-Path: <SRS0=2dYz=WR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD9AC3A59E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 21 Aug 2019 14:13:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3523D233A0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 21 Aug 2019 14:13:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728923AbfHUONA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 21 Aug 2019 10:13:00 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:50752 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728763AbfHUONA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 10:13:00 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id AC1AA25AEB1;
        Thu, 22 Aug 2019 00:12:58 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A0F5F9405AE; Wed, 21 Aug 2019 16:12:56 +0200 (CEST)
Date:   Wed, 21 Aug 2019 16:12:56 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH LOCAL] arm64: renesas_defconfig: Refresh for v5.3-rc2
Message-ID: <20190821141256.l3aydmpfkdyyrfgq@verge.net.au>
References: <20190819122123.22512-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819122123.22512-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 19, 2019 at 02:21:23PM +0200, Geert Uytterhoeven wrote:
> Update the defconfig for Renesas R-Car Gen3 and RZ/G2 boards:
>   - Drop CONFIG_COMMON_CLK_XGENE=n (no longer auto-enabled since commit
>     ce9a1046434caee1 ("clk: xgene: Don't build COMMON_CLK_XGENE by
>     default").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Perhaps too slow to be particularly useful, but this looks good to me.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> To be applied to topic/renesas-defconfig.
> Not intended for upstream merge.
> 
>  arch/arm64/configs/renesas_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
> index 264fe03d6b085bae..bf0fd6aad56758e1 100644
> --- a/arch/arm64/configs/renesas_defconfig
> +++ b/arch/arm64/configs/renesas_defconfig
> @@ -274,7 +274,6 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_CHROME_PLATFORMS=y
>  CONFIG_COMMON_CLK_CS2000_CP=y
> -# CONFIG_COMMON_CLK_XGENE is not set
>  CONFIG_COMMON_CLK_VC5=y
>  CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
>  CONFIG_HWSPINLOCK=y
> -- 
> 2.17.1
> 
