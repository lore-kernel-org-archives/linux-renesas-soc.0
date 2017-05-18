Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34285 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752916AbdERIqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2017 04:46:09 -0400
Received: by mail-it0-f65.google.com with SMTP id d68so4014493ita.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 May 2017 01:46:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <TY1PR06MB09928E2327894F8E9E7738D4D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1495043888-20934-1-git-send-email-Petre_Pircalabu@mentor.com> <TY1PR06MB09928E2327894F8E9E7738D4D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 May 2017 10:46:07 +0200
Message-ID: <CAMuHMdV4z8TBdBAsWCLNZ4r8vE7Qa-6_X711A2RtBwEa_RNrgg@mail.gmail.com>
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

On Thu, May 18, 2017 at 4:53 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>> From: Petre Pircalabu
>> The USB30PHY of a RCAR-Gen3 XHCI device can select the reference clock
>> source. The 2 available options are the differential input clock pair
>> supplied on pins USB3S0_CLK_P / USB3S0_CLK_M (default) and the on-chip
>> clock source supplied through USB_XTAL/USB_EXTAL.
>>
>> The device can be configured to use the on-chip source by adding the
>> "renesas,use-on-chip-clk" option in the corresponding device tree node.
>>
>> Signed-off-by: Petre Pircalabu <Petre_Pircalabu@mentor.com>

>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
>> @@ -0,0 +1,22 @@
>> +* Renesas R-Car generation 3 USB 3.0 PHY
>> +
>> +This file provides information on what the device node for the R-Car generation
>> +3 USB 3.0 PHY contains.
>> +
>> +Required properties:
>> +- compatible: "renesas,rcar-gen3-usb3-phy" for a generic R-Car Gen3 compatible device.
>
> I would like to add "renesas,usb3-phy-r8a7795" and "renesas,usb3-phy-r8a7796".

"renesas,r8a7795-usb3-phy" etc.?

(I know all other Renesas PHY drivers use the old scheme)

>> +- reg: offset and length of the partial USB 3.0 Host PHY register block.
>> +- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
>
> I think we should add "clocks" property as required.
>
>> +Optional properties:
>
> You should add "renesas,use-on-chip-clk" here.
> And, the name of "use-on-chip-clk" is not good to me.
> FYI, my developing patch names "renesas,usb-extal".

Can this be decided at runtime, e.g. by looking at the rates of the clocks
to see which one is available/best suited?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
