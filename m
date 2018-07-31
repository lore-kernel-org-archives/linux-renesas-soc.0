Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:41913 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732194AbeGaP30 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 11:29:26 -0400
Received: by mail-vk0-f68.google.com with SMTP id o82-v6so7521572vko.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Jul 2018 06:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20180614113550.g7fwz3klcwvxfdlv@verge.net.au> <CAMuHMdXBMpHdKpAfP_R-QRzS8KZMzeiJ89Becz=7uodMmAyvow@mail.gmail.com>
 <1616083.qxe8r8H64S@avalon>
In-Reply-To: <1616083.qxe8r8H64S@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Jul 2018 15:48:48 +0200
Message-ID: <CAMuHMdU=ydBv5RGTtQNSZZLs-zmGK1J__--e7ci+VKqD4QmEFQ@mail.gmail.com>
Subject: Re: [GIT/RFC PULL LTSI-4.14] Renesas SoCs and Drivers to v4.17
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Simon Horman <horms@verge.net.au>,
        ltsi-dev@lists.linuxfoundation.org,
        Hisao Munakata <hisao.munakata.vt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Wed, Jul 11, 2018 at 11:16 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thursday, 5 July 2018 13:55:00 EEST Geert Uytterhoeven wrote:
> > On Thu, Jun 14, 2018 at 1:36 PM Simon Horman <horms@verge.net.au> wrote:
> > > This series is comprised of backports to v4.14 of the following
> > > components from their standard as of v4.16 to that of v4.17:
>
> [snip]
>
> > I subjected it to the same testing I do for each renesas-drivers release.
> >
> > Regressions from v4.14.48:
>
> [snip]
>
> >   - Koelsch, Salvator-X (R-Car M3-W), Salvator-XS (R-Car H3 ES2.0):
> >
> >         +rcar-du feb00000.display: no connector for encoder
> > /soc/lvds@feb90000, skipping
> >
> >     Laurent: do you know what's missing?
>
> That message is printed when no connector node is linked in DT through OF
> graph to the encoder DT node output port. That's expected in this case as we
> have an LVDS encoder, but not connected panel. However,
> rcar_du_encoders_init_one() should return before printing that message due to
>
>         if (!of_device_is_available(entity)) {
>                 dev_dbg(rcdu->dev,
>                         "connected entity %pOF is disabled, skipping\n",
>                         entity);
>                 return -ENODEV;
>         }
>
> as the LVDS encoder nodes in DT should be disabled.

The LVDS encoder nodes were enabled in the following commits:
  - e5c3f4707f3956a2 ("ARM: dts: r8a7791: Convert to new LVDS DT bindings"),
    for Koelsch and Porter, but none of them has a connected panel?
  - 15a1ff30d8f9bd83 ("ARM: dts: r8a7790: Convert to new LVDS DT bindings"),
    for both LVDS instances on Lager, but the second one doesn't have a panel
    connected?

edb0c3affe5214a2 ("ARM: dts: r8a7793: Convert to new LVDS DT bindings")
for Gose did it right, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
