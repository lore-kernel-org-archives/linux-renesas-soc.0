Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:42250 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbeIQNJu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 09:09:50 -0400
Received: by mail-ua1-f66.google.com with SMTP id w7-v6so9976901uan.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 00:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20180914210304.30843-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20180914210304.30843-1-kieran.bingham+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Sep 2018 09:43:26 +0200
Message-ID: <CAMuHMdV_xnOe8O1YNddu-c-yZybdD8mW5tFaKy=KpuYDK-Eruw@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] du/2018q3
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Fri, Sep 14, 2018 at 11:03 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Please consider including this release in renesas-drivers.
>
> Please note - unlike the previous VSP1 pull request, which is a direct request
> of Laurent's v4l2/vsp1/next, this one is actually a branch on my tree.
>
> This pull request covers both Laurent's drm/du/next and one extra commit in my
> tree. It's a temporary fix. I expect either Laurent will pick up the revert, or
> we may have a better fix by the time you do a renesas-drivers release.
>
> Please feel free to drop this and use Laurent's updated drm/du/next branch as
> necessary.
>
>
> --
> Regards
>
> Kieran
>
> The following changes since commit 2dc7bad71cd310dc94d1c9907909324dd2b0618f:
>
>   Merge tag 'drm-misc-next-2018-09-13' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2018-09-14 09:43:16 +1000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git du/2018q3
>
> for you to fetch changes up to ebf4cb8acd5fff350500dae25a8e868c79e25b40:
>
>   drm: rcar-du: Revert "drm: rcar-du: Use __drm_atomic_helper_plane_reset instead of copying the logic" (2018-09-14 20:50:19 +0100)

Thank you, merges cleanly into next-20180913.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
