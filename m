Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:51621 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757316AbdJKMmj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 08:42:39 -0400
Received: by mail-wm0-f42.google.com with SMTP id f4so4467884wme.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2017 05:42:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <50d1a9ac-fe5f-d0a1-62bc-ff3e252e99da@de.bosch.com>
References: <50d1a9ac-fe5f-d0a1-62bc-ff3e252e99da@de.bosch.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Oct 2017 14:42:37 +0200
Message-ID: <CAMuHMdXPYyi_pXcdtNJkT737dSXnwG88vqETN0Kbe-3AAJ0zOg@mail.gmail.com>
Subject: Re: mainline 4.14-rc4: renesas_sdhi_internal_dmac ee100000.sd:
 swiotlb buffer is full?
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Wed, Oct 11, 2017 at 2:23 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> trying to boot recent mainline v4.14-rc4 on a custom H3 ES2.0 board with
> rootfs on SD card I'm getting [1].
>
> Last time I think I used v4.13 in the same environment and I think it worked
> fine, most probably because renesas_sdhi_internal_dmac wasn't there, yet ;)
>
> I checked renesas-drivers-2017-10-03-v4.14-rc3 if there is anything newer
> regarding drivers/mmc/host/renesas_sdhi_internal_dmac.c but doesn't look so.
>
> Any idea what I missed?

How much swiotlb memory do you have? The default is 64 MiB:

    software IO TLB [mem 0x77fff000-0x7bfff000] (64MB) mapped at
[ffffffc037fff000-ffffffc03bffefff]

Then, who else is consuming lots of swiotlb memory?

> Freeing unused kernel memory: 512K
> usb 3-1: new high-speed USB device number 2 using ehci-platform
> usb 3-1: New USB device found, idVendor=0424, idProduct=2514
> usb 3-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> hub 3-1:1.0: USB hub found
> hub 3-1:1.0: 4 ports detected
> systemd[1]: System time before build time, advancing clock.
> renesas_sdhi_internal_dmac ee100000.sd: swiotlb buffer is full (sz: 524288
> bytes)
> renesas_sdhi_internal_dmac ee100000.sd: DMA: Out of SW-IOMMU space for
> 524288 bytes
> Unable to handle kernel paging request at virtual address ffffffffc0000000

Ugh, and the mapping failure isn't even handled correctly...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
