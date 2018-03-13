Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:40879 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933441AbeCMQfJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Mar 2018 12:35:09 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXKHNxUK+sf8bt3J2nrCfWR3Rd7i=Dtm_PiCDDBeRppbQ@mail.gmail.com>
References: <1520799995-26347-1-git-send-email-ykaneko0929@gmail.com>
 <1520799995-26347-3-git-send-email-ykaneko0929@gmail.com> <CAMuHMdXKHNxUK+sf8bt3J2nrCfWR3Rd7i=Dtm_PiCDDBeRppbQ@mail.gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Wed, 14 Mar 2018 01:35:07 +0900
Message-ID: <CAH1o70JKFzpHV9AUDHW8KHY=g3Y42=B8zXPHMgFrgiJRDYL9Ng@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: thermal: rcar-thermal: add R8A77995 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert-san,

Thank you for your review!

2018-03-12 19:13 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
> Hi Kaneko-san,
>
> On Sun, Mar 11, 2018 at 9:26 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> Thanks for your patch!
>
>> --- a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
>> +++ b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
>> @@ -12,6 +12,7 @@ Required properties:
>>                             - "renesas,thermal-r8a7791" (R-Car M2-W)
>>                             - "renesas,thermal-r8a7792" (R-Car V2H)
>>                             - "renesas,thermal-r8a7793" (R-Car M2-N)
>> +                           - "renesas,thermal-r8a77995" (R-Car D3)
>
> OK for this change.
>
> I think the paragraph above needs some clarification, too:
>
>     Required properties:
>     - compatible            : "renesas,thermal-<soctype>",
>                                "renesas,rcar-gen2-thermal" (with
> thermal-zone) or
>                                "renesas,rcar-thermal" (without
> thermal-zone) as fallback.
>
> Your DT update for D3 contains the thermal-zone, but it is not R-Car Gen2,
> while you declare it compatible with "renesas,rcar-thermal".
>
> Probably we can just drop the fallback for D3 (and V3M later)?

It sounds good.
I will update DT to drop the fallback for D3.

>
> And the paragraph about interrupts need an update, too, as D3 has more
> than one interrupt:
>
>     Option properties:
>     - interrupts            : use interrupt

I will update this paragraph.


Thanks,
Kaneko

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
