Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:36123 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753243AbdIHHFo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Sep 2017 03:05:44 -0400
Received: by mail-lf0-f52.google.com with SMTP id m199so3658878lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Sep 2017 00:05:44 -0700 (PDT)
Subject: Re: [PATCH 01/18] dt: arm: shmobile: add M3ULCB Kingfisher board DT
 bindings
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737303-22874-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdUi9THE7nTd54C22K6kOo_Ye5LkhTrRZPNfcHfWCiBsUQ@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Message-ID: <a106fe34-d584-1560-797c-581ffc33a305@cogentembedded.com>
Date: Fri, 8 Sep 2017 10:05:40 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUi9THE7nTd54C22K6kOo_Ye5LkhTrRZPNfcHfWCiBsUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 07.09.2017 13:58, Geert Uytterhoeven wrote:
> Hi Vladimir,
>
> On Thu, Sep 7, 2017 at 12:35 AM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
>> Add M3ULCB Kingfisher Device tree bindings Documentation, listing it as a
>> supported board.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Thanks for your patch!
>
>> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
>> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
>> @@ -85,6 +85,7 @@ Boards:
>>     - Lager (RTP0RC7790SEB00010S)
>>       compatible = "renesas,lager", "renesas,r8a7790"
>>     - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
>> +    M3ULCB Kingfisher (SBEV-RCAR-KF-M03)
> As the Kingfisher is an extension board (and you added the same board part
> number to the H3ULCB section in patch 02/18), shouldn't it have its own
> compatible value "shimafuji,kingfisher" instead?
Thank you for this suggestion.

This looks very meaningful for boards differentiation.

> Then this can be used in ulcb-kf.dtsi:
>
>      compatible = "shimafuji,kingfisher";
>
> and appended (overridden, as there's no /append-property/ directive in dtc
> yet?) in the board files, e.g. r8a7796-m3ulcb-kf.dts:
>
>      compatible = "shimafuji,kingfisher", "renesas,m3ulcb", "renesas,r8a7796";
>
> Does that make sense?
Yes.
I will rework this in V2 patchset according to your suggestion.

>
>>       compatible = "renesas,m3ulcb", "renesas,r8a7796";
>>     - Marzen (R0P7779A00010S)
>>       compatible = "renesas,marzen", "renesas,r8a7779"
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds


-- 
Regards,
Vladimir
