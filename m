Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:54242 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752050AbdJKM5w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 08:57:52 -0400
Subject: Re: mainline 4.14-rc4: renesas_sdhi_internal_dmac ee100000.sd:
 swiotlb buffer is full?
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <50d1a9ac-fe5f-d0a1-62bc-ff3e252e99da@de.bosch.com>
 <CAMuHMdXPYyi_pXcdtNJkT737dSXnwG88vqETN0Kbe-3AAJ0zOg@mail.gmail.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <f7596566-2f98-d4a1-612c-77caa51b892e@de.bosch.com>
Date: Wed, 11 Oct 2017 14:57:50 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXPYyi_pXcdtNJkT737dSXnwG88vqETN0Kbe-3AAJ0zOg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 11.10.2017 14:42, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Wed, Oct 11, 2017 at 2:23 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> trying to boot recent mainline v4.14-rc4 on a custom H3 ES2.0 board with
>> rootfs on SD card I'm getting [1].
>>
>> Last time I think I used v4.13 in the same environment and I think it worked
>> fine, most probably because renesas_sdhi_internal_dmac wasn't there, yet ;)
>>
>> I checked renesas-drivers-2017-10-03-v4.14-rc3 if there is anything newer
>> regarding drivers/mmc/host/renesas_sdhi_internal_dmac.c but doesn't look so.
>>
>> Any idea what I missed?
> 
> How much swiotlb memory do you have? The default is 64 MiB:
> 
>      software IO TLB [mem 0x77fff000-0x7bfff000] (64MB) mapped at
> [ffffffc037fff000-ffffffc03bffefff]


Same here:

software IO TLB [mem 0x4ffff000-0x53fff000] (64MB) mapped at 
[ffff80000ffff000-ffff800013ffefff]


> Then, who else is consuming lots of swiotlb memory?


Hmm, any idea how to find that?

The dmesg doesn't seem to have more infos about that (?)


>> Freeing unused kernel memory: 512K
>> usb 3-1: new high-speed USB device number 2 using ehci-platform
>> usb 3-1: New USB device found, idVendor=0424, idProduct=2514
>> usb 3-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
>> hub 3-1:1.0: USB hub found
>> hub 3-1:1.0: 4 ports detected
>> systemd[1]: System time before build time, advancing clock.
>> renesas_sdhi_internal_dmac ee100000.sd: swiotlb buffer is full (sz: 524288
>> bytes)
>> renesas_sdhi_internal_dmac ee100000.sd: DMA: Out of SW-IOMMU space for
>> 524288 bytes
>> Unable to handle kernel paging request at virtual address ffffffffc0000000
> 
> Ugh, and the mapping failure isn't even handled correctly...


:(


Best regards

Dirk
