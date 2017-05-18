Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:35275 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754479AbdERVun (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2017 17:50:43 -0400
Received: by mail-wm0-f43.google.com with SMTP id b84so216805522wmh.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 May 2017 14:50:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKYaQRm+H9Ayp=-jDEO476yW-k_TUzkKunOEZujKhA1X68xHbw@mail.gmail.com>
References: <1495043888-20934-1-git-send-email-Petre_Pircalabu@mentor.com>
 <TY1PR06MB09928E2327894F8E9E7738D4D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAMuHMdV4z8TBdBAsWCLNZ4r8vE7Qa-6_X711A2RtBwEa_RNrgg@mail.gmail.com>
 <TY1PR06MB0992B8DC97323FF06A0B7BA3D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAMuHMdVzk6yqV8nB9OrfnQRHG3X=5o2D4wiu_87p0aBzAqBZkg@mail.gmail.com>
 <TY1PR06MB099210D9B30BA7EB7F276455D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAMuHMdWDkrBDhJZQHs2qHR3CL_oK9vb15hXXdLsCauCBw5o6ew@mail.gmail.com> <CAKYaQRm+H9Ayp=-jDEO476yW-k_TUzkKunOEZujKhA1X68xHbw@mail.gmail.com>
From: Petre Pircalabu <petre.pircalabu@gmail.com>
Date: Fri, 19 May 2017 00:50:41 +0300
Message-ID: <CAKYaQR=W=+f__a5_aXQZSk8_344T2sNr1jJLZiwhyBd6XNLirg@mail.gmail.com>
Subject: Re: [PATCH] phy: rcar-gen3-usb3: Initial support for xhci phy
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "horms@verge.net.au" <horms@verge.net.au>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        Petre Pircalabu <Petre_Pircalabu@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert, Shimoda-san,

I have also used initialy the name "use-xtal-clk" to describe the
flag, but I've changed it to "use-on-chip-clk" to make a clear
distinction between the on-chip and the external clocks. If you think
"usb-extal" is more descriptive I can change he name to this value.

Regarding the clock, I suggest the distinction between them could be
made using predefined names.
E.g.:
..
clocks = <&clk1>, <&clk2>
clock-names = "external', "on-chip"
...

The device node can define none, one of both the clocks:
- If no clock is defined (e.g. backup compatibility with the
Salvator-X  board), the driver should not set any of the phy registers
and preserve the hw defaults (selects external)
- If only one clock is defined the PHY driver should be set-up
according to the name ("external" and "on-chip")
- if both clocks are defined (and valid), the driver should choose one
of them according to the "use-on-chip-clk" parameter (if present or
not). (the scenario of having 2 valid clocks and selecting the on-chip
one is possible, although I see no real application).

The default should be "no clocks defined" in order not to break any
existing (and not yet published) platforms.

Do you think this proposal is feasible?

Also, theoretically the driver should work also with r8a7795 ES2.0 and
r8a7796, but unfortunately I don't have access to neither a H3 ES2.0
nor a M3 platform. I can create a patch for these platforms, but I
would require your assistance in order to test it (I'm feeling a
little bit queasy in submitting an untested patch).

Best regards,
Petre

On Thu, May 18, 2017 at 11:21 PM, Petre Pircalabu
<petre.pircalabu@gmail.com> wrote:
> Hi Geert, Shimoda-san,
>
> First, thank you very much for your comments. I will refactor the
> patch and send a v2 patchset as soon as possible.
>
> To my understanding, although the RCAR Gen3 HW manual references the
> clk frequencies (50MHz for XTAL and 100MHz for external clock) the
> actual register description only allows choosing between between an
> on-chip clock and an external reference signal (no clock rate /
> divisor is specified in the PHY registers ).
> In my opinion, the "use-on-chip-clk" parameter was meant to
> differentiate between the internal/external references, and not to by
> a specific clock rate. My only concern here is that the device tree
> description of the hardware might be a little difficult to understand
> when compared to the actual description from SOC's HW manual.
>
> Many thanks for your support,
> Petre
>
>
>
> On Thu, May 18, 2017 at 3:42 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> Hi Shimoda-san,
>>
>> On Thu, May 18, 2017 at 2:19 PM, Yoshihiro Shimoda
>> <yoshihiro.shimoda.uh@renesas.com> wrote:
>>>> From: Geert Uytterhoeven
>>>> Sent: Thursday, May 18, 2017 8:41 PM
>>>> On Thu, May 18, 2017 at 1:13 PM, Yoshihiro Shimoda
>>>> <yoshihiro.shimoda.uh@renesas.com> wrote:
>>>> >> >> +- reg: offset and length of the partial USB 3.0 Host PHY register block.
>>>> >> >> +- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
>>>> >> >
>>>> >> > I think we should add "clocks" property as required.
>>>> >> >
>>>> >> >> +Optional properties:
>>>> >> >
>>>> >> > You should add "renesas,use-on-chip-clk" here.
>>>> >> > And, the name of "use-on-chip-clk" is not good to me.
>>>> >> > FYI, my developing patch names "renesas,usb-extal".
>>>
>>> I'm sorry for this. I missed description "on-chip clock source is supplied though
>>> USB_EXTAL/USB_XTAL" in the manual. So, this "renesas,use-on-chip-clk" is reasonable.
>>>
>>>> >> Can this be decided at runtime, e.g. by looking at the rates of the clocks
>>>> >> to see which one is available/best suited?
>>>> >
>>>> > According to the HW manual, this module cannot see which one is available/best suited.
>>>> > So, I don't think this can be decided at runtime.
>>>>
>>>> I mean, can't Linux look at the rates of the two clocks, and if one is zero,
>>>> use the other?
>>>
>>> I still misunderstand your question though, but software cannot look at the rates
>>> of USB3S0_CLK_P/USB3S0_CLK_M and USB_EXTAL/XTAL because the HW doesn't have registers
>>> for indicating the rates.
>>
>> If we have "clocks" properties, as you suggested, both clocks will have to
>> be described in DT.  Hence Linux will create clock objects for them, and the
>> USB PHY driver can call clk_get_rate() on those objects.
>>
>> If no clock is connected to USB3S0_CLK_P/USB3S0_CLK_M, a dummy clock
>> with zero rate should be described in DT.
>>
>> Cfr. the existing clocks with "clock-frequency = <0>" in r8a7795.dtsi.
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>
>> --
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a hacker. But
>> when I'm talking to journalists I just say "programmer" or something like that.
>>                                 -- Linus Torvalds
