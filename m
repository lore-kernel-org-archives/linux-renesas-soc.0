Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:41976 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbeH0TrT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 15:47:19 -0400
MIME-Version: 1.0
References: <1534168353-4177-1-git-send-email-biju.das@bp.renesas.com>
 <1534168353-4177-3-git-send-email-biju.das@bp.renesas.com>
 <TYAPR01MB22852C09EE0730343974A6FFB7380@TYAPR01MB2285.jpnprd01.prod.outlook.com>
 <OSAPR01MB209892F965BBCA9FAB4268CAB8380@OSAPR01MB2098.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB209892F965BBCA9FAB4268CAB8380@OSAPR01MB2098.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Aug 2018 17:59:55 +0200
Message-ID: <CAMuHMdVtQNjcp441sJq2nPaf_r=LHDio7HLCGw_iXSAdB3WEzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7796: Add R8A774A1 PFC support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Tue, Aug 14, 2018 at 10:18 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: RE: [PATCH 2/2] pinctrl: sh-pfc: r8a7796: Add R8A774A1 PFC support
> > > From: Biju Das <biju.das@bp.renesas.com>
> > > Sent: 13 August 2018 14:53
> > >
> > > Renesas RZ/G2M (r8a774a1) is pin compatible with R-Car M3-W (r8a7796),
> > > however it doesn't have several automotive specific peripherals. Add a
> > > r8a7796 specific pin groups/functions along with common pin
> > > groups/functions for supporting both r8a7796 and r8a7794a1 SoC.
> > s|r8a7794a1|r8a774a1
>
> Will fix this and send v2.

No need for that, I can fix it up while applying.

> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.2.0.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
