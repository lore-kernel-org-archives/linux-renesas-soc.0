Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:38043 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751118AbcJZHdP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Oct 2016 03:33:15 -0400
MIME-Version: 1.0
In-Reply-To: <20161026033143.6617.5834.sendpatchset@little-apple>
References: <20161026033143.6617.5834.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Oct 2016 09:33:13 +0200
Message-ID: <CAMuHMdU3YRR+axpM4Xv-Tg_QkmfFuF55BuDeWN7pHMcBHqmDLQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix R-Car Gen3 crash when VSP is disabled
To: Magnus Damm <magnus.damm@gmail.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 26, 2016 at 5:31 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> The arm64 defconfig is as of v4.9-rc1 having the DU driver enabled
> as a module, however this is not enough to support R-Car Gen3. In

Nope, arm64 defconfig on v4.9-rc1:
# CONFIG_DRM_RCAR_DU is not set

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
