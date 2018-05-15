Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f41.google.com ([209.85.213.41]:45921 "EHLO
        mail-vk0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752227AbeEOMg4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 08:36:56 -0400
Received: by mail-vk0-f41.google.com with SMTP id n134-v6so5359066vke.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 May 2018 05:36:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVQdNO14JCaQyFQYD=brrD4XpsBzc8oMzhXG_rVZdCz-g@mail.gmail.com>
References: <CAOtvUMc80rEZaKD8j=F0fyV27Y17JOU5zzXtqDgPo=KEMROrhQ@mail.gmail.com>
 <CAMuHMdVQdNO14JCaQyFQYD=brrD4XpsBzc8oMzhXG_rVZdCz-g@mail.gmail.com>
From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Tue, 15 May 2018 15:36:54 +0300
Message-ID: <CAOtvUMcQgrPBo5c-vX=hdHHEAUMjZhAW6DgvXkErcGo247urbQ@mail.gmail.com>
Subject: Re: Booting Salvator-X ES1 board with upstream kernel
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 14, 2018 at 5:29 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Gilad,
>
> On Thu, May 10, 2018 at 10:12 AM, Gilad Ben-Yossef <gilad@benyossef.com> wrote:
>> I am trying to add support for the CryptoCell security IP in the
>> R-Rcar boards to mainline but I've run into some trouble.
>
> Ah, we have found a user ;-)

Yes. I would be very happy if all our customer would be as cooperative
as Renesas.
That would make my life and the life of the users easier :-)

I've also have the HiKey960 on my todo list.

>
>> I have an R-Car 3rd gen Salvator-X ES1 board. I've been able to boot
>> Linux 4.9 on it from the rareness-bsp tree, using the defconfig and
>> the r8a7795-es1-salvator-x DTB with no problems, so the HW is fine.
>>
>> However, I can't seem to boot an upstream kernel (Linus master or
>> soc-for-v4.17 branch) on it. I just get total silence on the UART
>> after u-boot.
>>
>> Any tips or ideas for me to try?
>
> Please try appending the following to the kernel command line:
>
>     earlycon keep_bootcon
>
> FWIW, I'm using:
>
>     tftpboot 0x48080000 h3-salvator-x/Image
>     tftpboot 0x49f00000 h3-salvator-x/r8a7795-es1-salvator-x.dtb
>     booti 0x48080000 - 0x49f00000
>
> Which firmware revision do you have? It may be too old to boot moden
> (large) kernel images. Check the first line of BL2 output.
>
> Which config are you using? Please try renesas_defconfig from Simon's
> repository.

That was it. I was building with defoncfig and getting a kernel that won't be.
Simon's config did the trick.

Many thanks!

Gilad

-- 
Gilad Ben-Yossef
Chief Coffee Drinker

"If you take a class in large-scale robotics, can you end up in a
situation where the homework eats your dog?"
 -- Jean-Baptiste Queru
