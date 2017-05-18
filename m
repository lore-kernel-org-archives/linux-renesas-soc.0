Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:34819 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755342AbdERMmh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2017 08:42:37 -0400
Received: by mail-it0-f48.google.com with SMTP id c15so99061491ith.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 May 2017 05:42:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <TY1PR06MB099210D9B30BA7EB7F276455D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1495043888-20934-1-git-send-email-Petre_Pircalabu@mentor.com>
 <TY1PR06MB09928E2327894F8E9E7738D4D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAMuHMdV4z8TBdBAsWCLNZ4r8vE7Qa-6_X711A2RtBwEa_RNrgg@mail.gmail.com>
 <TY1PR06MB0992B8DC97323FF06A0B7BA3D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAMuHMdVzk6yqV8nB9OrfnQRHG3X=5o2D4wiu_87p0aBzAqBZkg@mail.gmail.com> <TY1PR06MB099210D9B30BA7EB7F276455D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 May 2017 14:42:35 +0200
Message-ID: <CAMuHMdWDkrBDhJZQHs2qHR3CL_oK9vb15hXXdLsCauCBw5o6ew@mail.gmail.com>
Subject: Re: [PATCH] phy: rcar-gen3-usb3: Initial support for xhci phy
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Petre Pircalabu <petre.pircalabu@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "horms@verge.net.au" <horms@verge.net.au>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "mirea_bogdan@mentor.com" <mirea_bogdan@mentor.com>,
        Petre Pircalabu <Petre_Pircalabu@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Thu, May 18, 2017 at 2:19 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>> From: Geert Uytterhoeven
>> Sent: Thursday, May 18, 2017 8:41 PM
>> On Thu, May 18, 2017 at 1:13 PM, Yoshihiro Shimoda
>> <yoshihiro.shimoda.uh@renesas.com> wrote:
>> >> >> +- reg: offset and length of the partial USB 3.0 Host PHY register block.
>> >> >> +- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
>> >> >
>> >> > I think we should add "clocks" property as required.
>> >> >
>> >> >> +Optional properties:
>> >> >
>> >> > You should add "renesas,use-on-chip-clk" here.
>> >> > And, the name of "use-on-chip-clk" is not good to me.
>> >> > FYI, my developing patch names "renesas,usb-extal".
>
> I'm sorry for this. I missed description "on-chip clock source is supplied though
> USB_EXTAL/USB_XTAL" in the manual. So, this "renesas,use-on-chip-clk" is reasonable.
>
>> >> Can this be decided at runtime, e.g. by looking at the rates of the clocks
>> >> to see which one is available/best suited?
>> >
>> > According to the HW manual, this module cannot see which one is available/best suited.
>> > So, I don't think this can be decided at runtime.
>>
>> I mean, can't Linux look at the rates of the two clocks, and if one is zero,
>> use the other?
>
> I still misunderstand your question though, but software cannot look at the rates
> of USB3S0_CLK_P/USB3S0_CLK_M and USB_EXTAL/XTAL because the HW doesn't have registers
> for indicating the rates.

If we have "clocks" properties, as you suggested, both clocks will have to
be described in DT.  Hence Linux will create clock objects for them, and the
USB PHY driver can call clk_get_rate() on those objects.

If no clock is connected to USB3S0_CLK_P/USB3S0_CLK_M, a dummy clock
with zero rate should be described in DT.

Cfr. the existing clocks with "clock-frequency = <0>" in r8a7795.dtsi.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
