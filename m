Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:37683 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751184AbdJIL5F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 07:57:05 -0400
Received: by mail-wm0-f66.google.com with SMTP id r68so8273988wmr.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Oct 2017 04:57:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e2e31fd8-b5f8-40a8-df3d-e7726bb8a8e1@arm.com>
References: <1507209984-17123-1-git-send-email-horms+renesas@verge.net.au>
 <1507209984-17123-3-git-send-email-horms+renesas@verge.net.au> <e2e31fd8-b5f8-40a8-df3d-e7726bb8a8e1@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Oct 2017 13:57:03 +0200
Message-ID: <CAMuHMdVbQMGG92sAnWUDzBisSHEdedoSNLWxokv_BTj4eER64Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: r8a7796: Add OPPs table for cpu devices
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sudeep,

On Thu, Oct 5, 2017 at 5:04 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> On 05/10/17 14:26, Simon Horman wrote:
>> From: Dien Pham <dien.pham.ry@rvc.renesas.com>
>>
>> Current, OPP tables are defined temporary,
>> they are being evaluated and adjust in future.

>> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
>> @@ -46,6 +46,8 @@
>>                       power-domains = <&sysc R8A7796_PD_CA57_CPU0>;
>>                       next-level-cache = <&L2_CA57>;
>>                       enable-method = "psci";
>> +                     clocks =<&cpg CPG_CORE R8A7796_CLK_Z>;
>> +                     operating-points-v2 = <&cluster0_opp>;
>>               };
>>
>>               a57_1: cpu@1 {
>> @@ -55,6 +57,7 @@
>>                       power-domains = <&sysc R8A7796_PD_CA57_CPU1>;
>>                       next-level-cache = <&L2_CA57>;
>>                       enable-method = "psci";
>
> Just curious why clocks are not specified in secondaries ?

Thanks for noticing, it would indeed be good to describe the clock dependency
for all CPU cores.

> Does this continue work if I hotplug out CPUs in ascending order and
> then hotplug back in descending order ? Also the current driver or OS
> may deal with that but not a good assumption when write DT

Yes that works, as Linux doesn't handle CPU hotplug details.
CPU hotplug is controlled by PSCI, i.e. out of control of the Linux kernel.
So it doesn't matter at all what is described here ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
