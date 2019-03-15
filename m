Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17605C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 09:47:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E407521872
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 09:47:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728652AbfCOJrJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 05:47:09 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:37490 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726886AbfCOJrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 05:47:09 -0400
Received: by mail-vk1-f194.google.com with SMTP id p190so2053944vke.4;
        Fri, 15 Mar 2019 02:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E1Aril1O4Q+XAKi0pRN2+iYOJ4/xIWCuC63YIIeiHIM=;
        b=PJlZQ/H0Bfq5/z7OPwbyFx2c1+sJiP2nR5KhaP8fg9pVX+D5aMYmK42LyZxriU/U3t
         QnO8g8B5l8ZuBsKLaRPWvY3tAHeFlIRk6AJC6JEJMtNh3y/GUk5DhJD0Tw1ntkIeWGDv
         rW52JH8ennIOVPOIb3adCIv+sjUwpPj8z8avoZHQaVngWicNMRQ2jLM25RXm4/thpCmt
         Du38tM7y28pF6ban9XwRgUePcbN9HasjCMgZCNc+3KGslwjircV6bbZAQ4CE1B5+Ksdg
         Ns+RZEUMw0on+M/CPs2PGXnrxpYZX8K5g104aAWMcLdJJDOIs7yiWfEeS5QDLhhRw+VD
         muXQ==
X-Gm-Message-State: APjAAAXUyIyolhUl/Lbr/a0XMbf0KP6moJX1+5UWqIrSQrO9SFygXrKd
        EfAwF7qZNZeSobI1tUn8u82f9yFVIW9d9W9HiGU=
X-Google-Smtp-Source: APXvYqz4+T+TMqTHrM06z1I3C4Xi1KcLwpqN/kGiGbb3097Rfit2n6Fy6oFC+Vt7dkdItufxvWAd0uYE74wMC8VF6WQ=
X-Received: by 2002:a1f:ae07:: with SMTP id x7mr1573098vke.74.1552643228275;
 Fri, 15 Mar 2019 02:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190314223130.31802-1-wsa+renesas@sang-engineering.com>
 <20190314223130.31802-3-wsa+renesas@sang-engineering.com> <CAMuHMdWvCUJ4S1U-jR2fG=JSXO3KMbbO2=hWPOxqQDXzGMXi0g@mail.gmail.com>
 <20190315082917.GA1176@kunai> <CAMuHMdUbzp4qMbJ-ci4k0fMOwOoYSY_JBZ_tWThZUjcJEd48eA@mail.gmail.com>
 <20190315092854.GB1176@kunai> <CAMuHMdVEdU9CLSMzJWiDn5brc8bXNBemma=Zk4XtF4wsXHeb7Q@mail.gmail.com>
 <20190315093941.GC1176@kunai>
In-Reply-To: <20190315093941.GC1176@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Mar 2019 10:46:55 +0100
Message-ID: <CAMuHMdUmNSk3n1EEaYQpXV-Pwa3d9O8UDARx+zF5c_BYqrR5rg@mail.gmail.com>
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

On Fri, Mar 15, 2019 at 10:39 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > I am still confused. Which upper limit do you mean then? Because for
> >
> > TMIO_MAX_BLK_SIZE
> >
> > > blk_size and blk_count, they are both driver specific, or?
> >
> > Yes, they are driver-specific.  So you cannot use a common upper limit.
>
> And this is why I think my patch has a valid approach. But I am still
> not sure I am getting your point.

My worry here is that if several drivers would do

       .max_blk_count  = UINT_MAX / DRIVER_SPECIFIC_MAX_BLK_SIZE,

Those drivers can safely calculate "max_blk_size * max_blk_count".
People may start assuming this is always safe. while the core cannot do
"GLOBAL_MAX_BLK_SIZE * max_blk_count" using 32-bit arithmetic, as the
latter may still overflow, depending on the driver.

But perhaps I'm just too overcautious...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
