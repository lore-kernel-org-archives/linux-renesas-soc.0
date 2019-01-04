Return-Path: <SRS0=AhbF=PM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F26C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 09:01:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F9C621871
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 09:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbfADJB0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Jan 2019 04:01:26 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:45210 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727414AbfADJB0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jan 2019 04:01:26 -0500
Received: by mail-vs1-f65.google.com with SMTP id x28so22276964vsh.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jan 2019 01:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E/yYzpIOAnHZpxbodo3QGzij6rnk4+olfxKJ0yZmM5U=;
        b=t1d7w9UARrRNGgkQMAzBvs4pPtg06eydOtdoFV7PpFCRY2THodESBi2U7KH0BlsBXf
         inV+RbKVFj3ryGFT/KE+i/Sl7Y84bpa6G/CteaOB90FR5xYeXoaiRmqTXotqnNQryyFh
         XgBZBTioGufWv8IwKU5Kk5AbpKYZnCWbx3Jnu71ahYj6Y6XwwatBr0k81oD0pNK0C+b3
         f8A0QCtMzr9vVFmcXFWsViI8H6Pn8X5uQOa+bGWRitaYMqUAAumh1PlX8wt5ekWWLgDN
         LTZ9pihPwI8x5DFb73ijfqJzBQt2nIQVrHSBcuLdRSXWrc+3Z/ObmL0udY0YPtq6eRPR
         1MEA==
X-Gm-Message-State: AA+aEWZ0o/0rCFzGSEu6YjZWYx/bBGVcpch6zyUI1WV/IPt2EXyM3D49
        YiOLQg6TyZaWgQxESrnYq0EeFVvF4Y5RCWf5mMY=
X-Google-Smtp-Source: AFSGD/VfoxwFycOjRvAcRUQyoN1BvrZC76ZOtcRjxNgPvbu5f0Cwsu3oekR06Rvbdv9KoOz8NN3RTWJj9snhgn0TKJM=
X-Received: by 2002:a67:c202:: with SMTP id i2mr18425620vsj.11.1546592485576;
 Fri, 04 Jan 2019 01:01:25 -0800 (PST)
MIME-Version: 1.0
References: <20190102095154.25839-1-horms+renesas@verge.net.au>
 <CAMuHMdU=aR8mSwd876LV=DG_vh6Bx45zxRTfMXuX3BQpy0M=ow@mail.gmail.com> <20190104085720.36ccxhtcbyyzgfrk@verge.net.au>
In-Reply-To: <20190104085720.36ccxhtcbyyzgfrk@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Jan 2019 10:01:13 +0100
Message-ID: <CAMuHMdWf=_-WZT9XUqPCZocNs1As3RJnXMYRYc05Y4td6SciFg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable R-Car thermal driver
To:     Simon Horman <horms@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Fri, Jan 4, 2019 at 9:57 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Jan 02, 2019 at 11:45:37AM +0100, Geert Uytterhoeven wrote:
> > On Wed, Jan 2, 2019 at 10:53 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> > > Enable the R-Car thermal driver as a built-in.
> > >
> > > This driver is used in conjunction with the R-Car V3M (r8a77970),
> > > E3 (r8a77990) and D3 (r8a77995) SoCs.
> >
> > > [v2] Enable as a built-in rather than a module as this seems
> > >      safer from the point of view of protecting equipment from
> > >      overheating.
> >
> > Shouldn't the above paragraph be moved below the ---?
>
> I have recently come to believe that its a matter of taste. And I think in
> this case it captures important information that is worthy of inclusion in
> the changelog.

The rationale behind doing it this way could still be appended to the first line
of the body of the patch decription.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
