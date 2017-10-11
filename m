Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:53883 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752045AbdJKNUv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 09:20:51 -0400
Received: by mail-wm0-f45.google.com with SMTP id q132so4759972wmd.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2017 06:20:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <f7596566-2f98-d4a1-612c-77caa51b892e@de.bosch.com>
References: <50d1a9ac-fe5f-d0a1-62bc-ff3e252e99da@de.bosch.com>
 <CAMuHMdXPYyi_pXcdtNJkT737dSXnwG88vqETN0Kbe-3AAJ0zOg@mail.gmail.com> <f7596566-2f98-d4a1-612c-77caa51b892e@de.bosch.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Oct 2017 15:20:49 +0200
Message-ID: <CAMuHMdXEXwwdNPmoFa+peivR_8Bv06r39bg1pAsL7498xrod6A@mail.gmail.com>
Subject: Re: mainline 4.14-rc4: renesas_sdhi_internal_dmac ee100000.sd:
 swiotlb buffer is full?
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Wed, Oct 11, 2017 at 2:57 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> On 11.10.2017 14:42, Geert Uytterhoeven wrote:
>> On Wed, Oct 11, 2017 at 2:23 PM, Dirk Behme <dirk.behme@de.bosch.com>
>> wrote:
>>> trying to boot recent mainline v4.14-rc4 on a custom H3 ES2.0 board with
>>> rootfs on SD card I'm getting [1].
>>>
>>> Last time I think I used v4.13 in the same environment and I think it
>>> worked
>>> fine, most probably because renesas_sdhi_internal_dmac wasn't there, yet
>>> ;)
>>>
>>> I checked renesas-drivers-2017-10-03-v4.14-rc3 if there is anything newer
>>> regarding drivers/mmc/host/renesas_sdhi_internal_dmac.c but doesn't look
>>> so.
>>>
>>> Any idea what I missed?
>>>
>> How much swiotlb memory do you have? The default is 64 MiB:
>>
>>      software IO TLB [mem 0x77fff000-0x7bfff000] (64MB) mapped at
>> [ffffffc037fff000-ffffffc03bffefff]
>
> Same here:

OK.

>> Then, who else is consuming lots of swiotlb memory?

Or, not freeing allocated memory.

> Hmm, any idea how to find that?
>
> The dmesg doesn't seem to have more infos about that (?)

I'm afraid you have to add some prints to swiotlb_tbl_map_single()
(and swiotlb_tbl_unmap_single())...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
