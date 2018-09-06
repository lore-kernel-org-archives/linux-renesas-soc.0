Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:34589 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbeIFOyM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Sep 2018 10:54:12 -0400
Received: by mail-ua1-f65.google.com with SMTP id r15-v6so8306736uao.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Sep 2018 03:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <1535703651-5152-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVWWUZ5b+2E0=xqADfFsuCY1=7L+uY3m+onz9Hr2OUaXw@mail.gmail.com> <OSBPR01MB2293C3CA56DA335829E4381BD8010@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2293C3CA56DA335829E4381BD8010@OSBPR01MB2293.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Sep 2018 12:19:14 +0200
Message-ID: <CAMuHMdVvscpSDX6X_j7c02RPV_6E8Df1Gz7Ci4Ssi46Pf5ehxA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: revise properties for usb 2.0
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Thu, Sep 6, 2018 at 12:09 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, September 5, 2018 9:59 PM
> > On Fri, Aug 31, 2018 at 10:22 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > R-Car Gen3 needs to enable/deassert clocks/resets of both usb 2.0
> > > host (included phy) and peripheral. Otherwise, other side device
> > > cannot work correctly. So, this patch revises properties of clocks
> > > and resets. After that, each device driver can enable/deassert
> > > clocks/resets by its self.
> > >
> > > Notes:
> > >  - To work the renesas_usbhs driver correctly when host side drivers
> > >    are disabled and the renesas_usbhs driver doesn't have multiple
> > >    clock management, this patch doesn't change the order of the clocks
> > >    property in each hsusb node.
> > >  - This patch doesn't have any side-effects even if the renesas_usbhs
> > >    driver doesn't have reset_control and multiple clock management.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > Thanks for your patch!
> >
> > I'm a bit confused about the HS-USB <-> EHCI/OHCI topology.
> > Can you please explain?
> >
> > Thanks!
>
> HS-USB <-> EHCI/OHCI topology on R-Car H3 is:
>
>  EHCI/OHCI ch0/3 ---+--- PHY (is included on the EHCI/OHCI) --- External pins
>  HS-USB ch0/3    ---+
>
>  EHCI ch1/2      ------- PHY (is included on the EHCI/OHCI) --- External pins
>  # These channels don't have HS-USB.

Thanks, that's the part is missed, and couldn't find immediately in the
HW manual.

So HS-USB is the usb device ("gadget") part, and EHCI/OHCI is the
usb host part?

>
> And module stops and resets of HS-USB and EHCI/OHCI topology on R-Car H3 is:
>
>  MSTP/RST703 ---+(OR)---+--- EHCI/OHCI ch0
>  MSTP/RST704 ---+       +--- HS-USB ch0
>
>  MSTP/RST702 --------------- EHCI/OHCI ch1
>  MSTP/RST701 --------------- EHCI/OHCI ch2
>
>  MSTP/RST700 ---+(OR)---+--- EHCI/OHCI ch3
>  MSTP/RST705 ---+       +--- HS-USB ch3
>
> Should I describe these topology on the commit log or somewhere?

Yes, I think that would be helpful.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
