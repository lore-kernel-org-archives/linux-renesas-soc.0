Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:33476 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbeGLMQ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jul 2018 08:16:29 -0400
MIME-Version: 1.0
References: <1531312174-17489-1-git-send-email-phil.edworthy@renesas.com>
 <1531312174-17489-3-git-send-email-phil.edworthy@renesas.com>
 <CAMuHMdWHPp4kGzPqkhCKOxNSiKgkrb=w76tofSb4SwP5DF5tdw@mail.gmail.com>
 <TY1PR01MB1769F9774BC336B8670704BBF55A0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <TY1PR01MB1769386775A40ABEF1D891F4F5590@TY1PR01MB1769.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1769386775A40ABEF1D891F4F5590@TY1PR01MB1769.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jul 2018 14:07:00 +0200
Message-ID: <CAMuHMdUELgebhwKT_dc_+7cm=cvra-UbtouRkj_8vSKiAs0Y7Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: 8250_dw: Add compatible string for Renesas
 RZ/N1 UART
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        ed.blake@sondrel.com, Stefan.Potyra@elektrobit.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Phil,

On Thu, Jul 12, 2018 at 2:03 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 11 July 2018 16:02, Phil Edworthy wrote:
> > On 11 July 2018 13:42, Geert Uytterhoeven wrote:
> > > On Wed, Jul 11, 2018 at 2:30 PM Phil Edworthy wrote:
> > > > The Renesas RZ/N1 UART is based on the Synopsys DW UART, but has
> > > > additional registers for DMA. This patch does not address the
> > > > changes required for DMA support, it simply adds the compatible string.
> > > >
> > > > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > >
> > > Thanks for your patch!
> > >
> [...]
> > > > --- a/drivers/tty/serial/8250/8250_dw.c
> > > > +++ b/drivers/tty/serial/8250/8250_dw.c
> > > > @@ -693,6 +693,7 @@ static const struct of_device_id
> > > > dw8250_of_match[]
> > > = {
> > > >         { .compatible = "snps,dw-apb-uart" },
> > > >         { .compatible = "cavium,octeon-3860-uart" },
> > > >         { .compatible = "marvell,armada-38x-uart" },
> > > > +       { .compatible = "renesas,uart-rzn1" },
> > >
> > > renesas,rzn1-uart
> I missed this comment. I followed the renesas convention of renesas,peripheral-device
> that is used for most R-Car drivers, but happy to change.

"renesas,<peripheral>-<family-or-device>" is the old scheme, which we cannot
change for existing devices due to backwards compatibility.

"renesas,<family-or-device>-<peripheral>" is the "new" scheme, consistent
with other vendors.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
