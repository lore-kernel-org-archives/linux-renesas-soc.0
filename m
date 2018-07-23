Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:46980 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387883AbeGWNkd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 09:40:33 -0400
Received: by mail-oi0-f65.google.com with SMTP id y207-v6so773189oie.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 05:39:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87r2jy4yfl.wl-kuninori.morimoto.gx@renesas.com>
References: <1531856883-19645-1-git-send-email-ykaneko0929@gmail.com>
 <1531856883-19645-3-git-send-email-ykaneko0929@gmail.com> <87r2jy4yfl.wl-kuninori.morimoto.gx@renesas.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Mon, 23 Jul 2018 21:39:30 +0900
Message-ID: <CAH1o70Lj9JNKivgWx6Rb1K5SaxkaMuQn50f4e3+tKSuRCt9vhA@mail.gmail.com>
Subject: Re: [PATCH/RFT 2/7] ASoC: rsnd: Document R-Car M3-N support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

Thank you for your review.
I will exclude this patch from the series and repost this as a single
patch to ALSA SoC ML.

Best regards,
Kaneko

2018-07-20 8:12 GMT+09:00 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
>
> Hi
>
> Thnak you for your patch
>
>> From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
>>
>> Document support for the sound modules in the Renesas M3-N (r8a77965)
>> SoC.
>>
>> No driver update is needed.
>>
>> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>> ---
>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> But, I think this patch should go to ALSA SoC ML.
>
>
>>  Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
>> index b86d790..9e764270 100644
>> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
>> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
>> @@ -352,6 +352,7 @@ Required properties:
>>                                   - "renesas,rcar_sound-r8a7794" (R-Car E2)
>>                                   - "renesas,rcar_sound-r8a7795" (R-Car H3)
>>                                   - "renesas,rcar_sound-r8a7796" (R-Car M3-W)
>> +                                 - "renesas,rcar_sound-r8a77965" (R-Car M3-N)
>>  - reg                                : Should contain the register physical address.
>>                                 required register is
>>                                  SRU/ADG/SSI      if generation1
>> --
>> 1.9.1
>>
