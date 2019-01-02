Return-Path: <SRS0=RWjW=PK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5654CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 10:39:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E513218A4
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 10:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbfABKjR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Jan 2019 05:39:17 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:41123 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbfABKjR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jan 2019 05:39:17 -0500
Received: by mail-vs1-f65.google.com with SMTP id t17so18627829vsc.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Jan 2019 02:39:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wy6KgNr9/dUfB0er9a+6CafukdxPACZdF3OKG9gnG04=;
        b=GuuM18KzSFCYqvpV2fEIJzi3o+zz3qncKYzN+dnCDh3MWIRuKjKqCX4EVlI3BzgZ4b
         qBP6Sbj4UiPB4wJej0L3Zwb8wEtvcqwcLtv7Ep/AoEh+S7oKomnsYThJZ5jUI1WH/lOd
         WDgqJVFfodRK1YUKTkcnaHly7ooZn5oSvuoCvSLpp2wYq9VkP4lgpGLdKjgLhi1ugFax
         5WvpK6NGbT2MHt35JzN35vBUOkXEm8wztkCKwFRxAJ3dJQFlq0fRKtNs9ol62jpGPIvV
         DXPeb26NdKPbWTfuJ9oR/LPS3nYAadRDE3o/ktXVDT/wq25CIbmLnQ+cOEpx3QssKa/D
         igUQ==
X-Gm-Message-State: AA+aEWYoXpKvyGS4zzPA2hWemPmZYDTL5R5vP/SasyVR9ySbifw9Op3+
        k3WZQCCYOWpZ1OWSxGRvXc19d7xRL8VN9NOE+Rg=
X-Google-Smtp-Source: AFSGD/Vm8DhpVpN4QkpfOcFPnn4vCKv1sA/1kLcqeFcENaOmJKgd1r3UPv1dPcvanhnvSlzLl6IhH2fz5olE98Blvl0=
X-Received: by 2002:a67:f43:: with SMTP id 64mr17524801vsp.166.1546425556358;
 Wed, 02 Jan 2019 02:39:16 -0800 (PST)
MIME-Version: 1.0
References: <1544617031-28114-1-git-send-email-biju.das@bp.renesas.com>
 <20181213111846.qd25vzpnejbzzldg@verge.net.au> <20181214155900.za4xbl74sbbgc4ef@verge.net.au>
 <20190102093958.e7wjhm7eqeu367s7@verge.net.au>
In-Reply-To: <20190102093958.e7wjhm7eqeu367s7@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Jan 2019 11:39:03 +0100
Message-ID: <CAMuHMdX60zMDd49ySuinJJnfTpqNJ_Nzj7DO+YYF7C=HFQ-SkA@mail.gmail.com>
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

On Wed, Jan 2, 2019 at 10:40 AM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Dec 14, 2018 at 04:59:00PM +0100, Simon Horman wrote:
> > On Thu, Dec 13, 2018 at 12:18:46PM +0100, Simon Horman wrote:
> > > On Wed, Dec 12, 2018 at 12:17:11PM +0000, Biju Das wrote:
> > > > The workaround for the wrong hierarchy of the 3DG-{A,B} power domains on
> > > > RZ/G2E ES1.0 corrected the parent domains. However, the 3DG-{A,B} power
> > > > domains were still initialized and powered in the wrong order, causing
> > > > 3DG operation to fail.
> > > >
> > > > Fix this by changing the order in the table at runtime, when running on
> > > > an affected SoC.
> > > >
> > > > This work is based on the work done by Geert for R-Car E3.
> > > >
> > > > Fixes: f37d211c687588328 ("soc: renesas: rcar-sysc: Add r8a774c0 support")
> > > >
> > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > >
> > > Thanks,
> > >
> > > This looks fine to me but I will wait to see if there are other reviews
> > > before applying.
> > >
> > > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> >
> > Thanks, v2 sent.
> >
>
> I don't see a v2 or any other review of this patch.
> Am I missing something?

Presumably the "Thanks, v2 sent." reply (by you!) was a reply meant for
another thread?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
