Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:39621 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388414AbeGWNom (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 09:44:42 -0400
Received: by mail-oi0-f65.google.com with SMTP id d189-v6so827579oib.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 05:43:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87pnzi4xyw.wl-kuninori.morimoto.gx@renesas.com>
References: <1531856883-19645-1-git-send-email-ykaneko0929@gmail.com>
 <1531856883-19645-4-git-send-email-ykaneko0929@gmail.com> <87pnzi4xyw.wl-kuninori.morimoto.gx@renesas.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Mon, 23 Jul 2018 21:43:38 +0900
Message-ID: <CAH1o70L4bS01VQNtJvg0scXLa7v29_8yJD=0xFYoHOUXEhAijQ@mail.gmail.com>
Subject: Re: [PATCH/RFT 3/7] arm64: dts: renesas: r8a77965: Add Sound device
 node and SSI support
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

2018-07-20 8:23 GMT+09:00 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
>
> Hi
>
>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>
>> Based on several similar patches of the R8A7796 device tree
>> by Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>.
>>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>> ---
> (snip)
>>               rcar_sound: sound@ec500000 {
>> +                     /*
>> +                      * #sound-dai-cells is required
>> +                      *
>> +                      * Single DAI : #sound-dai-cells = <0>; <&rcar_sound>;
>> +                      * Multi  DAI : #sound-dai-cells = <1>; <&rcar_sound N>;
>> +                      */
>> +                     /*
>> +                      * #clock-cells is required for audio_clkout0/1/2/3
>> +                      *
>> +                      * clkout       : #clock-cells = <0>;   <&rcar_sound>;
>> +                      * clkout0/1/2/3: #clock-cells = <1>;   <&rcar_sound N>;
>> +                      */
>> +                     compatible =  "renesas,rcar_sound-r8a7796", "renesas,rcar_sound-gen3";
>
> 77965 ?

Will fix.

>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Best regards,
Kaneko
