Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:43429 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750897AbeCFMaG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Mar 2018 07:30:06 -0500
MIME-Version: 1.0
In-Reply-To: <20180306035412.GU2650@umbus.fritz.box>
References: <CAMuHMdUqvZEKu5v4E29ofjj09sv+Yxk41W4K+FnfqKQ=88AWRA@mail.gmail.com>
 <20180306035412.GU2650@umbus.fritz.box>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Mar 2018 13:30:05 +0100
Message-ID: <CAMuHMdU54Bb8aObwaOuq6u7HO_LVhpGv9uMjGbt8VcKruop_tA@mail.gmail.com>
Subject: Re: Overlay sugar syntax (was: Re: [PATCH v6 3/4] drm: rcar-du: Fix
 legacy DT to create LVDS encoder nodes)
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Frank Rowand <frowand.list@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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

Hi David,

On Tue, Mar 6, 2018 at 4:54 AM, David Gibson
<david@gibson.dropbear.id.au> wrote:
> On Fri, Feb 23, 2018 at 09:05:24AM +0100, Geert Uytterhoeven wrote:
>> On Fri, Feb 23, 2018 at 3:38 AM, Frank Rowand <frowand.list@gmail.com> wrote:
>> > I was hoping to be able to convert the .dts files to use sugar syntax
>> > instead of hand coding the fragment nodes, but for this specific set
>> > of files I failed, since the labels that would have been required do
>> > not already exist in the base .dts files that that overlays would be
>> > applied against.
>>
>> Indeed, hence the fixup overlays use "target-path".
>>
>> BTW, is there any specific reason there is no sugar syntax support in dtc
>> for absolute target paths? I guess to prevent adding stuff to a random
>> existing node, and to encourage people to use a "connector" API defined in
>> term of labels?
>
> Only because it hasn't been implemented.  Using &{/whatever} should
> IMO generate a target-path and the fact it doesn't is a bug.
>
>> I'm also in the process of converting my collection of DT overlays to sugar
>> syntax, and lack of support for "target-path" is the sole thing that holds
>> me back from completing this. So for now I use a mix of sugar and
>> traditional overlay syntax.
>>
>> In particular, I need "target-path" for two things:
>>   1. To refer to the root node, for adding devices that should live at
>>      (a board subnode of) the root node, like:
>>        - devices connected to GPIO controllers provided by other base or
>>          overlay devices (e.g. LEDs, displays, buttons, ...),
>>        - clock providers for other overlays devices (e.g. fixed-clock).

>> The former is the real blocker for me.

> Below is draft patch adding target-path support.  The pretty minimal
> test examples do include a case using &{/}
>
> From 8f1b35f88395adea01ce1100c5faa27dacbc8410 Mon Sep 17 00:00:00 2001
> From: David Gibson <david@gibson.dropbear.id.au>
> Date: Tue, 6 Mar 2018 13:27:53 +1100
> Subject: [PATCH] Correct overlay syntactic sugar for generating target-path
>  fragments
>
> We've recently added "syntactic sugar" support to generate runtime dtb
> overlays using similar syntax to the compile time overlays we've had for
> a while.  This worked with the &label { ... } syntax, adjusting an existing
> labelled node, but would fail with the &{/path} { ... } syntax attempting
> to adjust an existing node referenced by its path.
>
> The previous code would always try to use the "target" property in the
> output overlay, which needs to be fixed up, and __fixups__ can only encode
> symbols, not paths, so the result could never work properly.
>
> This adds support for the &{/path} syntax for overlays, translating it into
> the "target-path" encoding in the output.  It also changes existing
> behaviour a little because we now unconditionally one fragment for each
> overlay section in the source.  Previously we would only create a fragment
> if we couldn't locally resolve the node referenced.  We need this for
> path references, because the path is supposed to be referencing something
> in the (not yet known) base tree, rather than the overlay tree we are
> working with now.  In particular one useful case for path based overlays
> is using &{/} - but the constructed overlay tree will always have a root
> node, meaning that without the change that would attempt to resolve the
> fragment locally, which is not what we want.
>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Thank you, seems to work fine on dtc.git.

Note that while the dtc part applies on the in-kernel copy of dtc, it
doesn't work there: "&{/}" behaves the same as "/" (i.e. no overlay
fragment is generated), but "&{/foo}" does create the overlay fragment.
Merging in Rob's for-next branch to upgrade Linux' copy of dtc fixes that.

Thanks a lot!
Converting my remaining overlay fragments to sugar syntax...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
