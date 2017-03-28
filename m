Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 28 Mar 2017 16:38:22 +0200
From: jacopo@jmondi.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: pinctrl: Add RZ/A1 bindings doc
In-Reply-To: <CACRpkdYmitsPvv_1bsb-EKkhcWqaKNsLBfxZgf8cjVvcqCpYXA@mail.gmail.com>
References: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490026491-21742-3-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdWT6vJNmMhYzMEqYRbuT=W=ZuND-WfG812LfH0r0AzM_g@mail.gmail.com>
 <20170323160204.GL30223@w540>
 <CACRpkdYmitsPvv_1bsb-EKkhcWqaKNsLBfxZgf8cjVvcqCpYXA@mail.gmail.com>
Message-ID: <b9eaac8a63dced229bb152ba412e8ec1@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Linus,

On 2017-03-28 11:46, Linus Walleij wrote:
> On Thu, Mar 23, 2017 at 5:02 PM, jacopo <jacopo@jmondi.org> wrote:
> 
>>> > +  Required properties:
>>> > +    - renesas,pins
>>> 
>>> Just "pins"?
>>> 
>> 
>> You know, I've been thinking about this, bu the "pins" property
>> definition in pinctrl-bidings is the following one:
>> 
>> Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>> ---
>> - pins takes a list of pin names or IDs as a required argument. The
>>   specific binding for the hardware defines:
>>       - Whether the entries are integers or strings, and their
>>         meaning.
>> ---
>> 
>> And all examples there assume one "pin name" or "ID" per pin.
>> 
>> Now, we use 2 values per each pin (the pin ID and the alternate
>> function number), so to me this is different from what the generic
>> binding describes.
>> Also, pinctrl-single, and pinctrl-imx which have and ABI similar to
>> the one this driver define, use "pinctrl-single,pins" and "fsl,pins"
>> respectively as property names.
>> So either they have to be updated yet, or we should keep using
>> "renesas,pins" for our own defined ABI.
>> 
>> Maybe Linus or other pinctrl people can give some suggestion here.
> 
> To me as subsystem maintainer any "necessarily different" bindings
> are just a big confusion for the head.
> 

Understandable :)

> Since you're adding a new driver, try to stick to the generic bindings
> even if it deviates from what you are used to for Renesas, because
> even if it may be more work for you guys or make you annoyed that
> now a certain Renesas is different from all other Renesas platforms,
> for the community this makes things easier to maintain because
> we can look at the driver and its bindings and say "ah I know this".
> 
> The fact that historically all the early adopters of pinctrl in device 
> tree
> have these funky custom bindings is unfortunate but just something
> that we need to live with.
> 

To avoid any confusion, please bear with me and clarify this once and 
for all,
since I'm not certain I fully got you here.

Are you suggesting:

1) Use "pins" property with the currently implemented ABI (which 
slightly differs
    from the standard documented one as explained above. Not sure it is 
fine overriding
    it or not)

2) Use "pins" property and change our ABI to match the documented one: 
one ID (integer
    or string) per pin, not 2 as we're doing now.

Both solutions are easily implementable; 2) requires some more work to 
make pin id, function number
and pin configuration fit in one single integer, but is achievable for 
sure.

Thanks
    j

> Yours,
> Linus Walleij
