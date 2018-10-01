Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:41933 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbeJAP2q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Oct 2018 11:28:46 -0400
Received: by mail-ua1-f68.google.com with SMTP id m7so733560uao.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Oct 2018 01:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20180928132743.cfjkakd6g33lqwwh@verge.net.au>
In-Reply-To: <20180928132743.cfjkakd6g33lqwwh@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Oct 2018 10:51:53 +0200
Message-ID: <CAMuHMdWGFXqS3nRij=NBU2fXnbG+R=qPFmjFcmXmzvP7=4cK=Q@mail.gmail.com>
Subject: Re: [GIT PULL LTSI-4.14] LTSI-v4.14 Backport of MSIOF and SDHI Fixes
To: Simon Horman <horms@verge.net.au>
Cc: Greg KH <greg@kroah.com>, ltsi-dev@lists.linuxfoundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Sep 28, 2018 at 3:27 PM Simon Horman <horms@verge.net.au> wrote:
> This is intended as a submission to LTSI-4.14. It is the backport
> of a fixes for sh-msiof and sdhi. All patches are present in v4.19-rc5.
>
> This pull-request is based on
> "[GIT PULL LTSI-4.14] LTSI-v4.14 Backport or I2C R-Car Fix"
> tagged as backport/v4.14.61/snapshot-to-v4.18+fixes-v2-flattened,
> which I have already sent a pull-request for.
>
> There are 3 patches.
>
> I have performed build testing of this backports on a wide range of
> defconfigs and I am not aware of any regressions over v4.14.40 (the
> baseline chosen when this work began).
>
>
> The following changes since commit 720043a4efbb3356db116d084c7b877ad41ee51a:
>
>   i2c: sh_mobile: fix leak when using DMA bounce buffer (2018-09-17 15:54:30 +0200)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git backport/v4.14.61/snapshot-to-v4.18+fixes-v3-flattened
>
> for you to fetch changes up to 2a2a48e9abb6ded92f9fb2b3e8fdf5d7a929e05b:
>
>   mmc: renesas_sdhi: Fix sampling clock position selecting (2018-09-28 14:42:13 +0200)

Thank you, these all look fine to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
