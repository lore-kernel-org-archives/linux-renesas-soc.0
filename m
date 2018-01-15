Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:36560 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753674AbeAOIaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 03:30:25 -0500
Received: by mail-qt0-f182.google.com with SMTP id a16so13231286qtj.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2018 00:30:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180112231430.26943-5-laurent.pinchart+renesas@ideasonboard.com>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com> <20180112231430.26943-5-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jan 2018 09:30:23 +0100
Message-ID: <CAMuHMdW4zWjSGfX1dqc7j-VnadNig_ijibHq8_v-1v1XACJhNA@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] drm: rcar-du: Convert LVDS encoder code to
 bridge driver
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Sat, Jan 13, 2018 at 12:14 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The LVDS encoders used to be described in DT as part of the DU. They now
> have their own DT node, linked to the DU using the OF graph bindings.
> This allows moving internal LVDS encoder support to a separate driver
> modelled as a DRM bridge. Backward compatibility is retained as legacy
> DT is patched live to move to the new bindings.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c

> +static void rcar_lvds_enable(struct drm_bridge *bridge)
> +{
> +       struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +       u32 lvdhcr;
> +       int ret;
> +
> +       WARN_ON(lvds->enabled);
> +
> +       ret = clk_prepare_enable(lvds->clock);

What about starting to use Runtime PM to manage the clock, and thus calling
pm_runtime_get_sync() here instead?
That will make the driver future-proof w.r.t. LVDS blocks in power domains.

You do need a "power-domains" property, though, which may complicate DT
runtime patching.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
