Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:33819 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754627AbcIFIxV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 04:53:21 -0400
Received: by mail-oi0-f67.google.com with SMTP id v82so6343478oie.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Sep 2016 01:53:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1473150352-31081-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1473150352-31081-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Sep 2016 10:53:20 +0200
Message-ID: <CAMuHMdXQ3B1xjMdH+yeHX7y3wCXeS_Gct6eVXK_RnuJw4Fh+6A@mail.gmail.com>
Subject: Re: [PATCH 0/4] R-Car M3-W Salvator-X: Add ethernet support
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Sep 6, 2016 at 10:25 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> This patch series adds support for the RAVB ethernet controller on the M3-W
> (R8A7796) Salvator-X board.
>
> The patches are based on top of Simon's latest devel branch, with the
> following patches cherry-picked:
>
> [PATCH/RFT 1/8] clk: renesas: r8a7796: Add GPIO clocks
> [PATCH/RFT 4/8] gpio: rcar: Add r8a7796 (R-Car M3-W) support
> [PATCH/RFT 6/8] arm64: dts: r8a7796: Add GPIO device nodes

Thanks, very useful to have!

Howeveer, I thought the plan was to not add more hardware support to
r8a7796-salvator-x.dts that might not work with 64-bit memory, to avoid
this becoming a blocker when enabling 64-bit memory?

> I'd like to suggest merging the GPIO support without PFC if it helps getting
> ethernet support in v4.9, as this is a very handy feature for development.

In the mean time, Linus W. has pulled basic r8a7796 support from
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
tags/sh-pfc-for-v4.9-tag2, so Simon can pull it as well, and queue pinctrl
patches for the devices that are already declared in r8a7796-salvator-x.dts.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
