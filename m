Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:36242 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751620AbdHPHYC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 03:24:02 -0400
Received: by mail-pg0-f67.google.com with SMTP id y129so4596414pgy.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2017 00:24:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1502730455-8951-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1502730455-8951-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2017 09:24:01 +0200
Message-ID: <CAMuHMdVFL0KGVDN-V4nCREUfnH2kEWLp_dWkw-Xn2PvmSTyNGw@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] Display List Optimizations
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Mon, Aug 14, 2017 at 7:07 PM, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Please consider pulling the following changes into renesas-drivers.
>
> This series is based upon a merge of my previous pa-improvements/v4 and
> airlied-drm/drm-next to base on top of all pending VSP1 changes.

OK, so I'll drop your vsp1/pa-improvements/v2.

> The following changes since commit f44bd631453bf7dcbe57f79b924db3a6dd038bff:
>
>   Merge remote-tracking branch 'airlied-drm/drm-next' into vsp1/next (2017-08-08 19:51:06 +0100)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/vsp1/tlb-optimise-v2
>
> for you to fetch changes up to fa078611769415d7adbad208f1299d05bee3bda8:
>
>   v4l: vsp1: Reduce display list body size (2017-08-14 15:58:38 +0100)

Thank you, merges cleanly into today's linux-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
