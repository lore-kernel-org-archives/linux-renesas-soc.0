Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:35943 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755620AbdGKIjo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2017 04:39:44 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXb1yAgw4AVvheYhPV=V9HeDCW2NdvhJWzoSz8i-mM3TQ@mail.gmail.com>
References: <1499693302-25120-1-git-send-email-geert+renesas@glider.be>
 <1499693302-25120-10-git-send-email-geert+renesas@glider.be>
 <CANqRtoSi8x7zqwV3Gp_n0dBe4Uw6LDRvC1Lheu+GrLZNYuxAHw@mail.gmail.com> <CAMuHMdXb1yAgw4AVvheYhPV=V9HeDCW2NdvhJWzoSz8i-mM3TQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 11 Jul 2017 10:39:42 +0200
Message-ID: <CAK8P3a1-yuxQ-m5h+u38TKoybfxrAF8XpwcB9xFYKePhukXaQw@mail.gmail.com>
Subject: Re: [PATCH 9/9] ARM: multi_v7_defconfig: Enable DMA for Renesas
 serial ports
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kevin Hilman <khilman@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE"
        <uclinux-h8-devel@lists.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 11, 2017 at 8:59 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> Whether we want to hide the option (and default to y if ARCH_RENESAS, i.e.
> ARM) is another question.  Note that that wouldn't reduce code maintainability,
> as the #ifdefs would be kept, and it would prevent building and testing
> with/without DMA on ARM.

arch/sh/configs/sdk7786_defconfig enables it, too, so it should at least be
a user-selectable option on SuperH if you do that.

     Arnd
