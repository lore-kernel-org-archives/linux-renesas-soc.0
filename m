Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:37372 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932870AbdERLkr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2017 07:40:47 -0400
Received: by mail-it0-f46.google.com with SMTP id g126so26127461ith.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 May 2017 04:40:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <TY1PR06MB0992B8DC97323FF06A0B7BA3D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1495043888-20934-1-git-send-email-Petre_Pircalabu@mentor.com>
 <TY1PR06MB09928E2327894F8E9E7738D4D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAMuHMdV4z8TBdBAsWCLNZ4r8vE7Qa-6_X711A2RtBwEa_RNrgg@mail.gmail.com> <TY1PR06MB0992B8DC97323FF06A0B7BA3D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 May 2017 13:40:40 +0200
Message-ID: <CAMuHMdVzk6yqV8nB9OrfnQRHG3X=5o2D4wiu_87p0aBzAqBZkg@mail.gmail.com>
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

On Thu, May 18, 2017 at 1:13 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>> >> +- reg: offset and length of the partial USB 3.0 Host PHY register block.
>> >> +- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
>> >
>> > I think we should add "clocks" property as required.
>> >
>> >> +Optional properties:
>> >
>> > You should add "renesas,use-on-chip-clk" here.
>> > And, the name of "use-on-chip-clk" is not good to me.
>> > FYI, my developing patch names "renesas,usb-extal".
>>
>> Can this be decided at runtime, e.g. by looking at the rates of the clocks
>> to see which one is available/best suited?
>
> According to the HW manual, this module cannot see which one is available/best suited.
> So, I don't think this can be decided at runtime.

I mean, can't Linux look at the rates of the two clocks, and if one is zero,
use the other?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
