Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:47862 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932406AbdKORC1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 12:02:27 -0500
Received: by mail-qt0-f195.google.com with SMTP id d15so5385789qte.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2017 09:02:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171114230653.onmwsrcqrcvybq7r@ninjato>
References: <20171114230653.onmwsrcqrcvybq7r@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Nov 2017 18:02:26 +0100
Message-ID: <CAMuHMdVzGJGDGDbjbmszO38qyJt_4N5LBn3tfLqGHb5mnuLypg@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topic/mmc-delay-refactor-for-geert for
 renesas drivers
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Wed, Nov 15, 2017 at 12:06 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> here is a topic branch for renesas-drivers removing calls to udelay() in
> both, TMIO core and the MMC core itself. I hope they land upstream in
> v4.16. Would be nice to get them boot tested via renesas-drivers. The
> test page can be found here:
>
> https://elinux.org/Tests:mmc-delay-refactor
>
> The branch is based on mmc/next (which should be soon in v4.15-rc1).
>
> Thanks and kind regards,
>
>    Wolfram
>
>
> The following changes since commit 06641e8deae68ee2769c734158bc9170be257bb9:
>
>   sdhci-fujitsu: add support for setting the CMD_DAT_DELAY attribute (2017-11-07 13:43:23 +0100)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/mmc-delay-refactor-for-geert
>
> for you to fetch changes up to edfceba9d1b241e5258e80f997bb5579a5dea895:
>
>   mmc: core: use usleep_range rather than HZ magic in mmc_delay() (2017-11-14 23:47:24 +0100)

Thanks, looks good to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
