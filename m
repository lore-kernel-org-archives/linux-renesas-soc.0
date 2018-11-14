Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:40709 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727154AbeKNTAc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Nov 2018 14:00:32 -0500
MIME-Version: 1.0
References: <20181113124744.7769-1-geert+renesas@glider.be> <1090034354.41357.1542177021922@webmail.strato.com>
In-Reply-To: <1090034354.41357.1542177021922@webmail.strato.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Nov 2018 09:58:00 +0100
Message-ID: <CAMuHMdV=1GL43ogU3PO6u8x6f2gX-vdgBVON2+t+1QUJtj=Tkg@mail.gmail.com>
Subject: Re: [PATCH] reset: Add reset_control_get_count()
To: uli@fpond.eu
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Auger Eric <eric.auger@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        KVM list <kvm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 14, 2018 at 7:30 AM Ulrich Hecht <uli@fpond.eu> wrote:
> On November 13, 2018 at 1:47 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > Currently the reset core has internal support for counting the number of
> > resets for a device described in DT.  Generalize this to devices using
> > lookup resets, and export it for public use.
> >
> > This will be used by generic drivers that need to be sure a device is
> > controlled by a single, dedicated reset line (e.g. vfio-platform).
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > See https://lore.kernel.org/lkml/1539003437.11512.20.camel@pengutronix.de/
> > for the rationale to ensure a single, dedicated reset line.
> >
> >  drivers/reset/core.c  | 41 +++++++++++++++++++++++++++++++++++++++++
> >  include/linux/reset.h |  7 +++++++
> >  2 files changed, 48 insertions(+)
> >
> > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > index 654e20ff2d5da9d4..c32b755ec373c338 100644
> > --- a/drivers/reset/core.c
> > +++ b/drivers/reset/core.c

> > +/**
> > + * of_reset_control_get_count - Count number of resets available with a device
>
> Should be "reset_control_get_count", without of_ prefix.

Oops, thanks for catching!

Philipp: Do you want a v2 or incremental, or can you fix it up yourself?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
