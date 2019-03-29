Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E764C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 13:01:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8959217F5
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 13:01:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729523AbfC2NBA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 09:01:00 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:41221 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729477AbfC2NBA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 09:01:00 -0400
Received: by mail-vs1-f67.google.com with SMTP id g187so1214720vsc.8;
        Fri, 29 Mar 2019 06:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IkSahWOCQhPh8XGZtOo2bwWc6e6ElbysgHKC4mB3VI4=;
        b=rWxtZXjALepfmeHoclTlo5UAyetaOp8YQFtcI4xNSnoc+JlAHm5gSYRt67dW19W3Lp
         fgjdjOL7JMFuOXOxch94lPfIGNI8EGCZlSh+r468DTCFzaCv3HOQk46e5j+t7PcclH22
         LmLF31DKp95ZReFsUq3svtm4F/xZ0OJDX0Iz+ln099+OYdxp0Q8hU7t+PP3Imh1ESD+W
         7OMiHti7vuTsKPwhGUAFGIKTXITUz25z9JHXTSAvF1UMew9O6c4nrsekxa5LdAPXWHcp
         aLbFIjDJtZCu4MsMkIfPlShn4CjJrObzOnfy22IN6aBUefOjsQjMgEcEEKL54IXEdFYF
         rm8g==
X-Gm-Message-State: APjAAAVpEyqut+MxmwmAStsMQKgjxOTmaY5Fv1U1dqNWNQtvG7kNnzIG
        xhF4go3dEUr79odgRsxux0j+VOxqhv6zAYZVBPw=
X-Google-Smtp-Source: APXvYqz7QazUNgMwCAKlqs5pRCcbCaF+L7nQgDotRM474Hgx3E3i7JXDSIJu8Z1XlRBqF9qHG5KXocBpnlsYmx/C4Vk=
X-Received: by 2002:a67:ba03:: with SMTP id l3mr21646139vsn.96.1553864458715;
 Fri, 29 Mar 2019 06:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <1522856931-6225-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20190327183555.GA23991@vmlxhi-102.adit-jv.com> <CAMuHMdXzspxfSTQSA980VcTusoXTWXDexJuKoOo5gaFGDypc1A@mail.gmail.com>
 <d3746902-bc33-f5f2-660a-4bda583e77d4@de.bosch.com> <a69eb7eb-451c-c32c-4772-798285f0cf9b@de.bosch.com>
 <0f1048cb-ebca-2e66-9b77-70297be96054@de.bosch.com> <CAMuHMdUd+0wt=eZ+M8NOYZOTzLX2VH7hpzbMyZC3+fJEnXrUkA@mail.gmail.com>
 <3dc6a66a-c057-af29-2a2e-c526a4d2a30a@de.bosch.com>
In-Reply-To: <3dc6a66a-c057-af29-2a2e-c526a4d2a30a@de.bosch.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Mar 2019 14:00:46 +0100
Message-ID: <CAMuHMdXKkjqNzoXVezO9Do-0y70-+71OkYuXC_FFz-7cFeNmjA@mail.gmail.com>
Subject: Re: [PATCH v2] serial: sh-sci: Support for HSCIF RX sampling point adjustment
To:     Dirk Behme <dirk.behme@de.bosch.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        "George G. Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Joshua Frkuska <joshua_frkuska@mentor.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Magnus Damm <magnus.damm@gmail.com>, Greg KH <greg@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dirk,

On Fri, Mar 29, 2019 at 1:13 PM Dirk Behme <dirk.behme@de.bosch.com> wrote:
> On 29.03.2019 10:46, Geert Uytterhoeven wrote:
> > On Fri, Mar 29, 2019 at 8:05 AM Dirk Behme <dirk.behme@de.bosch.com> wrote:
> >> On 28.03.2019 12:30, Dirk Behme wrote:
> >>> On 28.03.2019 11:16, Dirk Behme wrote:
> >>>> On 28.03.2019 10:24, Geert Uytterhoeven wrote:
> >>>>> On Wed, Mar 27, 2019 at 7:36 PM Eugeniu Rosca <erosca@de.adit-jv.com>
> >>>>> wrote:
> >>>>>> We've recently switched from rcar-3.7.x to rcar-3.9.x [1] kernel and
> >>>>>> the
> >>>>>> latter contains this patch [2] by virtue of rcar-3.9.0 commit [3],
> >>>>>> which
> >>>>>> mirrors v4.18-rc1 commit [4] in mainline.
> >>>>>>
> >>>>>> JFYI, quite far away in the delivery chain, we've received below
> >>>>>> report:
> >>>>>>
> >>>>>>> With this patch [2-4] there are reports about broken data
> >>>>>>> communication with 115200 baud with SXM module. Reverting
> >>>>>>> this patch results in successful communication, again.
> >>>>>>
> >>>>>> While this scarce information barely helps anybody, I thought that
> >>>>>> sharing it with you might be beneficial in case you collect several
> >>>>>> reports linked to this specific commit in future, meaning it
> >>>>>> potentially
> >>>>>> adds a regression.
> >>>>>>
> >>>>>> Also, if you are aware of any userland changes that might be
> >>>>>> required/assumed by this patch or in case you have any alternative
> >>>>>> ideas how to avoid reverting this patch, your feedback would be very
> >>>>>> appreciated.
> >>>>>
> >>>>> Thanks for your report!
> >>>>>
> >>>>> [TLDR: skip to the suggested fix below; I only noticed the bug after
> >>>>>          writing the below paragraphs, which are still useful
> >>>>> questions to
> >>>>>          let us reproduce the issue]
> >>>>>
> >>>>> Which SoC are you using?
> >>>>> I assume this is on a custom board, as Salvator-X(S) and ULCB have
> >>>>> external SCIF clock crystals, which allow to use a perfect 115200 bps,
> >>>>> hence the affected code path is not exercised:
> >>>>>
> >>>>>       sh-sci e6550000.serial: BRG: 115200+0 bps using DL 4 SR 32
> >>>>>       sh-sci e6550000.serial: Using clk scif for 115200+0 bps
> >>>>>
> >>>>> Does your board have an external SCIF clock? Which frequency?
> >>>>> Can you check the clock values and deviation for your configuration, by
> >>>>> changing the calls to print the above information from dev_dbg() to
> >>>>> dev_info()?
> >>>>>
> >>>>> Does adding the DIV_ROUND_CLOSEST(), as suggested in my review
> >>>>> of the posted patch, help?
> >>>>> Perhaps the sampling point shift is inverted? Does -shift work better?
> >>>>>
> >>>>> [possible solution]
> >>>>>
> >>>>>> +                               int shift = min(-8, max(7, deviation
> >>>>>> / 2));
> >>>>>
> >>>>> Oops, min and max are exchanged!
> >>>>>
> >>>>> I guess using
> >>>>>
> >>>>>       int shift = clamp(deviation / 2, -8, 7)
> >>>>>
> >>>>> instead fixes the issue?
> >>>>
> >>>>
> >>>> Uh, that was fast :) Many thanks!
> >>>>
> >>>> We will test this as fast as possible! But due to the long delivery
> >>>> chain Eugeniu mentioned this will take some time. I'll try my best to
> >>>> come back to you as fast as possible.
> >>>
> >>>
> >>> Just for the archives: We are testing the attached patch.
> >>
> >>
> >> * Testing the patch [5]
> >>
> >> - int shift = min(-8, max(7, deviation / 2));
> >> + int shift = clamp(deviation / 2, -8, 7);
> >>
> >> does *not* fix our issue. Or in other words: Testing was *not* successful.
> >
> > I'm sorry to hear that.
> >
> >> * However, from review point of view we think that it fixes a serious
> >> bug. So maybe it should be applied, anyhow?
> >
> > Yes, submitted.
> >
> >> * Using strace we managed to get some more information about the usage
> >> of the serial port [6]. With this, we are talking about 57600 and not 115200
> >>
> >> * Switching to dev_info() [7] as requested above we get
> >>
> >> [    0.553256] e6560000.serial: ttySC3 at MMIO 0xe6560000 (irq = 41,
> >> base_baud = 0) is a hscif
> >> [  161.418527] sh-sci e6560000.serial: BRG: 9600+0 bps using DL 1462 SR 19
> >> [  161.418543] sh-sci e6560000.serial: Using clk s3d1 for 9600+0 bps
> >> [  161.418813] sh-sci e6560000.serial: BRG: 57600-5 bps using DL 463 SR 10
> >> [  161.418824] sh-sci e6560000.serial: Using clk s3d1 for 57600-5 bps

> Do you have any idea what might be the difference between reverting
> "serial: sh-sci: Support for HSCIF RX sampling point adjustment" (works)
> and not reverting that (doesn't work for us), then?

Before that commit, the RX sampling point was not shifted.
After that commit, it was incorrectly shifted by -8[*].
With my fix, it is shifted by 7[*], to compensate for a clock rate that
is slightly off.

[*] In units of cycles of the sampling clock, which runs at SR * 57595 =
    575950 Hz.

However, doing the above calculation shows that's something wrong with
the formula used by the driver: with SR = 10, the default sampling point
at the center is at SR / 2 = 5, so the shift must be within [-4, +4], which
is exceeded by using a  value of 7.

    deviation = min_err * srr * last_stop / 2 / baud;

With:

    min_err = -5
    srr = 9
    last_stop = 19
    baud = 57600

Note that srr and baud are unsigned.  Hence the multiplication and
divisions are done in unsigned arithmetic, and we get deviation = 37282
instead of 0. Oops...

Fixed by:

-                       int deviation = min_err * srr * last_stop / 2 / baud;
+                       int deviation = (int)(min_err * srr * last_stop) / 2 /
+                                       (int)baud;

Before I sent a patch: Uli, shouldn't the formula use "(srr + 1)"
instead of "srr", as the actual sampling rate factor is one more than
the value programmed in HSSRR.SRCYC?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
