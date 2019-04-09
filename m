Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19801C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 11:00:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D860C20883
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 11:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="J/5zvC1q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfDILAf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 07:00:35 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41614 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbfDILAf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 07:00:35 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D3C9D25BDAE;
        Tue,  9 Apr 2019 21:00:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554807633; bh=0yQypPF1SK+SnWImM/Isjw+yJjfz2nWD5PI3tUsZT24=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J/5zvC1q9cI6C5SlBqHmOOgUOgoYWTU2/R/AtToUWh7FIB0NbXN6lgsk/J154yrGU
         RAdFmaTEEQSDJDoNNJNbFKyS/c5Dw3jVQKFA3gQH50p0gB3l+vkBvtqvcSiuHB5Iri
         ho1d7pNRcj7NIjf2kSpdVgbW0ojlLl833ZAPmOBs=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 05B2A9402E1; Tue,  9 Apr 2019 13:00:30 +0200 (CEST)
Date:   Tue, 9 Apr 2019 13:00:30 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH V3 05/13] ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in
 shmobile_defconfig
Message-ID: <20190409110030.hfwyyfdxjuztyszu@verge.net.au>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-6-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554287324-22312-6-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 03, 2019 at 11:28:36AM +0100, Biju Das wrote:
> Enable PHY_RCAR_GEN3_USB2 in shmobile_defconfig so that boards
> based on RZ/G1C SoC design can use the corresponding driver.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks Biju,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> V2-->V3
>  * New patch
>    https://patchwork.kernel.org/patch/10879899/
> ---
>  arch/arm/configs/shmobile_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index 9b0efac..ff9348d 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -197,6 +197,7 @@ CONFIG_PWM_RENESAS_TPU=y
>  CONFIG_RESET_CONTROLLER=y
>  CONFIG_GENERIC_PHY=y
>  CONFIG_PHY_RCAR_GEN2=y
> +CONFIG_PHY_RCAR_GEN3_USB2=y
>  # CONFIG_DNOTIFY is not set
>  CONFIG_MSDOS_FS=y
>  CONFIG_VFAT_FS=y
> -- 
> 2.7.4
> 
