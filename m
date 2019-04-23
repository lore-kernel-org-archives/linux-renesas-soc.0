Return-Path: <SRS0=hHdZ=SZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 492C3C10F14
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 09:21:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 202E7206A3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 09:21:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfDWJVH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Apr 2019 05:21:07 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:44153 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbfDWJVH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Apr 2019 05:21:07 -0400
Received: by mail-ua1-f67.google.com with SMTP id p13so4516563uaa.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Apr 2019 02:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tQ2QIDWikydlFD8+0opWAcEBmyM580I9oRwV4u1bzKg=;
        b=PTzfxvMoOS0zZUdl3dTCdnIwVqQq5fy6UPVKUtzlmfhrn/HzMeGgoaFg/RcyOdQri0
         k3OjyvGMlgXWdwBEhckAa6ffYAQS8cfeC+hXtOgTMvWWAJx1QQoiGAD7Agl8fCYQYR4c
         +Uf/KmlZ3vzIAU7Q06AFnB9v4WF2+FFokCJhOV9o8/R2/HxykPqxVcYUsuKNlzl2afgt
         LjshU1XZ+HEzjnLg+rJGB7WYp5k+0LuXifUMPT3GDD8YFFf47P+Pd5UHyOlI6mquV+kD
         IJ3q8nEm6yrtdsmc9I42C+1VBjP8yhZURa87RHCPUTmqLz1xcmw/SlkLxjzyojY43NCN
         RC+A==
X-Gm-Message-State: APjAAAUQElu4wjLzdtNMVmInjdupZHemube1U0pgCkeRmsTTpAsLZROe
        /uWVdQb/rEQZncIwwQB12uN+gjiXL/yNLC+7L9Q=
X-Google-Smtp-Source: APXvYqxME44byMFDtuQIYG13DjPVslwDNayOiO/Y7UOr3Pe86mlBYOKL8tLZh1owP9j5KophtVE5PZYyj7lQJXtdyEk=
X-Received: by 2002:ab0:791:: with SMTP id c17mr1855645uaf.96.1556011266487;
 Tue, 23 Apr 2019 02:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555654474.git.horms+renesas@verge.net.au> <0cd4f4f10245d1d9616e00245093f46acd198141.1555654474.git.horms+renesas@verge.net.au>
In-Reply-To: <0cd4f4f10245d1d9616e00245093f46acd198141.1555654474.git.horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Apr 2019 11:20:55 +0200
Message-ID: <CAMuHMdVQZbVCGhc==bvV6N-R4NuBwnwUShvL1S9xaHcSJY5B7w@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in shmobile_defconfig
To:     Simon Horman <horms+renesas@verge.net.au>,
        Biju Das <biju.das@bp.renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon, Biju,

On Fri, Apr 19, 2019 at 4:36 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> From: Biju Das <biju.das@bp.renesas.com>
>
> Enable PHY_RCAR_GEN3_USB2 in shmobile_defconfig so that boards
> based on RZ/G1C SoC design can use the corresponding driver.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm/configs/shmobile_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index 291abdd650ed..30abd8176010 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -197,6 +197,7 @@ CONFIG_PWM_RENESAS_TPU=y
>  CONFIG_RESET_CONTROLLER=y
>  CONFIG_GENERIC_PHY=y
>  CONFIG_PHY_RCAR_GEN2=y
> +CONFIG_PHY_RCAR_GEN3_USB2=y

As PHY_RCAR_GEN3_USB2 selects GENERIC_PHY, the line

    CONFIG_GENERIC_PHY=y

should be removed from shmobile_defconfig.

>  # CONFIG_DNOTIFY is not set
>  CONFIG_MSDOS_FS=y
>  CONFIG_VFAT_FS=y

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
