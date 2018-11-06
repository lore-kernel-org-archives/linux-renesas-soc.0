Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:37124 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729241AbeKFT77 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 14:59:59 -0500
MIME-Version: 1.0
References: <20181105214117.11734-1-marek.vasut+renesas@gmail.com>
 <OSBPR01MB229351FF35C839C4E9A7F19CD8CB0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <7ab702f0-e78c-94c5-b74f-bac1803fb513@gmail.com>
In-Reply-To: <7ab702f0-e78c-94c5-b74f-bac1803fb513@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Nov 2018 11:35:13 +0100
Message-ID: <CAMuHMdWkbqizvAtP=ka9tiirNqb=CzhRxGdWY3VcTT_8-UrG+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a77990: Add SDHI device nodes
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Tue, Nov 6, 2018 at 11:32 AM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 11/06/2018 06:26 AM, Yoshihiro Shimoda wrote:
> >> From: Marek Vasut, Sent: Tuesday, November 6, 2018 6:41 AM
> >>
> >> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >>
> >> This patch adds SDHI{0,1,3} device nodes for the r8a77990 SoC.
> >>
> >> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Cc: Simon Horman <horms+renesas@verge.net.au>
> >> Cc: Wolfram Sang <wsa@the-dreams.de>
> >> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> ---
> >
> > Thank you for the patch!
> >
> > Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > I guess this patch and the 2/2 patch for ebisu have to be merged into a patch though.
>
> I wonder about that, 1/2 is adding SDHI DT nodes for an SoC, 2/2 is
> enabling SDHI on a particular board, which I think should be separate.

The arm-soc maintainers tend to disagree, that's why Shimoda-san asked
to combine them.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
