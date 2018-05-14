Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:39440 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753532AbeENMwg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 May 2018 08:52:36 -0400
Received: by mail-ua0-f194.google.com with SMTP id v17-v6so8240076uak.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 May 2018 05:52:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180512080922.22025-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180512080922.22025-1-kieran.bingham+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 May 2018 14:52:34 +0200
Message-ID: <CAMuHMdUwdnrL2uJ-S4cp14+rLoON-2hj_DB3rGxDQobaV=yz2Q@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] drm/du/m3n
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Sat, May 12, 2018 at 10:09 AM, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Please consider including this release in renesas-drivers.
>
> --
> Regards
>
> Kieran
>
> The following changes since commit 6d08b06e67cd117f6992c46611dfb4ce267cd71e:
>
>   Linux 4.17-rc2 (2018-04-22 19:20:09 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/drm/du/m3n
>
> for you to fetch changes up to f1e9a22ac3cff749077f40bf1a149aaaf587ae2d:
>
>   drm: rcar-du: Add R8A77965 support (2018-05-05 17:11:20 +0300)

Thanks, merged clealy into today's linux-next.

> ----------------------------------------------------------------
> drm: rcar-du: Provide support for the M3-N
>
> The M3-N has non linear addressing of it's group objects, which was not

non-linear?
its

> supported by the rcar-du driver implementation due to asumptions on the
> match between a CRTC index, and the hardware indexes.
>
> Implement support to remove this assumption and enable the M3-N

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
