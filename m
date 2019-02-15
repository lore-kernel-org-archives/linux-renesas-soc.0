Return-Path: <SRS0=NmnW=QW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9728CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 18:02:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 722DE21A4C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 18:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730184AbfBOSCm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Feb 2019 13:02:42 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:42116 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbfBOSCm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Feb 2019 13:02:42 -0500
Received: by mail-ua1-f42.google.com with SMTP id d21so3506790uap.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Feb 2019 10:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x7YveOb8bR68ldYV0QpmFwHvwRyvSt6WS4lcDb0uTmU=;
        b=Q8+weDm8qRnZswWxJ7LuNjtRXyIwIXurjtFp9ujqZOuwGJuOtBr4FO7rFyQBMzQmtN
         NQB9HOW/g0iFHEravCiBlcxPxaX8SfCZvMGB4qxsCmHODpL419rtGOHul0NHcNA0cDl7
         rRe0Dbes/TCpmLynK7bZEhRhlA51+Xr6Rr9jOsa8hktiDH1JAoOe+YNrZwqegtxAnYVR
         Oa3Z+SHOHuPs4j6l2FsT4UfDBK04Wvq2t7fNuO6RmJDesa5GyqmuLFg4v/hDQd2n8gx4
         TlcflZMWywmUJgLr4PhpXRttC3kAqBlcOB5KdYWWI29rTnizb8VH5nxqvP4a00mtInbB
         1eqw==
X-Gm-Message-State: AHQUAubyuRhU14gHUuPzISPmqLQcygYg5x+95bADVI0/iZAohz7qLbvv
        6ODX2GQl6oEuZ2mQooYyNTWug/2WOU2U1YC3tL10qv/D
X-Google-Smtp-Source: AHgI3IbTCsqP/3DHAoNDOqSoMdgxVUP6xLUa1BbXFUHMaWi8RhxPetF6ODycI88vh4NzxHE1syBxBEQmHGF2xIvw3vw=
X-Received: by 2002:ab0:7251:: with SMTP id d17mr5646535uap.0.1550253761704;
 Fri, 15 Feb 2019 10:02:41 -0800 (PST)
MIME-Version: 1.0
References: <TY1PR01MB1562B1C04915AB16AE53D95B8A600@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562B1C04915AB16AE53D95B8A600@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Feb 2019 19:02:29 +0100
Message-ID: <CAMuHMdUxW_7vgFtN+MM2cXEaDcHVabnoHBYM+OpwMODLzEyBbA@mail.gmail.com>
Subject: Re: what happened to /proc/vmallocinfo as of v4.15?
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Fri, Feb 15, 2019 at 5:14 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> I just noticed this yesterday and I can't seem to figure it out.
>
> In linux-4.14, vmallocinfo looked like this:
>
> $ cat /proc/vmallocinfo
> 0xc2800000-0xc2802000    8192 of_iomap+0x19/0x22 phys=0xe8201000 ioremap
> 0xc2802000-0xc2804000    8192 of_iomap+0x19/0x22 phys=0xe8202000 ioremap
> 0xc2804000-0xc2806000    8192 l2x0_of_init+0x3f/0x174 phys=0x3ffff000 ioremap
> 0xc2806000-0xc2808000    8192 of_iomap+0x19/0x22 phys=0xfcfe0000 ioremap
> 0xc2808000-0xc280a000    8192 unpurged vm_area
> 0xc280a000-0xc280c000    8192 unpurged vm_area
> 0xc280c000-0xc280e000    8192 of_iomap+0x19/0x22 phys=0xfcfe0000 ioremap
> 0xc280e000-0xc2810000    8192 of_iomap+0x19/0x22 phys=0xfcfe0000 ioremap
> 0xc2810000-0xc2812000    8192 of_iomap+0x19/0x22 phys=0xfcfe0000 ioremap
>
>
> However as of linux-4.15, it now looks like this:
>
> $ cat /proc/vmallocinfo
> 0x2423e1ec-0x1d348857    8192 of_iomap+0x19/0x22 phys=0xe8201000 ioremap
> 0x1d348857-0x52c37840    8192 of_iomap+0x19/0x22 phys=0xe8202000 ioremap
> 0x52c37840-0x402f3b08    8192 l2x0_of_init+0x3f/0x174 phys=0x3ffff000 ioremap
> 0x402f3b08-0x06d553ef    8192 of_iomap+0x19/0x22 phys=0xfcfe0000 ioremap
> 0x06d553ef-0xf6dfcceb    8192 unpurged vm_area
> 0xf6dfcceb-0xd99b6570    8192 unpurged vm_area
> 0xd99b6570-0xa32d8fae    8192 of_iomap+0x19/0x22 phys=0xfcfe0000 ioremap
> 0xa32d8fae-0xffd15855    8192 of_iomap+0x19/0x22 phys=0xfcfe0000 ioremap
> 0xffd15855-0x9d2cc6ea    8192 of_iomap+0x19/0x22 phys=0xfcfe0000 ioremap
>
>
> The virtual addresses are all wrong!
>
> I can't seem to find any patches or code changes that would explain this.
>
> Does anyone have an idea why it now looks like this?

Please see commit ad67b74d2469d9b8 ("printk: hash addresses printed with %p").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
