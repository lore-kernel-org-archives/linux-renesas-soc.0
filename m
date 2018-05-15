Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:45409 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753080AbeEON70 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 09:59:26 -0400
Received: by mail-vk0-f67.google.com with SMTP id n134-v6so142846vke.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 May 2018 06:59:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOtvUMcQgrPBo5c-vX=hdHHEAUMjZhAW6DgvXkErcGo247urbQ@mail.gmail.com>
References: <CAOtvUMc80rEZaKD8j=F0fyV27Y17JOU5zzXtqDgPo=KEMROrhQ@mail.gmail.com>
 <CAMuHMdVQdNO14JCaQyFQYD=brrD4XpsBzc8oMzhXG_rVZdCz-g@mail.gmail.com> <CAOtvUMcQgrPBo5c-vX=hdHHEAUMjZhAW6DgvXkErcGo247urbQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 May 2018 15:59:24 +0200
Message-ID: <CAMuHMdUV-tjx3cXtAdaFWFz-he-yJXcOGbJ_qY9RFgqnudzSLg@mail.gmail.com>
Subject: Re: Booting Salvator-X ES1 board with upstream kernel
To: Gilad Ben-Yossef <gilad@benyossef.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Gilad,

On Tue, May 15, 2018 at 2:36 PM, Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> On Mon, May 14, 2018 at 5:29 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Thu, May 10, 2018 at 10:12 AM, Gilad Ben-Yossef <gilad@benyossef.com> wrote:
>>> I have an R-Car 3rd gen Salvator-X ES1 board. I've been able to boot
>>> Linux 4.9 on it from the rareness-bsp tree, using the defconfig and
>>> the r8a7795-es1-salvator-x DTB with no problems, so the HW is fine.
>>>
>>> However, I can't seem to boot an upstream kernel (Linus master or
>>> soc-for-v4.17 branch) on it. I just get total silence on the UART
>>> after u-boot.
>>>
>>> Any tips or ideas for me to try?
>>
>> Please try appending the following to the kernel command line:
>>
>>     earlycon keep_bootcon
>>
>> FWIW, I'm using:
>>
>>     tftpboot 0x48080000 h3-salvator-x/Image
>>     tftpboot 0x49f00000 h3-salvator-x/r8a7795-es1-salvator-x.dtb
>>     booti 0x48080000 - 0x49f00000
>>
>> Which firmware revision do you have? It may be too old to boot moden
>> (large) kernel images. Check the first line of BL2 output.
>>
>> Which config are you using? Please try renesas_defconfig from Simon's
>> repository.
>
> That was it. I was building with defoncfig and getting a kernel that won't be.
> Simon's config did the trick.

Good to hear you succeeded!

FWIW, mine boots v4.17-rc5 fine, using arm64 defconfig.

My firmware is:
BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.1.0.12

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
