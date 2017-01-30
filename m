Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:50821 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753956AbdA3Tt4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 14:49:56 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linus Walleij <linus.walleij@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ext Tony Lindgren <tony@atomide.com>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [RFC 0/5] Renesas RZ series pinctrl driver
Date: Mon, 30 Jan 2017 19:49:03 +0000
Message-ID: <SG2PR06MB1165CB4BFE1A58D9FC3B43948A4B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <CACRpkdYzbquN_5eFepT6BhNgfM2FxwrjvYsMRD4o2NN4-O4kfw@mail.gmail.com>
 <CAMuHMdV=MAy5m99za=31k+81kGYmNyXuTPdYu0APcpj0SfCY_A@mail.gmail.com>
 <1834948.XJ6SzFDPBZ@avalon>
In-Reply-To: <1834948.XJ6SzFDPBZ@avalon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Monday, January 30, 2017, Laurent Pinchart wrote:
> > It depends on the actual hardware: while per-pin settings are suitable
> > for SoCs that have per-pin hardware configuration (e.g. RZ/A1), it's
> > not suitable for SoCs where that's not the case, and where the
> > hardware has group-wise configuration (e.g. on R-Car).
> >
> > Hence IMHO "the future of Renesas pin control" will remain a split
> > personality for a while ;-)
> >
> > Laurent: please kick me if you disagree...
>=20
> I unfortunately agree. Maybe we could try to speed up the process by
> providing feedback to the hardware engineers ?

For what it's worth, I fired off my 'rant and rave' last week about the
current R-Car PFC block so I'll be curious to see what they say. Of
course, I'm on the RZ side of the company, so maybe someone on the R-Car
side might have better luck.


Chris
