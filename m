Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:37739 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753558AbdC1Jqd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 05:46:33 -0400
Received: by mail-it0-f44.google.com with SMTP id 190so12285966itm.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Mar 2017 02:46:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170323160204.GL30223@w540>
References: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490026491-21742-3-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdWT6vJNmMhYzMEqYRbuT=W=ZuND-WfG812LfH0r0AzM_g@mail.gmail.com> <20170323160204.GL30223@w540>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Mar 2017 11:46:30 +0200
Message-ID: <CACRpkdYmitsPvv_1bsb-EKkhcWqaKNsLBfxZgf8cjVvcqCpYXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: pinctrl: Add RZ/A1 bindings doc
To: jacopo <jacopo@jmondi.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 23, 2017 at 5:02 PM, jacopo <jacopo@jmondi.org> wrote:

>> > +  Required properties:
>> > +    - renesas,pins
>>
>> Just "pins"?
>>
>
> You know, I've been thinking about this, bu the "pins" property
> definition in pinctrl-bidings is the following one:
>
> Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> ---
> - pins takes a list of pin names or IDs as a required argument. The
>   specific binding for the hardware defines:
>       - Whether the entries are integers or strings, and their
>         meaning.
> ---
>
> And all examples there assume one "pin name" or "ID" per pin.
>
> Now, we use 2 values per each pin (the pin ID and the alternate
> function number), so to me this is different from what the generic
> binding describes.
> Also, pinctrl-single, and pinctrl-imx which have and ABI similar to
> the one this driver define, use "pinctrl-single,pins" and "fsl,pins"
> respectively as property names.
> So either they have to be updated yet, or we should keep using
> "renesas,pins" for our own defined ABI.
>
> Maybe Linus or other pinctrl people can give some suggestion here.

To me as subsystem maintainer any "necessarily different" bindings
are just a big confusion for the head.

Since you're adding a new driver, try to stick to the generic bindings
even if it deviates from what you are used to for Renesas, because
even if it may be more work for you guys or make you annoyed that
now a certain Renesas is different from all other Renesas platforms,
for the community this makes things easier to maintain because
we can look at the driver and its bindings and say "ah I know this".

The fact that historically all the early adopters of pinctrl in device tree
have these funky custom bindings is unfortunate but just something
that we need to live with.

Yours,
Linus Walleij
