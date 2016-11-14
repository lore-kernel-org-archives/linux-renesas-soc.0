Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34483 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753421AbcKNKQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 05:16:38 -0500
Received: by mail-it0-f65.google.com with SMTP id q124so13021736itd.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2016 02:16:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Nov 2016 11:16:36 +0100
Message-ID: <CAMuHMdWwSF4-LaqBe_PWvvROkjgMeJPaPZh4uxQcx0j4rGBCuw@mail.gmail.com>
Subject: Re: [PATCH 00/10] Renesas R8A7795/Salvator-X HDMI output
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        David Airlie <airlied@linux.ie>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Fri, Nov 11, 2016 at 6:07 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> This implements HDMI output support for the Renesas R8A7795 (H3) SoC and
> Salvator-X board.  It is based on mainline v4.9-rc4 and depends on Geert's
> "[PATCH v2 0/7] soc: renesas: Identify SoC and register with the SoC bus"
> series.
>
> It fixes two major issues in the previous RFC series:
>
> 1. It uses soc_device_match() to distinguish chip revisions instead of
> accessing the product register directly.
> 2. It describes the Gen3 HDMI encoder devices in a sane manner in the device
> tree, which also eliminates many contortions in the driver code.
>
> The "drm: bridge/dw_hdmi: add dw hdmi i2c bus adapter support" patch has
> been updated to version 6, and some minor non-essential parts (such as
> support for additional pixel formats) have been split off, to be addressed
> later.
>
> For testing, use the defconfig and enable CONFIG_VIDEO_RENESAS_VSP1,
> CONFIG_DRM_RCAR_VSP and CONFIG_DRM_DW_HDMI.

Thanks for your series!

Is this safe to add to next renesas-drivers release?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
