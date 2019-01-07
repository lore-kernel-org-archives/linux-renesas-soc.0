Return-Path: <SRS0=nqfF=PP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CFCC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 08:34:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D3D720675
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 08:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbfAGIeR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Jan 2019 03:34:17 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:34861 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbfAGIeQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jan 2019 03:34:16 -0500
Received: by mail-vs1-f65.google.com with SMTP id e7so26232993vsc.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jan 2019 00:34:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OC2E0lDuBvi+m6jw7aqZiAe73/Ckd9tc9seb3rAx4aY=;
        b=cQZnh/8nhKaK4EbDd2LjefDGj03cdLDo6JN9m9F9Tc4kKPqqXjmGgXVJghiqbbiVnt
         36RK8mqL9BKGhWHF0PFNe321UiS/Wn7J1aWAR1SqxcC4IQjjgPuBq4kbMEypOTWjRyAY
         Cz/zDB5eJoa6s/d5IG1g1c24IEY3fnpgA3ocjY9oiWf5kjiDJCVKNfVf3QbxtfGZAhhQ
         dJFWsFjrlXAzRoTSaP5+dV3CyKkZFLY6SqxwWXaLmcnY9YT3GlgBDSymQ/2fPnORvYlh
         r5/g5Xj+97VmrzHyPyPIXvgqP7qMLalhikP4ZeKavP9IXtq75zWtL9YXERxAKZCaprL0
         4f3g==
X-Gm-Message-State: AA+aEWY/NQ6/glmjDXrv5R+yLV8+eCoOX4/mH69TCVHpKNZwIuVzaPqZ
        rE0bR7z1C9JnkR16BjnlQLNb/H8wcrj05PI4ZPI=
X-Google-Smtp-Source: AFSGD/UA6rUnBF3WG7P37VkofmpCp9hWjkXXaZTxIH5W1qvcsOfSerli2c2IqBmGqfDV2KdzCOo4Q3+1KhDyE6R6kmw=
X-Received: by 2002:a67:f43:: with SMTP id 64mr24758442vsp.166.1546850054396;
 Mon, 07 Jan 2019 00:34:14 -0800 (PST)
MIME-Version: 1.0
References: <OSBPR01MB2103C55C91F968BE2CD870AEB88C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdX60zMDd49ySuinJJnfTpqNJ_Nzj7DO+YYF7C=HFQ-SkA@mail.gmail.com> <20190104090401.d4vuq37vdgfc4tow@verge.net.au>
In-Reply-To: <20190104090401.d4vuq37vdgfc4tow@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Jan 2019 09:34:02 +0100
Message-ID: <CAMuHMdWZhXWu9JwiAS1L+M6bN6pMTTRN9jiQMi7voUWifLRb9w@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: r8a774c0-sysc: Fix initialization order of 3DG-{A,B}
To:     Simon Horman <horms@verge.net.au>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Fri, Jan 4, 2019 at 10:04 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Jan 02, 2019 at 11:39:03AM +0100, Geert Uytterhoeven wrote:
> > On Wed, Jan 2, 2019 at 10:40 AM Simon Horman <horms@verge.net.au> wrote:
> > > On Fri, Dec 14, 2018 at 04:59:00PM +0100, Simon Horman wrote:
> > > > On Thu, Dec 13, 2018 at 12:18:46PM +0100, Simon Horman wrote:
> > > > > On Wed, Dec 12, 2018 at 12:17:11PM +0000, Biju Das wrote:
> > > > > > The workaround for the wrong hierarchy of the 3DG-{A,B} power domains on
> > > > > > RZ/G2E ES1.0 corrected the parent domains. However, the 3DG-{A,B} power
> > > > > > domains were still initialized and powered in the wrong order, causing
> > > > > > 3DG operation to fail.
> > > > > >
> > > > > > Fix this by changing the order in the table at runtime, when running on
> > > > > > an affected SoC.
> > > > > >
> > > > > > This work is based on the work done by Geert for R-Car E3.
> > > > > >
> > > > > > Fixes: f37d211c687588328 ("soc: renesas: rcar-sysc: Add r8a774c0 support")
> > > > > >
> > > > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > > >
> > > > > Thanks,
> > > > >
> > > > > This looks fine to me but I will wait to see if there are other reviews
> > > > > before applying.

> I have gone ahead and applied this patch for v4.22.

Given commit 1585124d9563da64 ("soc: renesas: rcar-sysc: Merge PM Domain
registration and linking") is in v5.0-rc1, this means the rcar-sysc driver
will bail out without this fix, not registering any PM Domains.
Sorry for not realizing this dependency before.

Hence you may want to queue it as a fix for v5.0 instead.
Or not, as we won't have a board DTS for RZ/G2E in v5.0-rc1 anyway?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
