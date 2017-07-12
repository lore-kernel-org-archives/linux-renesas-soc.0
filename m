Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:37921 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753020AbdGLOTx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jul 2017 10:19:53 -0400
Received: by mail-it0-f50.google.com with SMTP id k192so13846805ith.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jul 2017 07:19:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <eebddb5b-f642-e9d3-451f-a2f2d7c68d38@ideasonboard.com>
References: <20170621090407.4093-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170621090407.4093-2-laurent.pinchart+renesas@ideasonboard.com> <eebddb5b-f642-e9d3-451f-a2f2d7c68d38@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jul 2017 16:19:45 +0200
Message-ID: <CAMuHMdVC67a43xf-9T9z19VSRGCh-KprzE0gOdZr2QLk2SGD-g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: rcar-du: Add HDMI outputs to R8A7796 device description
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Wed, Jul 12, 2017 at 3:51 PM, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Table 35.1 (in the DU datasheet) certainly shows that there is only an HDMI-IF0
> on the M3, but it's amusing that (and I was confused by the fact that) my
> r8a7796 board (Salvator-X) still has the HDMI1 populated. Of course I presume
> this is populated to keep the boards the same but is not connected in the chip.

Indeed.

BTW, the M3-W version also has unconnected USB3 and SATA connectors.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
