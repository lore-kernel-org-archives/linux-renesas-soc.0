Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:37855 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751951AbeCTJgM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 05:36:12 -0400
Received: by mail-qk0-f193.google.com with SMTP id w6so884010qkb.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Mar 2018 02:36:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180316163243.ymcnbdvpbvzrext2@verge.net.au>
References: <cover.1521208546.git.horms+renesas@verge.net.au> <20180316163243.ymcnbdvpbvzrext2@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Mar 2018 10:36:10 +0100
Message-ID: <CAMuHMdVcmSHxovU+qK=dhxZXxjkEpc=5B3_AP4LuoWoYEXq05A@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Updates for v4.17
To: Simon Horman <horms@verge.net.au>
Cc: arm@kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Mar 16, 2018 at 5:32 PM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, Mar 16, 2018 at 03:53:09PM +0100, Simon Horman wrote:
>> Please consider these Renesas ARM based SoC DT updates for v4.17.
>
> Unfortunately there seems to be a small problem with this pull request.
>
> "ARM: dts: r7s72100: add USB device to device tree" is already
> present upstream via Greg KH.

It is no longer present upstream, as it was reverted by Greg to avoid
conflicts.

Interestingly, "git log" doesn't show it:

$ git log --oneline v4.15..v4.16-rc1 -- arch/arm/boot/dts/r7s72100.dtsi
$

unless you explicitly mention the commit that created it:

$ git log --oneline v4.15..8a99b6ad4da2f90969bb2ebb426c1d3dd0089fa4 --
arch/arm/boot/dts/r7s72100.dtsi
8a99b6ad4da2f909 ARM: dts: r7s72100: add USB device to device tree
$

or reverted it:

$ git log --oneline v4.15..9836c09442c249b8e4f9646090d3259001cad432 --
arch/arm/boot/dts/r7s72100.dtsi
9836c09442c249b8 Revert "ARM: dts: r7s72100: add USB device to device tree"
8a99b6ad4da2f909 ARM: dts: r7s72100: add USB device to device tree
$

(both are in v4.16-rc1).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
