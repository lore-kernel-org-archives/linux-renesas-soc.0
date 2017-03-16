Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34790 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751475AbdCPLFa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2017 07:05:30 -0400
Received: by mail-it0-f66.google.com with SMTP id r141so6043414ita.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2017 04:05:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170316110013.kmjytn4jipo6sacj@ninjato>
References: <20170316110013.kmjytn4jipo6sacj@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Mar 2017 12:05:26 +0100
Message-ID: <CAMuHMdXjjZgjRqmzQYtqTQGuMv6qWrG+GVeQK37mpNK2AU-eoQ@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topic/sdhi-dma-sync-v3 for renesas drivers
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Mar 16, 2017 at 12:00 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> here is an updated topic branch (v3 instead of v2) for renesas-drivers,
> also rebased to current mmc/next. Please pull.
>
> Kind regards,
>
>    Wolfram
>
>
> The following changes since commit 05d1ea17f58de925e46d97b305d3cacbb84a0eb6:
>
>   Merge branch 'fixes' into next (2017-03-14 17:19:20 +0100)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-dma-sync-v3
>
> for you to fetch changes up to 1309db3202ae35b0372f414dbc50ad6889027b5e:
>
>   mmc: tmio: always unmap DMA before waiting for interrupt (2017-03-16 11:37:58 +0100)

Looks fine, thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
