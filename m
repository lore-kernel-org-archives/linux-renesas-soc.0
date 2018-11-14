Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:43825 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbeKNTkV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Nov 2018 14:40:21 -0500
MIME-Version: 1.0
References: <20181113124744.7769-1-geert+renesas@glider.be>
 <1090034354.41357.1542177021922@webmail.strato.com> <CAMuHMdV=1GL43ogU3PO6u8x6f2gX-vdgBVON2+t+1QUJtj=Tkg@mail.gmail.com>
 <1542187561.4095.1.camel@pengutronix.de>
In-Reply-To: <1542187561.4095.1.camel@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Nov 2018 10:37:40 +0100
Message-ID: <CAMuHMdXyud10A0mv0VeV+o1jJH8K012rGztD0vi26aFg4ZzxYA@mail.gmail.com>
Subject: Re: [PATCH] reset: Add reset_control_get_count()
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: uli@fpond.eu, Geert Uytterhoeven <geert+renesas@glider.be>,
        Auger Eric <eric.auger@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        KVM list <kvm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Philipp,

On Wed, Nov 14, 2018 at 10:26 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Wed, 2018-11-14 at 09:58 +0100, Geert Uytterhoeven wrote:
> > On Wed, Nov 14, 2018 at 7:30 AM Ulrich Hecht <uli@fpond.eu> wrote:
> > > On November 13, 2018 at 1:47 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > > > Currently the reset core has internal support for counting the number of
> > > > resets for a device described in DT.  Generalize this to devices using
> > > > lookup resets, and export it for public use.
> > > >
> > > > This will be used by generic drivers that need to be sure a device is
> > > > controlled by a single, dedicated reset line (e.g. vfio-platform).
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > > > --- a/drivers/reset/core.c
> > > > +++ b/drivers/reset/core.c
> > > > +/**
> > > > + * of_reset_control_get_count - Count number of resets available with a device
> > >
> > > Should be "reset_control_get_count", without of_ prefix.
> >
> > Oops, thanks for catching!
> >
> > Philipp: Do you want a v2 or incremental, or can you fix it up yourself?
>
> No need, I'll fix it up.

Thanks, and sorry for the typo.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
