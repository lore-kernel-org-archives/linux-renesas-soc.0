Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:42502 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751405AbeCPMAS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 08:00:18 -0400
MIME-Version: 1.0
In-Reply-To: <9c6289e4-23dd-c79b-bd1f-058d843739d2@cogentembedded.com>
References: <1521029386-29975-1-git-send-email-geert+renesas@glider.be>
 <1521029386-29975-3-git-send-email-geert+renesas@glider.be> <9c6289e4-23dd-c79b-bd1f-058d843739d2@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Mar 2018 13:00:12 +0100
Message-ID: <CAMuHMdUO-Op4u44naZJ37VgzN1GJBL33yRWnF11D9a24y8+x1g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: salvator-common: Configure
 PMIC for DDR Backup Power
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Wed, Mar 14, 2018 at 4:17 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 03/14/2018 03:09 PM, Geert Uytterhoeven wrote:
>> On Salvator-X(S), all of the DDR0, DDR1, DDR0C, and DDR1C power rails
>> need to be kept powered when backup mode is enabled.  Reflect this in
>> the "rohm,ddr-backup-power" property for the BD9571MWV PMIC node.
>>
>> The accessory power switch (SW23) is a toggle switch, hense specify
>> "rohm,rstbmode-level".
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> v2:
>>   - Add rohm,rstbmode-level.
>> ---
>>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> index 2a7f36abd2dd85c6..80794c38c2669d75 100644
>> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> @@ -376,6 +376,8 @@
>>               #interrupt-cells = <2>;
>>               gpio-controller;
>>               #gpio-cells = <2>;
>> +             rohm,ddr-backup-power = <15>;
>
>   Why not 0xf if those are all bit flags?

Because it's a small number?
Does it matter?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
