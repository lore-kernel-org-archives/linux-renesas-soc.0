Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37139 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727087AbeHHQFn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Aug 2018 12:05:43 -0400
Received: by mail-lf1-f67.google.com with SMTP id j8-v6so1628111lfb.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Aug 2018 06:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20180725143413.9728-1-geert+renesas@glider.be>
 <20180725143413.9728-5-geert+renesas@glider.be> <e52bfdab-5c23-a617-8bef-0c17ab831ec1@redhat.com>
 <CAMuHMdUuHcoZxFVFivBwD3LveeE8yQ+AnaWFr76kATG+rCzd=w@mail.gmail.com>
 <9305142a-8b88-8beb-dd95-02dd84881aa8@redhat.com> <CAMuHMdVFT5PuXGVuT7wobJd_m1X8SvY+XohJWNtB7b-59JXKhQ@mail.gmail.com>
 <ea6551f6-517b-4f51-4a50-72430efaad41@redhat.com>
In-Reply-To: <ea6551f6-517b-4f51-4a50-72430efaad41@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Aug 2018 15:45:44 +0200
Message-ID: <CAMuHMdWG3WWU7mve9P_kupj=O-OJZF8V1xkoh1XEEpDu0vNStA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3 4/4] hw/arm/sysbus-fdt: Add support for
 instantiating generic devices
To: Auger Eric <eric.auger@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <damm+renesas@opensource.se>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Eric,

On Wed, Aug 8, 2018 at 3:16 PM Auger Eric <eric.auger@redhat.com> wrote:
> On 08/08/2018 02:59 PM, Geert Uytterhoeven wrote:
> > On Tue, Aug 7, 2018 at 7:21 PM Auger Eric <eric.auger@redhat.com> wrote:
> >> On 08/07/2018 05:32 PM, Geert Uytterhoeven wrote:
> >>> On Tue, Aug 7, 2018 at 4:19 PM Auger Eric <eric.auger@redhat.com> wrote:
> >>>> On 07/25/2018 04:34 PM, Geert Uytterhoeven wrote:
> >>>>> Add a fallback for instantiating generic devices without a type-specific
> >>>>> or compatible-specific instantation method.  This will be used when no
> >>>>> other match is found.
> >>>>>
> >>>>> The generic instantation method creates a device node with "reg" and
> >>>>> (optional) "interrupts" properties, and copies the "compatible"
> >>>>> property and other optional properties from the host.

[...]

> Wouldn't it make sense to try getting 1-3 upstream separately as this
> last patch seems more controversial and independent?

I agree. I will rework and resubmit after my holidays.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
