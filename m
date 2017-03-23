Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35915 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751807AbdCWPLF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Mar 2017 11:11:05 -0400
Received: by mail-it0-f68.google.com with SMTP id 190so8052037itm.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Mar 2017 08:10:59 -0700 (PDT)
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Mar 2017 16:10:56 +0100
Message-ID: <CAMuHMdUSLXwHg0PrPXcxi8T9KNtN4X2=fZxwht3ktU5uMV8ibg@mail.gmail.com>
Subject: vsps DT property (was: Re: [PATCH 10/22] drm: rcar-du: Expose the
 VSP1 compositor through KMS planes)
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Sep 14, 2015 at 12:50 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c

> +int rcar_du_vsp_init(struct rcar_du_vsp *vsp)
> +{
> +       struct rcar_du_device *rcdu = vsp->dev;
> +       struct platform_device *pdev;
> +       struct device_node *np;
> +       unsigned int i;
> +       int ret;
> +
> +       /* Find the VSP device and initialize it. */
> +       np = of_parse_phandle(rcdu->dev->of_node, "vsps", vsp->index);
> +       if (!np) {
> +               dev_err(rcdu->dev, "vsps node not found\n");
> +               return -ENXIO;
> +       }

Apparently the "vsps" DT property was never documented in
Documentation/devicetree/bindings/display/renesas,du.txt.

Can you please fix that? Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
