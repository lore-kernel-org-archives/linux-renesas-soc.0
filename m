Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B02DC433E0
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Feb 2021 12:45:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A536764D5D
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Feb 2021 12:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhBPMp0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 16 Feb 2021 07:45:26 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:41048 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbhBPMpY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Feb 2021 07:45:24 -0500
Received: by mail-oi1-f173.google.com with SMTP id v193so11061797oie.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Feb 2021 04:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hZvZBQdQCvmhI6sD/De39AfrQz8gzNNIl2sxhpIVJcM=;
        b=d0ud/g2w44V3Rx8/Ic2EurwN90yN0lhxSU5d7B+oLGAmMTruP4wbW42BgWcKmvJDnT
         DWrHLY3jyskuNro95Zc3tacQLesp9HQsqpajCkaesxoB0MXRlaSGxbswQXwqfVAw5pg6
         krs/oE3aQdYPXdNiLO1WoouzyDOenK3qyx7pUaSUyXHb6mHhwDfv2z6C7x3F5XbLepad
         j9W8CmO1/A3e+lvsAaE4k5931h1c9iQnRoY7Rdz7ekG/WMEQgjoc7VkDm0NcGqLNX8iK
         IMQs/pDM05eC+2PK5/8H4hGV++X2nyNcsbUAZ3pE1lNiVDhQs7m3s/iQFrMEL7tE7cI8
         4cmQ==
X-Gm-Message-State: AOAM531edlDlEBDXNe1oIOoP9Q0MFkE4TNWPHE52vJCcFoVU0BMxBS/z
        PLpx+bhaBK70R/DY/6XeucKLYNsI2x9ECWXcQ5b/PwG6
X-Google-Smtp-Source: ABdhPJwElkcJ3iXHFM228H+hyglH6HjnutEEbOyHvZp/lNA+Q9MQVlzxbgEypotzrkgcavC8AGB6h1PlDwTKPB3p0hs=
X-Received: by 2002:a54:4e88:: with SMTP id c8mr2324390oiy.148.1613479482363;
 Tue, 16 Feb 2021 04:44:42 -0800 (PST)
MIME-Version: 1.0
References: <20210215101754.6725-1-wsa+renesas@sang-engineering.com> <CAMuHMdWL7adaod2=F1wNBNnxx1FnUj=DQ2-pLO3Cq=JTB_DS0g@mail.gmail.com>
In-Reply-To: <CAMuHMdWL7adaod2=F1wNBNnxx1FnUj=DQ2-pLO3Cq=JTB_DS0g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 Feb 2021 13:44:31 +0100
Message-ID: <CAMuHMdWkXryO1QMUAUGfH1PoA5yzXC-GBoQbtw1Fw3ZB3wNypQ@mail.gmail.com>
Subject: Re: [PATCH RFT only] mmc: tmio: remove workaround for NON_REMOVABLE
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Feb 15, 2021 at 11:35 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Feb 15, 2021 at 11:18 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > RPM handling has been improved twice since this comment, and also SCC
> > handling has been improved a lot. Time to test if we the workaround can
> > be removed!
> >
> > Not-yet-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > I'd be very grateful if you guys could have this patch boot-tested with
> > your boardfarms. If the failure is still there, then it used to hang
> > when detecting the eMMC. Maybe these days eMMC will just not show up.
> > But hopefully all is well now. This always was difficult to trigger, so
> > a wide test coverage would be highly appreciated. It works for me(tm),
> > but that is not enough here.
>
> Thank you, I'll give it a try on tomorrow's renesas-drivers release.

No regressions detected during booting, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
