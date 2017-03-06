Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34872 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753965AbdCFQms (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 11:42:48 -0500
MIME-Version: 1.0
In-Reply-To: <1503576.T3vfvR3RGC@avalon>
References: <1488817556-21410-1-git-send-email-geert+renesas@glider.be> <1503576.T3vfvR3RGC@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Mar 2017 17:36:41 +0100
Message-ID: <CAMuHMdVw7nR1EG_+3Vjm6HdUKtq+jvbO6AbQk5WT2dEs7JDqmg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: drm: rcar-du: Document optional reset properties
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Mar 6, 2017 at 5:32 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Monday 06 Mar 2017 17:25:56 Geert Uytterhoeven wrote:
>> Document the optional properties for describing module resets, to
>> support resetting display channels and LVDS encoders on R-Car Gen2 and
>> Gen3.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This looks good to me.
>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> I think we should try implementing support for reset in the DU driver before
> merging this though, it always helps to test the proposed DT bindings.

Do you want me to drop the DU parts from my big patches to add all resets
to the .dtsis I was going to send?

DU is the special one, as it doesn't have a one-to-one mapping of resets
to modules.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
