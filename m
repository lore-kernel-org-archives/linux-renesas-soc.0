Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36022 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754170AbcL0Mkp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2016 07:40:45 -0500
Received: by mail-it0-f65.google.com with SMTP id n68so33375457itn.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2016 04:40:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1480410283-28698-13-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480410283-28698-13-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Dec 2016 13:40:44 +0100
Message-ID: <CAMuHMdX3cJ+Ykv1aCgirQ4+6e8nU3yU6Yarq79kMAdGUs_WBrA@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] drm: rcar-du: Replace manual bridge
 implementation with DRM bridge
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Archit Taneja <architt@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Nov 29, 2016 at 10:04 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The rcar-du driver contains a manual implementation of HDMI and VGA
> bridges. Use DRM bridges to replace it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig           |   6 --
>  drivers/gpu/drm/rcar-du/Makefile          |   5 +-
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 104 +++++++++++++----------
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.h |   2 -
>  drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c | 134 ------------------------------
>  drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h |  35 --------
>  drivers/gpu/drm/rcar-du/rcar_du_vgacon.c  |  82 ------------------
>  drivers/gpu/drm/rcar-du/rcar_du_vgacon.h  |  23 -----
>  8 files changed, 60 insertions(+), 331 deletions(-)
>  delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
>  delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h
>  delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c
>  delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h
>
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 2bab449add76..06121eeba9e5 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -11,12 +11,6 @@ config DRM_RCAR_DU
>           Choose this option if you have an R-Car chipset.
>           If M is selected the module will be called rcar-du-drm.
>
> -config DRM_RCAR_HDMI
> -       bool "R-Car DU HDMI Encoder Support"
> -       depends on DRM_RCAR_DU
> -       help
> -         Enable support for external HDMI encoders.
> -

Please note this symbol is selected in several defconfigs, so these should
be updated with its replacement symbol.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
