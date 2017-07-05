Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35221 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750867AbdGEJ50 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2017 05:57:26 -0400
MIME-Version: 1.0
In-Reply-To: <20170702134001.4752-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170626162930.30240-2-laurent.pinchart+renesas@ideasonboard.com> <20170702134001.4752-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jul 2017 11:57:24 +0200
Message-ID: <CAMuHMdXi2=ELnyBPzDruNdHysOHXvZS+U-yxREyEEPQYm8D-cg@mail.gmail.com>
Subject: Re: [PATCH v2.1 1/2] dt-bindings: display: rcar-du: Add a VSP channel
 index to the vsps DT property
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Jul 2, 2017 at 3:40 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> On some R-Car SoCs a single VSP can serve multiple DU channels through
> multiple LIF instances in the VSP. The current DT bindings don't support
> specifying that kind of SoC integration scheme. Extend them with a VSP
> channel index.
>
> Backward compatibility can be ensured in drivers by checking the length
> of the vsps property and setting the channel to 0 when the property
> doesn't contain channel indices.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
