Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:46571 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932933AbeFKLlY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jun 2018 07:41:24 -0400
Received: by mail-vk0-f65.google.com with SMTP id b134-v6so12037604vke.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jun 2018 04:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <1528474785-11778-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdX=Ys8aq0ehqu9gZchC9bKtgzF9-Tg6-DoTrzMX68SwTg@mail.gmail.com> <OSBPR01MB2103F004406C18F6630CD91BB8780@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103F004406C18F6630CD91BB8780@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Jun 2018 13:41:12 +0200
Message-ID: <CAMuHMdUHQ=AHPctY=b7sa0TVUwohP0-d4E2wSMXJ55EQfrLbYA@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/sh_cmt: wait for CMCNT on init
To: Biju Das <biju.das@bp.renesas.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Mon, Jun 11, 2018 at 1:21 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] clocksource/drivers/sh_cmt: wait for CMCNT on init
> > On Fri, Jun 8, 2018 at 6:24 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > > As per section 57A.3.5/69A.3.5/79.A.3.5 of rz/g/r-car gen2/3 hardware
> > > manual,it is mentioned that we need to provide 2 cycles in counter
> > > input clock (RCLK) for reflecting written data to counter behaviour.
> > > Adding sufficient wait to let the CMCNT register value settle before
> > > starting the timer channel.
> >
> > RCLK usually runs at ca. 32 kHz, so 32µs should be sufficient on R-Car
> > Gen2/3 and RZ/G1.
> > R-Mobile A1 is the exception: RCLK runs at 23 kHz, so you need 43µs to be
> > safe.
> >
> > > It fixes the error "sh_cmt ffca0000.timer: ch1: cannot clear CMCNT"
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> > > ---
> > > Hello,
> > >
> > > During cmt testing, the tool
> > > (tools/testing/selftests/timers/clocksource-switch.c)
> > > is complaining about the error "sh_cmt ffca0000.timer: ch1: cannot clear
> > CMCNT".
> > > The above patch fixes this issue is by adding sufficient wait to let
> > > the CMCNT register value settle before starting the timer channel.
> > >
> > > This issue is reproduced on Koelsch/RZ/G1[ME] based iwave boards
> > > etc..., as I assume the same issue should be present on lager etc. as well?
> >
> > > --- a/drivers/clocksource/sh_cmt.c
> > > +++ b/drivers/clocksource/sh_cmt.c
> > > @@ -328,7 +328,7 @@ static void sh_cmt_start_stop_ch(struct
> > > sh_cmt_channel *ch, int start)
> > >
> > >  static int sh_cmt_enable(struct sh_cmt_channel *ch)  {
> > > -       int k, ret;
> > > +       int j, k, ret;
> > >
> > >         pm_runtime_get_sync(&ch->cmt->pdev->dev);
> > >         dev_pm_syscore_device(&ch->cmt->pdev->dev, true);
> > > @@ -368,11 +368,17 @@ static int sh_cmt_enable(struct sh_cmt_channel
> > *ch)
> > >          * While at it, we're supposed to clear out the CMCNT as of this
> > >          * moment, so make sure it's processed properly here.  This will
> > >          * take RCLKx2 at maximum.
> > > +        *
> > > +        * Similar register access usage for CMCNT is mentioned in R-Car
> > > +        * Gen[2/3]/RZ/G1 user's manual, RCLKx2 for cmt0 and RCLKx2 or
> > > +        * CPϕx2 (CPEXϕx2)) for cmt1.
> > >          */
> > > -       for (k = 0; k < 100; k++) {
> > > -               if (!sh_cmt_read_cmcnt(ch))
> > > -                       break;
> > > -               udelay(1);
> >
> > 100 * 1µs = 100µs, so the original code should be sufficient?
>
> From the test results,  the original code is not sufficient. It needs 137 µs on koelsch platform to settle this value.
>
> > Or should it wait 42µs unconditionally, i.e. without checking CMCNT?
>
> Yes, Adding  wait 42µs unconditionally, just before the for loop also fixes the issue, since worst case wait is 137 µs.
> What is your suggestion here?
>
> > The datasheet mentions some other registers 2 RCLK cycles, too.
> > Should there be a fixed 2 RCLK delay in sh_cmt_write_cmcsr() and
> > sh_cmt_write_cmcor(), which are both called just before
> > sh_cmt_write_cmcnt()
> > above (all out of diff context)?
>
> I am not sure on this.
>
> > > +       for (j = 0; j < 2; j++) {
> > > +               for (k = 0; k < 100; k++) {
> > > +                       if (!sh_cmt_read_cmcnt(ch))
> > > +                               break;
> > > +                       udelay(1);
> > > +               }
> >
> > This is now two loops, with two checks for CMCNT, which looks strange to
> > me.
> > Do you have figures for the number of loops needed, for both the first (j=0)
> > and the 2nd (j=1) cycle?
>
> From the test results, first cycle  j=0, loop count(max)=100
> Second cycle  j=2, loop count(max)= 37.

137µs ~= 3 x 42µs, and there are 3 register writes above.
Is that a coincidence? ;-)

Does it work if you insert udelay(42) after the register writes in
sh_cmt_write_cmcsr(), sh_cmt_write_cmcor(), and sh_cmt_write_cmcnt()?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
