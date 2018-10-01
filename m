Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f196.google.com ([209.85.221.196]:40367 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728791AbeJAQpx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Oct 2018 12:45:53 -0400
Received: by mail-vk1-f196.google.com with SMTP id q184-v6so2826731vke.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Oct 2018 03:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180918085053.lu2k46vqffzj37ah@verge.net.au>
In-Reply-To: <20180918085053.lu2k46vqffzj37ah@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Oct 2018 12:08:38 +0200
Message-ID: <CAMuHMdUGKAepFFt5GMrUfqB78pOsYKwRYuOSNoyzAp0ijk+Z0g@mail.gmail.com>
Subject: Re: [GIT PULL LTSI-4.14] LTSI-v4.14 Backport or I2C R-Car Fix
To: Simon Horman <horms@verge.net.au>
Cc: Greg KH <greg@kroah.com>, ltsi-dev@lists.linuxfoundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
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
>
> ----------------------------------------------------------------
> Second Round of LTSI-v4.14 Backports of I2C R-Car Fixes
>
> Base:
> * v4.14.61
> * Backports of components for Renesas SoCs to v4.18
> * First round of Backports of I2C R-Car Fixes
>
> Backport of post-v4.18 fix for i2c-shmobile and I2C core
> The focus of these fixes is to make DMA buffer handling safe
>
> ----------------------------------------------------------------
> Peter Rosin (1):
>       i2c: smbus: kill memory leak on emulated and failed DMA SMBus xfers
>
> Wenwen Wang (1):
>       i2c: core: smbus: fix a potential missing-check bug
>
> Wolfram Sang (8):
>       i2c: dev: mark RDWR buffers as DMA_SAFE
>       i2c: refactor i2c_master_{send_recv}
>       i2c: add i2c_master_{send|recv}_dmasafe
>       i2c: smbus: use DMA safe buffers for emulated SMBus transactions
>       i2c: add docs to clarify DMA handling
>       i2c: refactor function to release a DMA safe buffer
>       i2c: sh_mobile: define start_ch() void as it only returns 0 anyhow

Somehow I missed that the above introduces a (rightful) compiler warning:

    drivers/i2c/busses/i2c-sh_mobile.c: In function ‘start_ch’:
    drivers/i2c/busses/i2c-sh_mobile.c:616:10: warning: ‘return’ with
a value, in function returning void
       return -EOPNOTSUPP;
              ^
    drivers/i2c/busses/i2c-sh_mobile.c:611:13: note: declared here
     static void start_ch(struct sh_mobile_i2c_data *pd, struct
i2c_msg *usr_msg,
                 ^~~~~~~~

as it depends on commit 7957c2e276ee73e6 ("i2c: sh_mobile: use core to
detect 'no zero length read' quirk"), which was not backported.

I think the easiest solution is to just drop "i2c: sh_mobile: define
start_ch() void as it only returns 0 anyhow", as it was meant not to
introduce any behavioral changes, and nothing depends on it.

Do you agree?
Thanks!

>       i2c: sh_mobile: fix leak when using DMA bounce buffer

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
