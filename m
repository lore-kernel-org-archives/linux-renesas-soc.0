Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f51.google.com ([209.85.213.51]:39555 "EHLO
        mail-vk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753751AbeENO3H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 May 2018 10:29:07 -0400
Received: by mail-vk0-f51.google.com with SMTP id g83-v6so7601850vkc.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 May 2018 07:29:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOtvUMc80rEZaKD8j=F0fyV27Y17JOU5zzXtqDgPo=KEMROrhQ@mail.gmail.com>
References: <CAOtvUMc80rEZaKD8j=F0fyV27Y17JOU5zzXtqDgPo=KEMROrhQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 May 2018 16:29:04 +0200
Message-ID: <CAMuHMdVQdNO14JCaQyFQYD=brrD4XpsBzc8oMzhXG_rVZdCz-g@mail.gmail.com>
Subject: Re: Booting Salvator-X ES1 board with upstream kernel
To: Gilad Ben-Yossef <gilad@benyossef.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Gilad,

On Thu, May 10, 2018 at 10:12 AM, Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> I am trying to add support for the CryptoCell security IP in the
> R-Rcar boards to mainline but I've run into some trouble.

Ah, we have found a user ;-)

> I have an R-Car 3rd gen Salvator-X ES1 board. I've been able to boot
> Linux 4.9 on it from the rareness-bsp tree, using the defconfig and
> the r8a7795-es1-salvator-x DTB with no problems, so the HW is fine.
>
> However, I can't seem to boot an upstream kernel (Linus master or
> soc-for-v4.17 branch) on it. I just get total silence on the UART
> after u-boot.
>
> Any tips or ideas for me to try?

Please try appending the following to the kernel command line:

    earlycon keep_bootcon

FWIW, I'm using:

    tftpboot 0x48080000 h3-salvator-x/Image
    tftpboot 0x49f00000 h3-salvator-x/r8a7795-es1-salvator-x.dtb
    booti 0x48080000 - 0x49f00000

Which firmware revision do you have? It may be too old to boot moden
(large) kernel images. Check the first line of BL2 output.

Which config are you using? Please try renesas_defconfig from Simon's
repository.

Good luck!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
