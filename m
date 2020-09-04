Return-Path: <SRS0=yd6p=CN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FCBC433E2
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Sep 2020 07:14:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFF97206D4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Sep 2020 07:14:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728658AbgIDHOt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Sep 2020 03:14:49 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:33971 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728195AbgIDHOt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 03:14:49 -0400
Received: by mail-oo1-f66.google.com with SMTP id k63so1408014oob.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2020 00:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6dBulNM6t1NZHEoqhcQvmqZ0dXA0TVw2TTY2m9+6vkk=;
        b=bahjIsPJMtAxLI2F33LmWmUpNpJtDlEZQm7vbghp80gTC1ss0PFh+TIjd8DIHoRuBD
         UKfg9tnlvF55tKwua5ZffSCVvD3DVzkSDJOZ1+JRhTV7do62C9Wpht0hgAQk7zYAHQjC
         3YLwX0UK5eOXBLO+x3sPAvZcOo04unAwNw++R6MoeXdW30AkNM5z3PO2gQt9C9jr5TOy
         MVW88Z3yQgSdIo7kn3ZcX5T903dtAPrVsX0l2MUEAyngFbLEBY5j80eCEJbAGiUJ/dNM
         HiAObw05Jllx/h6VkFxwgpe1GrGL20D6QvIvw3CJe6xYYcC9kvi/ElGuTbymelRg+Wyf
         NQFQ==
X-Gm-Message-State: AOAM533GKR/CHRq6mLAWUjBTF+PUOdE5c3EmwX9L8tPA8u13pWCSAagr
        4a31Fdp2coSOVbUA99bGdSERFcpYz/jlShMXPNE=
X-Google-Smtp-Source: ABdhPJyT/vkpAfED6pfB6PAe5PwvX2VVnrWHbkLJz9/t5wjUCKLHdqSQg85Z8ZYSjB2xfjJPhyh0rPOMyCm327NKItc=
X-Received: by 2002:a4a:4201:: with SMTP id h1mr4790981ooj.1.1599203686817;
 Fri, 04 Sep 2020 00:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <87364czszt.wl-kuninori.morimoto.gx@renesas.com>
 <87y2m4yeck.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdVXiwkmEZg-GL64Eg6jTFnonXzPL+MKeXztS0ac9F-hKA@mail.gmail.com>
 <878sdqmmv7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878sdqmmv7.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Sep 2020 09:14:35 +0200
Message-ID: <CAMuHMdX+1GcC+NPQ=fqC2aM941GVapvOhGDbW=Wcz4pT3BwN4Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] soc: renesas: Merge if xxx into menu description
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Fri, Sep 4, 2020 at 2:03 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > >  config ARCH_EMEV2
> > > -       bool "SoC Platform support for Emma Mobile EV2"
> > > +       bool "SoC Platform support for Emma Mobile EV2" if ARM && ARCH_RENESAS
> > >         select HAVE_ARM_SCU if SMP
> > >         select SYS_SUPPORTS_EM_STI
> >
> > I'm not convinced duplicating these dependencies is better than a
> > big #if block.  It does allow you to sort all SoCs alphabetically, but that
> > mixes ARM32 and ARM64 parts, while choosing between ARM32 and ARM64
> > is an early and important decision (different ARCH= and CROSS_COMPILE=,
> > too).
> > In addition, only one set of Kconfig options is shown to the user
> > anyway.
>
> OK, so let's keep big #if block.
> So how about to having
>         "ARM32 platform support ..." and
>         "ARM64 platform support" ?
> We can keep both #if block and alphabetical order

Yes, that looks fine to me. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
