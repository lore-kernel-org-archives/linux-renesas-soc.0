Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:43914 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750776AbeBWIFZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Feb 2018 03:05:25 -0500
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Feb 2018 09:05:24 +0100
Message-ID: <CAMuHMdUqvZEKu5v4E29ofjj09sv+Yxk41W4K+FnfqKQ=88AWRA@mail.gmail.com>
Subject: Overlay sugar syntax (was: Re: [PATCH v6 3/4] drm: rcar-du: Fix
 legacy DT to create LVDS encoder nodes)
To: Frank Rowand <frowand.list@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Frank,

On Fri, Feb 23, 2018 at 3:38 AM, Frank Rowand <frowand.list@gmail.com> wrote:
> I was hoping to be able to convert the .dts files to use sugar syntax
> instead of hand coding the fragment nodes, but for this specific set
> of files I failed, since the labels that would have been required do
> not already exist in the base .dts files that that overlays would be
> applied against.

Indeed, hence the fixup overlays use "target-path".

BTW, is there any specific reason there is no sugar syntax support in dtc
for absolute target paths? I guess to prevent adding stuff to a random
existing node, and to encourage people to use a "connector" API defined in
term of labels?

I'm also in the process of converting my collection of DT overlays to sugar
syntax, and lack of support for "target-path" is the sole thing that holds
me back from completing this. So for now I use a mix of sugar and
traditional overlay syntax.

In particular, I need "target-path" for two things:
  1. To refer to the root node, for adding devices that should live at
     (a board subnode of) the root node, like:
       - devices connected to GPIO controllers provided by other base or
         overlay devices (e.g. LEDs, displays, buttons, ...),
       - clock providers for other overlays devices (e.g. fixed-clock).
  2. To refer to the aliases node, for adding mandatory serialX aliases.

The former is the real blocker for me.

The latter doesn't work with plain upstream (hacky patches available), so
I'm working on getting rid of the serialX requirement in the serial driver.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
