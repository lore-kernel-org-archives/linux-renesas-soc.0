Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB1165C1109F74DF1F15E171D48AEE0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAHp75Vcy1OE+9htFx9k3kQhGARQPT1C0gg3SEKZd7ULu_vkUMA@mail.gmail.com>
 <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com>
 <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com>
 <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com>
 <CACRpkdZkNGSUvTrEdjbGKO1hr799QpJBGSHPVbsBibph7Jx61A@mail.gmail.com>
 <20170508160120.GB25206@w540> <CAHp75VfOMKOhpkec+htA6DRQhivpSmNXy1=Ayig1W+ZC84gTLw@mail.gmail.com>
 <SG2PR06MB1165C1109F74DF1F15E171D48AEE0@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 8 May 2017 21:26:46 +0300
Message-ID: <CAHp75VcBWgvpV9NjKwu2Am+XzKcwnL7cXC81g39w6O1XZfAPVQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and output-enable
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: jmondi <jacopo@jmondi.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 8, 2017 at 8:02 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Monday, May 08, 2017, Andy Shevchenko wrote:
>> On Mon, May 8, 2017 at 7:01 PM, jmondi <jacopo@jmondi.org> wrote:
>> > On Sun, May 07, 2017 at 09:52:49AM +0200, Linus Walleij wrote:
>> >> On Fri, Apr 28, 2017 at 4:53 PM, Andy Shevchenko
>> >> <andy.shevchenko@gmail.com> wrote:
>> >>
>> >> > Linus, for me it looks like better to revert that change, until we
>> >> > will have clear picture why existing configuration parameters can't
>> >> > work.
>> >>
>> >> Yeah I'll revert the binding for fixes.
>>
>> > As it seems we won't be able to proceed with the currently proposed
>> solution,
>> > would that be acceptable now that we use the "pinmux" property to add
>> > flags as BIDIR
>>
>> Can you explain what does this *electrically* mean?
>
> Bi-Directional:
>
> For any pin that needs to drive (send) or sense (receive) signals, the pin
> mux controller can only enable 1 direction of buffers (in this case, it
> only the output buffers). Therefore the appropriate bit in the
> 'bi-directional' register is set in order to enable the signal path in both
> directions (ie, enable the input buffers).

So, I see this way how it can be enabled:
1. IP_ENI + IP_ENO internally defines BiDi when PMC and PIPC bits are set
2. BiDi bit is set and BUFOE is set

Now the question is what the real use case for 2?

If we find one we need to rename and fix a description of the pin
control configuration property.

like:
@PIN_CONFIG_OUTPUT_INPUT_ENABLE: this will configure the pin as an output.
...
Note: As long as it's enabled the pin's input enabled as well and vice versa.

>> >  and SWIO_[INPUT|OUTPUT] directly there?
>
> In the hardware manual, there is a list of pin functions that if you want
> to use, you cannot use the stand pinmux register method that you use for
> all the other pins. Instead, you are instructed to do a different
> procedure. If course electrically, input/output buffers are still turned
> on/off or whatever, but the root reason of why you need to do this
> differently for these specific pin/function is not known.
>
> The "SWIO_" portion of the naming comes from the hardware manual which
> refers to this as "Software I/O Control Alternative Mode" (which in my
> opinion means the HW guys couldn't get the pin directions/buffers to be set
> automatically for some reason, so they decided it's the SW guys problem now
> for those pins)

Okay, these are related to pin muxing explicitly.
So, you have 10 functions overall?
What prevents you describe them accordingly and hide this
implementation detail in the driver?

>> Second question, what makes it differ to what already exists?
>
> We have 3 different flags (properties) that need to be specified for some
> pins in some circumstances.
> At first, we just tried to pass this additional information in when
> defining what function the pin should be just for those pins whose
> direction (ie, buffers) would not be set up automatically.
> However, this was rejected and we were told to pick from the existing set
> generic properties.
> But, 3 different generic pinctrl properties that fit what we needed didn't
> exist. So, we used the existing "input-enable" and "output-enable", but
> then created "bi-directional".

Yes, that figure helped me a lot to understand.

-- 
With Best Regards,
Andy Shevchenko
