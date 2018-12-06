Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:43477 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728648AbeLFM46 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 07:56:58 -0500
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Dec 2018 13:56:45 +0100
Message-ID: <CAMuHMdUgYFkYrpnpOdrE5ce-pHSUqLPPs=gheitp5sAnu=srEQ@mail.gmail.com>
Subject: phandles using absolute paths in DT overlays
To: Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

Some early revisions of SoCs may have hardware bugs that need to be
fixed up in DT.  Currently we are handling this by including DTS files
and fixing up nodes and properties, to create different DTB files for
different SoC revisons (see arch/arm64/boot/dts/renesas/*es1*).

As an alternative, I'm envisioning the use of DT overlays and the
fdtoverlay tool, in the hope of simplifying the generation of DTBs for
the various SoC/board combinations.

Ideally, such DTBs would not contain symbols, to avoid inflating DTB
size.  Hence if fixup overlays would not contain symbolic references,
there would be no need for symbols.

For anchors, the "&{/path/to/node@address}" syntax is working fine.
For phandles, while documented on
https://elinux.org/Device_Tree_Mysteries, and while working fine for the
non-overlay case, dtc seems to have issues interpreting the DTB:

    $ scripts/dtc/dtc -I dtb -O dts my.dtb  | less
    <stdout>: ERROR (property_name_chars):
/__fixups__:/path/to/node@deadbeef: Bad     character '/' in property
name
    ERROR: Input tree has errors, aborting (use -f to force output)

With -f, the fixup generated seems to contain the expected value, though:

    __fixups__ {
        /path/to/node@deadbeef = "/fragment@0/__overlay__:power-domains:0";
    };

When using ftdoverlay, the situation is worse:

    Failed to apply my.dtb (-1)

Are these known issues?
Thanks for your comments!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
