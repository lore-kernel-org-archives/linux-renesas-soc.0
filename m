Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:35323 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751655AbdLUQWT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 11:22:19 -0500
Received: by mail-qt0-f195.google.com with SMTP id u10so33062128qtg.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Dec 2017 08:22:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <45101cc8-d2e8-7835-42f2-9566b9c3cd52@cogentembedded.com>
References: <20171221115423.13591-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVau_wMd8aNVD9+fEsbMoozQxvOvjhoXKziMgh8Q3EcOQ@mail.gmail.com> <45101cc8-d2e8-7835-42f2-9566b9c3cd52@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Dec 2017 17:22:18 +0100
Message-ID: <CAMuHMdUiHzz-UXzvSM5dtZ1cg=yBm2ctgYLg4gxgx0NbPWgeYw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: add GPIO extender
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Thu, Dec 21, 2017 at 5:07 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 12/21/2017 03:25 PM, Geert Uytterhoeven wrote:
>>> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>>> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>>> @@ -338,6 +338,11 @@
>>>   &i2c4 {
>>>          status = "okay";
>>>
>>> +       pca9654: gpio@20 {
>>> +               compatible = "onsemi,pca9654";
>>> +               reg = <0x20>;
>>
>>
>> Missing gpio-controller, #gpio-cells, and interrupts properties?
>
>    Indeed.
>
>> Seems like Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>> can use some updates...
>
>    What do you mean? I've surely updated it in my vendor prefix fix:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a64e557f399090f5d1917b2f32a065da2b12be1

I mean the missing properties are also not documented in the bindings,
or omitted in the example.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
