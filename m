Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:33006 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751669AbdF1Swz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jun 2017 14:52:55 -0400
Received: by mail-io0-f169.google.com with SMTP id h64so41007976iod.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jun 2017 11:52:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170628185055.16379-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170628185055.16379-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Jun 2017 20:52:53 +0200
Message-ID: <CAMuHMdVmH=kYHiKv3+p9gtv_kqLQf4y3ZYg2OonMaa3qsHo2Fw@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Setup planes before enabling CRTC to avoid flicker
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 28, 2017 at 8:50 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Commit 52055bafa1ff ("drm: rcar-du: Move plane commit code from CRTC
> start to CRTC resume") changed the order of the plane commit and CRTC
> enable operations to accommodate the runtime PM requirements. However,
> this introduced corruption in the first displayed frame, as the CRTC is
> now enabled without any plane configured. On Gen2 hardware the first
> frame will be black and likely unnoticed, but on Gen3 hardware we end up
> starting the display before the VSP compositor, which is more
> noticeable.
>
> To fix this, revert the order of the commit operations back, and handle
> runtime PM requirements in the CRTC .atomic_begin() and .atomic_enable()
> helper operation handlers.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Fixes: ...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
