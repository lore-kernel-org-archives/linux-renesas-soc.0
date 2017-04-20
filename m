Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:35506 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S944776AbdDTLOu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 07:14:50 -0400
MIME-Version: 1.0
In-Reply-To: <20170419224646.wwjerpgnidvk4fkh@rob-hp-laptop>
References: <20170413201932.890107963@cogentembedded.com> <20170419224646.wwjerpgnidvk4fkh@rob-hp-laptop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2017 13:14:48 +0200
Message-ID: <CAMuHMdVt2kMzwmEDOttxUxMSPtAzY+CWio_j__o5+Swmf0=WaQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7794: add R8A7745 support
To: Rob Herring <robh@kernel.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Rob,

On Thu, Apr 20, 2017 at 12:46 AM, Rob Herring <robh@kernel.org> wrote:
> On Thu, Apr 13, 2017 at 11:19:24PM +0300, Sergei Shtylyov wrote:
>> Renesas  RZ/G1E (R8A7745) is pin compatible with R-Car E2 (R8A7794),
>> however  it doesn't have several automotive specific peripherals.
>
> Is a single space between words really so hard for you? You've been told
> to write proper sentences multiple times.
>
> Yes, kernel developers suffer from OCD. Sorry.

No problem, my OCD corrects the spacing while applying...

>> Annotate all the items that only exist on the R-Car SoCs and only
>> supply the pin groups/functions existing on a given SoC (that required
>> splitting  of the AVB function)...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> This patch is  against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
>> repo plus  R8A7794 PFC fix and R8A7743 PFC support patch...
>>
>> Changes in version 2:
>> - fixed indentation to use tabs instead of spaces;
>> - updated the PFC bindings.
>>
>>  Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt |    1
>
> But given it's a one line DT change:

Which is always correct ;-)

> Acked-by: Rob Herring <robh@kernel.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
