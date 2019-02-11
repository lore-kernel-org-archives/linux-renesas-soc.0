Return-Path: <SRS0=nlYi=QS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13873C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 12:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0BD4218A6
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 12:48:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbfBKMsE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Feb 2019 07:48:04 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:41580 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727216AbfBKMsE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Feb 2019 07:48:04 -0500
Received: by mail-ua1-f66.google.com with SMTP id z24so3345754ual.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Feb 2019 04:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=id7Mj4RX/jIW32tLRRXZAoJ0K5zYw3ExLT7NFsKJMGQ=;
        b=CL3Vv6lcR1iEU5WqDyM2ZRHOQDntwOR9JbQgIbXbgSlFDUyyQst9nrZepZ5odQsGqZ
         CUbPSDVOroEg3WlLJDz0A6KBniJjWf+jUB+eDQtTp7Da67hjKERJ/mBANmBsqQ1H9bOB
         11xI2/T7sD8rOQ3Xiy5yJ5nzqilmZGfSeNXY/vygjJz5OQNXWoyxOQXRQ17Ab7r1S+of
         gYKhaASefYfxSx69HpE0+QUZA4ud3cuiEeCFuWZGIvqn5w3TBjQcY/tVy9+tUvVn5V4P
         hOSfxCCgP1EcJtM7qYPDC6WRT3xvFl0vrSuYV8MjVVYdik6bWMjcrj7IPXyazm775q36
         8yFQ==
X-Gm-Message-State: AHQUAuZaHqQBDFa6ce+LguV46YfsxnPIAl1L4z2kV62w3o++8NRb9x9S
        vfcnHnjYm03FhV/pLhCvLp0zs0uFO8f9AQUuMOgoLpDc
X-Google-Smtp-Source: AHgI3IbykSemCYWSqNPkrB5bKLUl0BLmvLAMYM27RpTe8Y9wcejcktrbb0qOtHAV7+0xH4WUWGJojZ3lvkT+DAwpG2g=
X-Received: by 2002:ab0:7251:: with SMTP id d17mr14362033uap.0.1549889283241;
 Mon, 11 Feb 2019 04:48:03 -0800 (PST)
MIME-Version: 1.0
References: <201902060735.NFAVGNjO%fengguang.wu@intel.com> <CAMuHMdXO3ULebpw5m1ikFeAsZdf1JytqTD+bLvGq3WEo3HdytQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXO3ULebpw5m1ikFeAsZdf1JytqTD+bLvGq3WEo3HdytQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Feb 2019 13:47:51 +0100
Message-ID: <CAMuHMdV7MreoB4L3adXms=8=pRjuAQNkidVSD8uzfDiLUFRuUg@mail.gmail.com>
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

On Wed, Feb 6, 2019 at 8:03 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Feb 6, 2019 at 12:38 AM kbuild test robot <lkp@intel.com> wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/clk-r8a77990-z2-v3
> > head:   3423d0ef4af282d1a1021b40cc2e739c08c9046b
> > commit: 0961e355977f7806b926ea0ae29c5cffa7867894 [11/13] clk: renesas: rcar-gen3: Support Z and Z2 clocks with high frequency parents
> > config: i386-allmodconfig (attached as .config)
> > compiler: gcc-8 (Debian 8.2.0-14) 8.2.0
> > reproduce:
> >         git checkout 0961e355977f7806b926ea0ae29c5cffa7867894
> >         # save the attached .config to linux build tree
> >         make ARCH=i386
> >
> > All errors (new ones prefixed by >>):
> >
> >    ld: drivers/clk/renesas/rcar-gen3-cpg.o: in function `cpg_z_clk_set_rate':
> > >> rcar-gen3-cpg.c:(.text+0x13c): undefined reference to `__udivdi3'
>
> Thanks for the report!
>
> I guess this is due to
>
> +       mult = DIV_ROUND_CLOSEST(rate * 32ULL * zclk->fixed_div, parent_rate);
>
> While Simon had tested this on arm, apparently it fails on (at least) i386
> and mips.

FTR, it does fail on arm32 with arm-linux-gnueabihf-gcc 7.3.0.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
