Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9F4C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 09:35:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1BCF21872
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 09:35:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbfCOJfN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 05:35:13 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:42085 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726886AbfCOJfN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 05:35:13 -0400
Received: by mail-ua1-f67.google.com with SMTP id s26so2877261uao.9;
        Fri, 15 Mar 2019 02:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=urduKvEEWeEGDo89MiTTi+K5bPRHGCdt1vQxqsIRIzU=;
        b=Mms5ul5SWDuSUKvG4ngiXXRCup7/eqxB/opobPjqlEC7brPL2YtPMp2ERhdpm5KVV6
         rgcDOP2ltjOqOyS0DkCFdCVCH4g5Aqkk5JUEpFboczoqmnoiaZWgZUl7MTFW53DlEa4B
         6qA22yD3ifuJ+AJzPPcfChmxUY7kuHNX5OMxpDE4gNqbrYrkLMISNAwycUUXuxWqjjVT
         XrpY81uMzNuo+C1292LEj7L7S2KSvslp9RjUzhxwCl+0CCOz0MnQLxC8kCwn8Km+EYpK
         HajNT/9FYcvlWUGkzRP7PPJYJgEPAYHE/da1l+w+iB7r3ZhfGb1dgYc7JJO6ORMdbK1q
         hzew==
X-Gm-Message-State: APjAAAUpWNTURVC/jrilY0tLbLO5j9PkCumlp5fAAWOndsUwR7UIqItd
        m/sLPSBp55DkTtmnjd3Jz3+HUKBgoGI45KD5oy4=
X-Google-Smtp-Source: APXvYqyMXwgC87z3XsRxHumaqQUnCpyVGNEPkoGIhhq/9iWptrhnrIszKH8gohkYXAK8F2vKuVIR7U129DGPZwUTIM4=
X-Received: by 2002:a9f:2f0b:: with SMTP id x11mr27086268uaj.78.1552642512084;
 Fri, 15 Mar 2019 02:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190314223130.31802-1-wsa+renesas@sang-engineering.com>
 <20190314223130.31802-3-wsa+renesas@sang-engineering.com> <CAMuHMdWvCUJ4S1U-jR2fG=JSXO3KMbbO2=hWPOxqQDXzGMXi0g@mail.gmail.com>
 <20190315082917.GA1176@kunai> <CAMuHMdUbzp4qMbJ-ci4k0fMOwOoYSY_JBZ_tWThZUjcJEd48eA@mail.gmail.com>
 <20190315092854.GB1176@kunai>
In-Reply-To: <20190315092854.GB1176@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Mar 2019 10:35:00 +0100
Message-ID: <CAMuHMdVEdU9CLSMzJWiDn5brc8bXNBemma=Zk4XtF4wsXHeb7Q@mail.gmail.com>
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

On Fri, Mar 15, 2019 at 10:28 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > >   3. Some drivers use different limits (e.g. 2048, 4095, or 4096), so
> > > >      eventually having a common upper limit is not easy.
> > >
> > > I don't understand this one. Which limit do you mean here? blk_size?
> >
> > Yes, blk_size.
>
> I am still confused. Which upper limit do you mean then? Because for

TMIO_MAX_BLK_SIZE

> blk_size and blk_count, they are both driver specific, or?

Yes, they are driver-specific.  So you cannot use a common upper limit.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
