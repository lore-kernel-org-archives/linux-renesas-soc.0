Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:49026 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751064AbdJLJNM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2017 05:13:12 -0400
Subject: Re: mainline 4.14-rc4: renesas_sdhi_internal_dmac ee100000.sd:
 swiotlb buffer is full?
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <50d1a9ac-fe5f-d0a1-62bc-ff3e252e99da@de.bosch.com>
 <CAMuHMdXPYyi_pXcdtNJkT737dSXnwG88vqETN0Kbe-3AAJ0zOg@mail.gmail.com>
 <f7596566-2f98-d4a1-612c-77caa51b892e@de.bosch.com>
 <CAMuHMdXEXwwdNPmoFa+peivR_8Bv06r39bg1pAsL7498xrod6A@mail.gmail.com>
 <5ccf4c75-6dd5-0818-54de-2a99a786a5c4@de.bosch.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <aecf1ec0-7172-ec41-1759-be261f3e0dd2@de.bosch.com>
Date: Thu, 12 Oct 2017 11:13:09 +0200
MIME-Version: 1.0
In-Reply-To: <5ccf4c75-6dd5-0818-54de-2a99a786a5c4@de.bosch.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12.10.2017 10:20, Dirk Behme wrote:
> On 11.10.2017 15:20, Geert Uytterhoeven wrote:
>> Hi Dirk,
>>
>> On Wed, Oct 11, 2017 at 2:57 PM, Dirk Behme <dirk.behme@de.bosch.com> 
>> wrote:
>>> On 11.10.2017 14:42, Geert Uytterhoeven wrote:
>>>> On Wed, Oct 11, 2017 at 2:23 PM, Dirk Behme <dirk.behme@de.bosch.com>
>>>> wrote:
>>>>> trying to boot recent mainline v4.14-rc4 on a custom H3 ES2.0 board 
>>>>> with
>>>>> rootfs on SD card I'm getting [1].
>>>>>
>>>>> Last time I think I used v4.13 in the same environment and I think it
>>>>> worked
>>>>> fine, most probably because renesas_sdhi_internal_dmac wasn't 
>>>>> there, yet
>>>>> ;)
>>>>>
>>>>> I checked renesas-drivers-2017-10-03-v4.14-rc3 if there is anything 
>>>>> newer
>>>>> regarding drivers/mmc/host/renesas_sdhi_internal_dmac.c but doesn't 
>>>>> look
>>>>> so.
>>>>>
>>>>> Any idea what I missed?
>>>>>
>>>> How much swiotlb memory do you have? The default is 64 MiB:
>>>>
>>>>       software IO TLB [mem 0x77fff000-0x7bfff000] (64MB) mapped at
>>>> [ffffffc037fff000-ffffffc03bffefff]
>>>
>>> Same here:
>>
>> OK.
>>
>>>> Then, who else is consuming lots of swiotlb memory?
>>
>> Or, not freeing allocated memory.
>>
>>> Hmm, any idea how to find that?
>>>
>>> The dmesg doesn't seem to have more infos about that (?)
>>
>> I'm afraid you have to add some prints to swiotlb_tbl_map_single()
>> (and swiotlb_tbl_unmap_single())...
> 
> 
> With [1] I'm getting [2]. What doesn't look that bad, at least quite 
> symmetric. Having a quick look I can't find any obvious not freed mem. 
> Hmm ...


Ok, it seems to be somehow easy ;) It seems that the 524288 bytes them 
self are the issue, independent on the usage of the swiotlb memory.

Doing a hack like [3], i.e. trying to map 524288 bytes at the first 
access, already, crashes, too [4].

So seems we have two issues?

a) swiotlb_tbl_map_single() can't handle 524288 bytes

and

b) failing swiotlb_tbl_map_single() results in a kernel crash


Now, I'm not sure whom to address both to? Is it an issue of 
renesas_sdhi_internal_dmac() which shouldn't call swiotlb with 524288 
bytes? Or is this an error of swiotlb? Same for the kernel crash.


Best regards

Dirk

[3]

--- a/lib/swiotlb.c
+++ b/lib/swiotlb.c
@@ -510,6 +510,10 @@ phys_addr_t swiotlb_tbl_map_single(struct device 
*hwdev,
         if (sme_active())
                 pr_warn_once("SME is active and system is using DMA 
bounce buffers\n");

+       dev_warn(hwdev, "swiotlb_tbl_map_single: trying to map %zd 
bytes\n", size);
+       size = (size_t)524288;
+       dev_warn(hwdev, "swiotlb_tbl_map_single: test: size modified to 
%zd bytes\n", size);
+
         mask = dma_get_seg_boundary(hwdev);

         tbl_dma_addr &= mask;

[4]

renesas_sdhi_internal_dmac ee100000.sd: swiotlb_tbl_map_single: trying 
to map 8 bytes
renesas_sdhi_internal_dmac ee100000.sd: swiotlb_tbl_map_single: test: 
size modified to 524288 bytes
renesas_sdhi_internal_dmac ee100000.sd: swiotlb buffer is full (sz: 
524288 bytes)
renesas_sdhi_internal_dmac ee100000.sd: DMA: Out of SW-IOMMU space for 8 
bytes
Unable to handle kernel paging request at virtual address ffffffffc0000000
