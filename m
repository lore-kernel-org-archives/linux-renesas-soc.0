Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:37678 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbeIFOBQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Sep 2018 10:01:16 -0400
Received: by mail-ua1-f68.google.com with SMTP id y10-v6so8175250uao.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Sep 2018 02:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <1536092527-5950-1-git-send-email-ykaneko0929@gmail.com> <20180906091827.jauhvbq6cudanlzl@verge.net.au>
In-Reply-To: <20180906091827.jauhvbq6cudanlzl@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Sep 2018 11:26:29 +0200
Message-ID: <CAMuHMdUci+P9YqDpfmeBP1peKT+a4b9FbF4FSv-9Wq2n87bZdA@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77995-draak: Add MSIOF ch2
 pins support
To: Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Sep 6, 2018 at 11:18 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Sep 05, 2018 at 05:22:07AM +0900, Yoshihiro Kaneko wrote:
> > From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> >
> > This patch adds support for MSIOF ch2 pinctrl to use the LVDS Control
> > Connector (CN41) for the Draak board on the R8A77995 SoC.
> >
> > Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > [ykaneko0929@gmail.com: deleted the unused reference to 'msiof_ref_clk']
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> Hi Kaneko-san,
>
> sorry about this but I think we should drop this patch as
> it is my understanding that msiof2 is not used on the Draak board.

The connector is described in the Hardware Manual as "LVDS CONT connector"
in the LVDS chaper, but it is not clear to me what exactly is supposed to
be connected to it, and how standard it is.
Laurent: do you know more?

Note that Ebisu has the same connector, but the signals are shared with
SW4, making them mutually exclusive.
The Ebisu Hardware Manual does mention the connector, but not in the
Display Output (LVDS) chapter.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
