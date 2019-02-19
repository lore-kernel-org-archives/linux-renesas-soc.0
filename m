Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFB3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 13:33:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EC3E21773
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 13:33:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbfBSNdi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 08:33:38 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:43065 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfBSNdi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 08:33:38 -0500
Received: by mail-ua1-f67.google.com with SMTP id z11so6930828uaa.10;
        Tue, 19 Feb 2019 05:33:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ehi/1mGvdt4P10YsJeehmNF5Uf+Vr/BVJ1rA5o/1BAU=;
        b=Rw2RF+QcYhA6lSmb0/+xJGuEktskOFZ6RFyaWMrYa4iJfjWClo39n4vtrz/CSG/gJ8
         Z/6+oJLK7sdgn2HcsHhGwU0jOUlEd3rrkEmRQY7NIZLk+anmMZQ1HyiLXpoA8R7OWBkq
         FCRhvb2iOTMMK5Hc2/+TzAYtjRm2oM8TTdC6uqq5P3iw5Alia6+JZSc2ASvSwMTMGbZT
         RWgReUrmcN2FafDSkkJC2jDCKTVCBucF5Kh1YonR6Y8RoBO0Eql5RE/KIBbbOlhnefR/
         I4SGvTBvCX/hHTAkIZCY0WlZ1eQpp7ghTlTqoYF5jMQqbhiQ62XZTrsI4l1iEIuQzafM
         jmpg==
X-Gm-Message-State: AHQUAuadpQmQXY9b1uH0P0QRVacwNGgkmgNeYlE29hjor55s4KqL1jn0
        MywoVwK/qxOo8fme0Zhqpy1GxA/UJg7kh6ZkTqk=
X-Google-Smtp-Source: AHgI3IYE8I8UK76WqIE04bWM0j3QfOnbiMFUQDBapfmOP9a+BIQM2KRlLNGz3YOHHDsCUrRg/PmHByQltdm4nlHMKmA=
X-Received: by 2002:a9f:30dc:: with SMTP id k28mr7645892uab.75.1550583217326;
 Tue, 19 Feb 2019 05:33:37 -0800 (PST)
MIME-Version: 1.0
References: <20190217124126.7257-1-wsa+renesas@sang-engineering.com>
 <20190217124126.7257-2-wsa+renesas@sang-engineering.com> <CAMuHMdVLEeJ4i0rZKv8w2bAO5Q7StxqQWEEV611PPMGeE60JHA@mail.gmail.com>
 <20190218204122.j35itmqth3avo3a6@ninjato> <CAMuHMdUB--d6_tJ4oYnvSiXy0YNNoAtMqAyyGfK+qRuX4akhAA@mail.gmail.com>
 <20190219131852.c26hvxieficunmsj@ninjato>
In-Reply-To: <20190219131852.c26hvxieficunmsj@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Feb 2019 14:33:24 +0100
Message-ID: <CAMuHMdUmtVtyfRLgLo+=kMP_KOzPrzrwcHL6WaUd2tnzKnS0rA@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: gpio: fault-injector: add 'lose_arbitration' injector
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Feb 19, 2019 at 2:18 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > > > +       wait_for_completion_interruptible(&priv->scl_irq_completion);
> > > >
> > > > Error checking/propagation (-ERESTARTSYS)?
> > >
> > > Are you sure? ERESTARTSYS belongs to the "These should never be seen by
> > > user programs." group.
> >
> > How else can you inform the user the operation has been interrupted?
>
> Definately not by using something which is marked "should never be seen
> by user programs" :)
>
> In the worst case, I'll add:
>         if (ret) ret = -EINTR;
>
> I tested the current code with CTRL+C, there we get EOWNERDEAD back to
> userspace, even with my code not propagating anything. With sending
> SIGKILL, I got 143 which is not defined. I want to double check the
> latter first, might be my tests were flaky...

Where's the kernel code that returns EOWNERDEAD?
Must be hidden in a complex preprocessor macro, as git grep cannot find it :-(

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
