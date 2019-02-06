Return-Path: <SRS0=87O0=QN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E32C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Feb 2019 07:04:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C9BA217F9
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Feb 2019 07:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbfBFHEH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Feb 2019 02:04:07 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46341 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfBFHEH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Feb 2019 02:04:07 -0500
Received: by mail-vs1-f66.google.com with SMTP id n10so3753206vso.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Feb 2019 23:04:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zeu+Dpg/Jx+ZaZNheSMbhRFAbpaTM8DOxS92phjw8zU=;
        b=EES5fiMBguKa70E77wnmueY0s9fMftDwVRnauqn8F+3CieOVxtBwh/Y7nc6TnwO1Yo
         S9X9vVecNQfusDE3Y8bzWHBBqrRqbHHSU+/SJDfF3JexSAV/BQoZHawPu8ZBPee8s1UU
         eU6ICnGPmlV7U5dEn6BokefcpCAhl16FEMUREzE0jdp1xbPBq123cq1+tpnK4oqYhSn+
         T+AQHcYz0EpIuyPvVzH60DJ3lOKeXSwiN13teYqW5uKyrG0YsM/vQ2eKgg1ru9IXCpnv
         dEDJf6IAkzUzQIDD98BtY0+PcrsL/GBuOL/SdZ6R3qTfYOsyEDYRC5haKgNCWwe2kPt3
         t35Q==
X-Gm-Message-State: AHQUAubWdcs6iIW82U3x3zdQuPEhp8Ene+8yLAqHluHx6jyfy+ZkfwXt
        WWqkF0BK6fyI7e+7sAkkUQlqQ97ZaYEpUbRWlWs=
X-Google-Smtp-Source: AHgI3IY3g2QBLRJZDMM8J6xQSmrBdmRlS/SztvTgBgffgp/ZONycpNguT6DT+aJDSrD0w6towPRss3QtIdcG059Bhfs=
X-Received: by 2002:a67:d119:: with SMTP id u25mr3497853vsi.63.1549436646327;
 Tue, 05 Feb 2019 23:04:06 -0800 (PST)
MIME-Version: 1.0
References: <201902060735.NFAVGNjO%fengguang.wu@intel.com>
In-Reply-To: <201902060735.NFAVGNjO%fengguang.wu@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Feb 2019 08:03:54 +0100
Message-ID: <CAMuHMdXO3ULebpw5m1ikFeAsZdf1JytqTD+bLvGq3WEo3HdytQ@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/clk-r8a77990-z2-v3 11/13]
 rcar-gen3-cpg.c:undefined reference to `__udivdi3'
To:     kbuild test robot <lkp@intel.com>
Cc:     Simon Horman <horms+renesas@verge.net.au>, kbuild-all@01.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 6, 2019 at 12:38 AM kbuild test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/clk-r8a77990-z2-v3
> head:   3423d0ef4af282d1a1021b40cc2e739c08c9046b
> commit: 0961e355977f7806b926ea0ae29c5cffa7867894 [11/13] clk: renesas: rcar-gen3: Support Z and Z2 clocks with high frequency parents
> config: i386-allmodconfig (attached as .config)
> compiler: gcc-8 (Debian 8.2.0-14) 8.2.0
> reproduce:
>         git checkout 0961e355977f7806b926ea0ae29c5cffa7867894
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> All errors (new ones prefixed by >>):
>
>    ld: drivers/clk/renesas/rcar-gen3-cpg.o: in function `cpg_z_clk_set_rate':
> >> rcar-gen3-cpg.c:(.text+0x13c): undefined reference to `__udivdi3'

Thanks for the report!

I guess this is due to

+       mult = DIV_ROUND_CLOSEST(rate * 32ULL * zclk->fixed_div, parent_rate);

While Simon had tested this on arm, apparently it fails on (at least) i386
and mips.

Changing "32ULL" to "32UL" should fix this, but means a sure overflow if this
code is ever used on or copied for a 32-bit platform.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
