Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB1165ECF439A79E31978ACF228A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
 <20170316175112.27913-4-chris.brandt@renesas.com> <CAMuHMdXAvMoLu5azcBfX5pH_KYApcYSipBktpbfLybvnCG+bwg@mail.gmail.com>
 <SG2PR06MB1165ECF439A79E31978ACF228A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Mar 2017 14:33:05 +0100
Message-ID: <CAMuHMdWm=4My_H-i-fNpXY9knSLpN+-zNarC5Xdq08kgvauM_w@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: r7s72100: add rtc clock to device tree
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        RTCLINUX <rtc-linux@googlegroups.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Mar 17, 2017 at 2:20 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Friday, March 17, 2017, Geert Uytterhoeven wrote:
>> > --- a/arch/arm/boot/dts/r7s72100.dtsi
>> > +++ b/arch/arm/boot/dts/r7s72100.dtsi
>> > @@ -117,6 +117,15 @@
>> >                         clock-output-names = "ostm0", "ostm1";
>> >                 };
>> >
>> > +               mstp6_clks: mstp6_clks@fcfe042c {
>> > +                       #clock-cells = <1>;
>> > +                       compatible = "renesas,r7s72100-mstp-clocks",
>> "renesas,cpg-mstp-clocks";
>> > +                       reg = <0xfcfe042c 4>;
>> > +                       clocks = <&p0_clk>;
>> > +                       clock-indices = <R7S72100_CLK_RTC>;
>> > +                       clock-output-names = "rtc0";
>>
>> "rtc"? There's only one.
>
> The rtc-sh.c code wants to have a number at the end. So if I just put "rtc" as the clock name, it does not find it. Again, I didn't want to break any SH builds, so I just changed the DT to match the driver.

Hmm...

> [ from the rtc-sh.c code ]
>
>         clk_id = pdev->id;
>         /* With a single device, the clock id is still "rtc0" */
>         if (clk_id < 0)
>                 clk_id = 0;
>
>         snprintf(clk_name, sizeof(clk_name), "rtc%d", clk_id);
>
>         rtc->clk = devm_clk_get(&pdev->dev, clk_name);

So in the absence of an "rtc0" clock in the device node (you don't have
"clock-names" properties in the rtc devvice node yet), it will fall back to
clk_get_sys(), and will find the global "rtc0" clock. Unless you call it
"rtc"...

Most drivers using a single clock just pass NULL instead of a name, so it
will match the first clock found.

I think the simplest solution is to check if your device is instantiated
from DT (pdev->dev.of_node != NULL), and pass NULL (or "fck", when you add
multiple clocks to the DT bindings) to devm_clk_get() if that's the case.

>         if (IS_ERR(rtc->clk)) {
>                 /*
>                  * No error handling for rtc->clk intentionally, not all
>                  * platforms will have a unique clock for the RTC, and
>                  * the clk API can handle the struct clk pointer being
>                  * NULL.
>                  */
>                 rtc->clk = NULL;
>         }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
