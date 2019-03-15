Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64714C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 08:49:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33F9121872
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 08:49:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfCOItb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 04:49:31 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:38718 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbfCOIta (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 04:49:30 -0400
Received: by mail-ua1-f65.google.com with SMTP id d4so2857186uap.5;
        Fri, 15 Mar 2019 01:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D+nyOthGDZ5EZ5HFOz9WBkgDq3yQMzw9BDvNf8WnQuM=;
        b=Vtn/Epb2Ejdm3Nh9CqGz5oPugb36IyIDqIhO8Ec379MT+rjWO3LtFNUdHwjOlLXqTT
         NwLyOQMYaBuu9+rkit0NKceugea5szO56gs39ldbvL6K9q52E/hjqiBxFCA1ZI0YsVoK
         NpDqB2ZQC7lRgUDZscqRJXGtiZxs3WmPlZ4Y5B3HaPardVAH+0MkjoK5Ny6DJqUu9g5w
         eF53gUgZ3FEd8xc+jEJjGfNWF3SXnKXyk3bGk3GEBPxSQwfB9623r+0nH6bhgINQv8ER
         EJLiDryVSc6/k6NvcFWnTANM3bNhrjyQiWb6F3JrtwykEuftvI7qUJ+XEJcWRQXXfoqU
         LroA==
X-Gm-Message-State: APjAAAUQcxpcUPNPUKBBcxO0T7b2OW+j8UKR1R7ggXRtCRepQXvykMjS
        FuqpDKiMkvTnuRame5Kh7vPf+r4WDFc+82DqZiI=
X-Google-Smtp-Source: APXvYqwYpXqBQF84QksHwVnXIu9UxJim3RCQk+JoE9MIZLRNPMowE8wJ6Pjaah7f6JnP/Cu7NDYPM+5DSGjuN7deBx4=
X-Received: by 2002:ab0:6419:: with SMTP id x25mr27895844uao.20.1552639769564;
 Fri, 15 Mar 2019 01:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190314223130.31802-1-wsa+renesas@sang-engineering.com>
 <20190314223130.31802-3-wsa+renesas@sang-engineering.com> <CAMuHMdWvCUJ4S1U-jR2fG=JSXO3KMbbO2=hWPOxqQDXzGMXi0g@mail.gmail.com>
 <20190315082917.GA1176@kunai>
In-Reply-To: <20190315082917.GA1176@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Mar 2019 09:49:17 +0100
Message-ID: <CAMuHMdUbzp4qMbJ-ci4k0fMOwOoYSY_JBZ_tWThZUjcJEd48eA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] mmc: renesas_sdhi: prevent overflow for max_req_size
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Mar 15, 2019 at 9:29 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > -       /* DMAC can handle 0xffffffff blk count but only 1 segment */
> > > -       .max_blk_count  = 0xffffffff,
> > > +       /* DMAC can handle 32bit blk count but only 1 segment */
> > > +       .max_blk_count  = UINT_MAX / TMIO_MAX_BLK_SIZE,
> >
> > I have mixed feelings about this change:
> >   1. You're lying about the actual maximum (yes, there's a comment that
> >      mentions the real limit),
>
> We can't utilize the actual maximum without converting the MMC core to
> u64. Given that the above max_blk_count is still way beyond any
> practical value, I am OK with the above.
>
> >   2. This fixes the problem in this single (set of) drivers only, while about
> >      every other driver (not the mmc core) calculates
> >      "max_blk_size * max_blk_count", too.
>
> I glimpsed, too, and found various patterns. We could maybe add a
> warning to the MMC core, but other than that I fail to see a way to
> handle it in a generic way. I'll think about it some more. Or do you
> have an idea already?

No idea, else I would have told you ;-)

> >   3. Some drivers use different limits (e.g. 2048, 4095, or 4096), so
> >      eventually having a common upper limit is not easy.
>
> I don't understand this one. Which limit do you mean here? blk_size?

Yes, blk_size.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
