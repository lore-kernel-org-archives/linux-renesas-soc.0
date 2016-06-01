Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:33642 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750967AbcFAVAH (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 17:00:07 -0400
Received: by mail-lf0-f53.google.com with SMTP id s64so21217283lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jun 2016 14:00:06 -0700 (PDT)
Subject: Re: [PATCH 04/13] ARM: shmobile: r8a7792: basic SoC support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2352834.cNFKgiQiVO@wasted.cogentembedded.com>
 <CAMuHMdXtqwby6_E-izx=h=ryQfH2LsXvNyP+14rnaF-TksmEbg@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Russell King <linux@arm.linux.org.uk>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f7b4e1f5-dcbc-06b5-ac44-af6bef9b2658@cogentembedded.com>
Date: Thu, 2 Jun 2016 00:00:02 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXtqwby6_E-izx=h=ryQfH2LsXvNyP+14rnaF-TksmEbg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/01/2016 10:47 AM, Geert Uytterhoeven wrote:

>> --- renesas.orig/arch/arm/mach-shmobile/Kconfig
>> +++ renesas/arch/arm/mach-shmobile/Kconfig
>> @@ -86,6 +86,11 @@ config ARCH_R8A7791
>>         select ARCH_RCAR_GEN2
>>         select I2C
>>
>> +config ARCH_R8A7792
>> +       bool "R-Car V2H (R8A77920)"
>> +       select ARCH_RCAR_GEN2
>> +       select I2C
>
> I2c is selected for the other SoCs because of regulator-quirk-rcar-gen2.
> I do not have schematics for Blanche, so I don't know if it has DA9063 and
> DA9210 regulators sharing the same interrupt.

    No, it only has DA9063.

> If yes, you should make sure regulator-quirk-rcar-gen2 is updated for Blanche,
> and built.
> If no, you should drop the select.

    Thanks for noticing!

> If the above is clarified:

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

    Thank you, adding...

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
