Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:34459 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753413AbcFUHLo (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 21 Jun 2016 03:11:44 -0400
Received: by mail-io0-f193.google.com with SMTP id 100so1239613ioh.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jun 2016 00:11:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d862ed53-b57b-47b7-f783-bbeceb6eae3e@cogentembedded.com>
References: <1466072862-28030-1-git-send-email-geert+renesas@glider.be>
 <1466072862-28030-14-git-send-email-geert+renesas@glider.be> <d862ed53-b57b-47b7-f783-bbeceb6eae3e@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jun 2016 09:11:35 +0200
Message-ID: <CAMuHMdVJD0rFJLPFUeUk=8giXw+OkgMb=Ko5r++MCJd6mcuqtA@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] ARM: dts: r8a7793: Add APMU node and second CPU core
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Keita Kobayashi <keita.kobayashi.ym@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"open list:MEDIA DRIVERS FOR RENESAS - FCP"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <damm+renesas@opensource.se>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Mon, Jun 20, 2016 at 11:05 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>> diff --git a/arch/arm/boot/dts/r8a7793.dtsi
>> b/arch/arm/boot/dts/r8a7793.dtsi
>> index 9b55c1c6ee31a49d..fce310c54efa88eb 100644
>> --- a/arch/arm/boot/dts/r8a7793.dtsi
>> +++ b/arch/arm/boot/dts/r8a7793.dtsi
>
> [...]
>>
>> @@ -56,6 +57,13 @@
>>                         next-level-cache = <&L2_CA15>;
>>                 };
>>
>> +               cpu1: cpu@1 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,cortex-a15";
>> +                       reg = <1>;
>> +                       clock-frequency = <1500000000>;
>
>    Why no "power-domains??

Because the original patch predates that, and I forgot to update it...

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
