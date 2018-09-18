Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f193.google.com ([209.85.221.193]:36033 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbeIRPjz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 11:39:55 -0400
Received: by mail-vk1-f193.google.com with SMTP id i2-v6so269802vkg.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Sep 2018 03:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20180918085053.lu2k46vqffzj37ah@verge.net.au>
In-Reply-To: <20180918085053.lu2k46vqffzj37ah@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Sep 2018 12:07:50 +0200
Message-ID: <CAMuHMdVYPgfXvOzUOOLEwb_uy9Jo=V_Wkcr6mnTbo=YsAk2f0g@mail.gmail.com>
Subject: Re: [GIT PULL LTSI-4.14] LTSI-v4.14 Backport or I2C R-Car Fix
To: Simon Horman <horms@verge.net.au>
Cc: Greg KH <greg@kroah.com>, ltsi-dev@lists.linuxfoundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, Sep 18, 2018 at 10:51 AM Simon Horman <horms@verge.net.au> wrote:
> This is intended as a submission to LTSI-4.14. It is the backport
> of a fixes for safe DMA buffer handling for the SH-Mobile I2C driver
> and I2C code. All patches are present in v4.19-rc3.
>
> This pull-request is based on
> "[GIT PULL LTSI-4.14] LTSI-v4.14 Backport or I2C R-Car Fix"
> tagged as backport/v4.14.61/snapshot-to-v4.18+fixes-flattened,
> which I have already sent a pull-request for.
>
> There are 10 patches.
>
> I have performed build testing of this backports on a wide range of
> defconfigs and I am not aware of any regressions over v4.14.40 (the
> baseline chosen when this work began).
>
>
> The following changes since commit 4d4605e5c137ed9a53582e573118cbc16b82cbf1:
>
>   i2c: rcar: implement STOP and REP_START according to docs (2018-08-28 13:35:06 +0200)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git backport/v4.14.61/snapshot-to-v4.18+fixes-v2-flattened
>
> for you to fetch changes up to 720043a4efbb3356db116d084c7b877ad41ee51a:
>
>   i2c: sh_mobile: fix leak when using DMA bounce buffer (2018-09-17 15:54:30 +0200)

Thank, this all looks fine to me.

I subjected this to the same testing I do for each renesas-drivers release.
I have detected no regressions[*].

[*] The only regression I'm aware of is a regression in 4.14-stable, which can
    be fixed by "tick/nohz: Prevent bogus softirq pending warning".
    (https://lore.kernel.org/patchwork/patch/979451/).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
