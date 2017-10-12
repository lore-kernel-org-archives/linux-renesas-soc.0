Return-Path: <Dirk.Behme@de.bosch.com>
Subject: Re: mainline 4.14-rc4: renesas_sdhi_internal_dmac ee100000.sd:
 swiotlb buffer is full?
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <50d1a9ac-fe5f-d0a1-62bc-ff3e252e99da@de.bosch.com>
 <CAMuHMdXPYyi_pXcdtNJkT737dSXnwG88vqETN0Kbe-3AAJ0zOg@mail.gmail.com>
 <f7596566-2f98-d4a1-612c-77caa51b892e@de.bosch.com>
 <CAMuHMdXEXwwdNPmoFa+peivR_8Bv06r39bg1pAsL7498xrod6A@mail.gmail.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <5ccf4c75-6dd5-0818-54de-2a99a786a5c4@de.bosch.com>
Date: Thu, 12 Oct 2017 10:20:37 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXEXwwdNPmoFa+peivR_8Bv06r39bg1pAsL7498xrod6A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11.10.2017 15:20, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Wed, Oct 11, 2017 at 2:57 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> On 11.10.2017 14:42, Geert Uytterhoeven wrote:
>>> On Wed, Oct 11, 2017 at 2:23 PM, Dirk Behme <dirk.behme@de.bosch.com>
>>> wrote:
>>>> trying to boot recent mainline v4.14-rc4 on a custom H3 ES2.0 board with
>>>> rootfs on SD card I'm getting [1].
>>>>
>>>> Last time I think I used v4.13 in the same environment and I think it
>>>> worked
>>>> fine, most probably because renesas_sdhi_internal_dmac wasn't there, yet
>>>> ;)
>>>>
>>>> I checked renesas-drivers-2017-10-03-v4.14-rc3 if there is anything newer
>>>> regarding drivers/mmc/host/renesas_sdhi_internal_dmac.c but doesn't look
>>>> so.
>>>>
>>>> Any idea what I missed?
>>>>
>>> How much swiotlb memory do you have? The default is 64 MiB:
>>>
>>>       software IO TLB [mem 0x77fff000-0x7bfff000] (64MB) mapped at
>>> [ffffffc037fff000-ffffffc03bffefff]
>>
>> Same here:
> 
> OK.
> 
>>> Then, who else is consuming lots of swiotlb memory?
> 
> Or, not freeing allocated memory.
> 
>> Hmm, any idea how to find that?
>>
>> The dmesg doesn't seem to have more infos about that (?)
> 
> I'm afraid you have to add some prints to swiotlb_tbl_map_single()
> (and swiotlb_tbl_unmap_single())...


With [1] I'm getting [2]. What doesn't look that bad, at least quite 
symmetric. Having a quick look I can't find any obvious not freed mem. 
Hmm ...

Best regards

Dirk


[1]

--- a/lib/swiotlb.c
+++ b/lib/swiotlb.c
@@ -510,6 +510,8 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev,
         if (sme_active())
                 pr_warn_once("SME is active and system is using DMA 
bounce buffers\n");

+       dev_warn(hwdev, "swiotlb_tbl_map_single: trying to map %zd 
bytes\n", size);
+
         mask = dma_get_seg_boundary(hwdev);

         tbl_dma_addr &= mask;
@@ -639,6 +641,8 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, 
phys_addr_t tlb_addr,
         int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
         phys_addr_t orig_addr = io_tlb_orig_addr[index];

+       dev_warn(hwdev, "swiotlb_tbl_unmap_single: trying to unmap %zd 
bytes\n", size);
+
         /*
          * First, sync the memory before unmapping the entry
          */


[2]


[    0.000000] software IO TLB [mem 0x4ffff000-0x53fff000] (64MB) mapped 
at [ffff80000ffff000-ffff800013ffefff]
[    1.761965] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 8 bytes
[    1.771422] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 8 bytes
[    1.781012] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 64 bytes
[    1.791699] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 64 bytes
[    1.801044] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 64 bytes
[    1.811740] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 64 bytes
[    1.811766] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 64 bytes
[    1.813534] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 64 bytes
[    1.814690] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    1.815455] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    1.815583] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    1.816244] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    1.816335] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    1.816996] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    1.817084] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    1.817746] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    2.085510] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 512 bytes
[    2.105646] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 512 bytes
[    2.117384] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 512 bytes
[    2.128299] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 512 bytes
[    2.138851] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.354719] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 512 bytes
[    2.355176] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.356206] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.356239] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.357260] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.357293] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.358314] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.358348] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.359369] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.359403] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.360426] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.360461] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.361481] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.361515] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.362535] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.362567] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.363587] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.363622] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.364642] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.364677] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.365696] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.365732] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.366751] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.366786] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.367806] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.367841] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.368864] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.368898] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.369917] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.369950] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.370969] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 128 bytes
[    2.371002] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 128 bytes
[    2.373197] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    2.373558] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    2.373645] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    2.373780] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    2.373846] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    2.373978] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    2.374054] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    2.374188] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    2.374255] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    2.374431] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    2.374530] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    2.374779] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    2.374844] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    2.375021] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    2.375085] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    2.375219] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    2.375289] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    2.375423] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    2.375489] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    2.375622] renesas_sdhi_internal_dmac ee160000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    2.499250] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.499256] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 64 bytes
[    2.500151] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.500156] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 64 bytes
[    2.627236] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.628153] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.655235] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.655241] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 18 bytes
[    2.656161] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.656165] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 18 bytes
[    2.656194] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.656199] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 9 bytes
[    2.656269] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.656272] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 9 bytes
[    2.656285] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.656290] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 41 bytes
[    2.656393] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.656397] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 41 bytes
[    2.656600] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.656636] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.656728] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.656733] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 15 bytes
[    2.656766] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.656770] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 15 bytes
[    2.656788] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.656893] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.656935] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.656940] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 2 bytes
[    2.657018] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.657022] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 2 bytes
[    2.657034] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.657038] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 4 bytes
[    2.657143] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.657147] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 4 bytes
[    2.657257] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.657293] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.657305] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.657393] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.657404] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.657518] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.657529] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.657643] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.759240] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.759245] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 4 bytes
[    2.760172] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.760176] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 4 bytes
[    2.760189] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.760194] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 4 bytes
[    2.760278] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.760282] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 4 bytes
[    2.760293] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.760298] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 4 bytes
[    2.760403] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.760407] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 4 bytes
[    2.760419] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.760424] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 4 bytes
[    2.760528] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    2.760532] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 4 bytes
[    2.760543] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 1 bytes
[    2.762704] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 1 bytes
[    2.762719] ehci-platform ee0a0100.usb: swiotlb_tbl_map_single: 
trying to map 8 bytes
[    2.762744] ehci-platform ee0a0100.usb: swiotlb_tbl_unmap_single: 
trying to unmap 8 bytes
[    3.397784] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 512 bytes
[    3.407247] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 512 bytes
[    3.416687] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 512 bytes
[    3.434467] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 512 bytes
[    3.443908] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 512 bytes
[    3.453355] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 512 bytes
[    3.462799] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 512 bytes
[    3.472311] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.481983] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.491598] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.501264] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.510919] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.520602] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.530149] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.539829] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.549376] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.559057] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.568604] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.578282] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.587834] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.597512] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.607059] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.616737] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.626282] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.635960] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.645506] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.655170] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.664716] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.674386] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.683938] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.693603] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.703149] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.712814] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.722360] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.732025] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.741571] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.751239] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.760786] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.770456] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.780002] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.789667] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.799213] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.808886] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.818432] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.828097] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.837643] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.847309] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.856856] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.866522] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.876068] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.885746] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.895291] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.904968] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.914514] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.924192] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.933738] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.943416] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.952962] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.962641] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.972187] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    3.981867] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    3.991413] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.001092] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.010639] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.020320] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.029866] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.039532] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.049078] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.058743] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.068293] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.077958] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.087505] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.097170] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.106716] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.116381] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.125927] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.135608] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.145341] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.155002] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.164888] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.182208] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.211343] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.221295] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.238815] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.248481] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.258023] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.267690] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.277236] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.286903] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.296449] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.306113] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.315659] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.325325] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.334875] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.344541] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.354086] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.363751] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.373297] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.382974] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.392520] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.402197] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.411742] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.421420] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.430965] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.440643] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.450188] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.459868] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.469413] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.479092] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.488638] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.498318] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.507863] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.517543] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.527088] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.536754] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.546298] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.555965] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.565509] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.575175] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.584719] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.594383] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.603928] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.613593] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.623138] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.632803] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.642348] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.652014] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.661558] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.671225] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.680770] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.690435] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.699980] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.709649] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.719199] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.728865] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.738409] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.748075] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.757619] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.767286] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.776830] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.786496] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.796040] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.805705] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.815266] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.824931] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.834475] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.844158] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.853703] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.863370] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.872979] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.882659] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.892371] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.902037] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.911651] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.921332] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.930935] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.940615] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.950272] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.959939] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.969484] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.979149] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    4.988696] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    4.998361] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.007907] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.017572] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.027118] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.036783] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.046329] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.055995] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.065540] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.075206] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.084751] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.094417] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.103962] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.113627] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.123173] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.132839] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.142383] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.152063] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.161607] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.171274] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.180906] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.190571] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.200117] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.209781] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.219326] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.228991] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.238535] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.248200] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.257744] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.267410] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.276954] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.286625] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.296171] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.305836] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.315381] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.325058] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.334604] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.344284] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.353830] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.363508] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.373054] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.382731] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.392277] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.401957] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.411501] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.421181] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.430726] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.440406] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.449951] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.459632] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.469177] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.478842] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.488386] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.498051] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.507596] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.517261] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.526805] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.536470] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.546015] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.555682] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.565227] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.574893] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.584438] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.594104] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.603649] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.613316] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.622861] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.632526] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.642070] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.651735] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.661279] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.670949] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.680494] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.690159] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.699704] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.709369] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.718914] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.728579] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.738123] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.747789] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.757334] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.767000] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.776545] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.786225] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.795770] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.805435] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.815038] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.824704] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.834307] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.843992] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.853536] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.863219] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.872764] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.882446] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.891991] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.901671] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.911226] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.920904] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.930448] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.940128] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.949678] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.959343] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.968889] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.978554] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    5.988102] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    5.997767] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.007312] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.016977] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.026522] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.036187] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.045733] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.055399] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.064944] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.074610] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.084156] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.093821] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.103366] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.113044] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.122589] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.132269] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.141814] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.151497] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.161043] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.170723] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.180268] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.189948] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.199493] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.209173] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.218719] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.228399] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.237944] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.247624] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.257171] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.266848] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.276393] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.286071] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.295617] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.305300] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.314850] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.324528] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.334073] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.343753] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.353299] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.362978] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.372523] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.382203] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.391748] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.401428] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.410973] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.420654] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.430256] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.439934] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.449662] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.459627] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.469173] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.478850] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.488395] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.498074] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.507619] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.517298] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.527039] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.536705] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.546344] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.556300] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.565846] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.575511] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.585056] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 8192 bytes
[    6.594892] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 8192 bytes
[    6.604726] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 69632 bytes
[    6.617250] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 69632 bytes
[    6.626911] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.636578] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.646304] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 8192 bytes
[    6.656179] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 8192 bytes
[    6.665725] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 8192 bytes
[    6.675575] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 8192 bytes
[    6.685128] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 16384 bytes
[    6.695414] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 16384 bytes
[    6.705050] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 16384 bytes
[    6.715405] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 16384 bytes
[    6.725043] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 57344 bytes
[    6.737056] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 57344 bytes
[    6.746873] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 12288 bytes
[    6.757006] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 12288 bytes
[    6.766643] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 24576 bytes
[    6.777252] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 24576 bytes
[    6.787282] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.797234] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.806987] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 16384 bytes
[    6.817273] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 16384 bytes
[    6.826993] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.836675] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.846377] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.856058] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.865594] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.875272] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.884807] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.894484] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.904019] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.913696] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.923348] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.933029] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.942564] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.952245] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.961784] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.971464] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    6.980999] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    6.990679] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.000214] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.009893] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.019427] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.029107] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.038642] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.048321] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.057987] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.067666] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.077244] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.086924] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.096460] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.106144] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.115684] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.125364] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.134898] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.144579] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.154113] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.163793] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.173327] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.183008] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.192543] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.202223] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.211757] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.221422] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.230956] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.240621] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.250156] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.259821] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.269355] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.279019] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.288554] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.298219] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.307753] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.317418] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.326958] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.336624] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.346158] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.355823] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.365358] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.375035] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.384570] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.394251] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.403786] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.413465] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.422999] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.432679] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.442213] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.451896] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.461431] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.471111] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.480645] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.490324] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.499859] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.509539] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.519073] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.528751] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.538285] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.547963] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.557497] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.567176] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.576711] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.586388] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.595922] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.605602] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.615136] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.624816] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.634350] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.644030] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.653564] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.663245] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.672780] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.682445] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.691979] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.701658] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.711251] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.720918] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.730494] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.740175] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.749744] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.759423] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.769020] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.778700] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.788292] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.797958] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.807535] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.817200] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.826733] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.836400] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.845936] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.855604] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.865138] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.874803] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.884343] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.894008] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.903541] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.913207] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.922742] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.932407] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.941941] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.951607] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.961142] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.970819] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.980353] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    7.990033] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    7.999567] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.009245] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.018779] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.028458] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.037992] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.047674] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.057208] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.066887] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.076422] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.086103] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.095642] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.105322] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.114857] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.124522] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.134056] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.143726] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.153261] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.162925] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.172460] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.182130] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.191665] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.201330] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.210864] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.220530] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.230064] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.239747] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.249281] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.258947] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.268482] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.278147] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.287681] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.297346] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.306885] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.316550] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.326084] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.335750] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.345285] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.354951] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.364485] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.374150] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.383684] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.393349] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.402883] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.412564] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.422098] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.431762] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.441360] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.451327] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.460862] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.470541] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.480076] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.489756] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.499291] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.508970] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.518642] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.528326] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.537860] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.547542] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.557076] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.566756] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.576291] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.585971] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.595505] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.605183] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.614718] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.624398] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.633932] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.643610] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.653145] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.662823] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.672357] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.682037] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.691571] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.701251] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.710786] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.720466] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.730000] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.739681] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.749372] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.759038] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.768573] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.778243] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.787779] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.797446] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.806981] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.816647] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.826313] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.835979] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.845514] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.855179] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.864713] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.874378] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.883913] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.893578] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.903112] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.912777] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.922313] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.931978] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.941513] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.951178] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.960713] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.970378] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.979912] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    8.989577] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    8.999114] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.008780] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.018315] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.027980] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.037515] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.047181] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.056715] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.066382] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.075916] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 20480 bytes
[    9.086389] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 20480 bytes
[    9.096156] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 90112 bytes
[    9.109811] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 90112 bytes
[    9.119479] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 12288 bytes
[    9.129587] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 12288 bytes
[    9.139212] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 12288 bytes
[    9.149316] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 12288 bytes
[    9.159057] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 16384 bytes
[    9.169341] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 16384 bytes
[    9.179087] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 94208 bytes
[    9.192632] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 94208 bytes
[    9.202307] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 36864 bytes
[    9.213740] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 36864 bytes
[    9.223528] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 16384 bytes
[    9.233806] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 16384 bytes
[    9.243567] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 61440 bytes
[    9.256032] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 61440 bytes
[    9.265684] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 69632 bytes
[    9.278361] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 69632 bytes
[    9.288173] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 53248 bytes
[    9.300019] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 53248 bytes
[    9.309662] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 77824 bytes
[    9.322806] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 77824 bytes
[    9.332581] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 16384 bytes
[    9.343469] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 16384 bytes
[    9.353199] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 28672 bytes
[    9.363979] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 28672 bytes
[    9.373609] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 36864 bytes
[    9.384766] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 36864 bytes
[    9.394532] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 16384 bytes
[    9.404886] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 16384 bytes
[    9.414611] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 69632 bytes
[    9.427134] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 69632 bytes
[    9.436794] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.446461] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.456130] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 16384 bytes
[    9.466407] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 16384 bytes
[    9.476178] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 12288 bytes
[    9.486285] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 12288 bytes
[    9.496123] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 57344 bytes
[    9.508138] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 57344 bytes
[    9.517786] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 73728 bytes
[    9.530481] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 73728 bytes
[    9.540134] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 8192 bytes
[    9.549984] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 8192 bytes
[    9.559759] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 40960 bytes
[    9.571093] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 40960 bytes
[    9.580728] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 73728 bytes
[    9.593447] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 73728 bytes
[    9.603300] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 36864 bytes
[    9.614738] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 36864 bytes
[    9.624374] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 12288 bytes
[    9.634480] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 12288 bytes
[    9.644104] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.653783] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.663317] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 49152 bytes
[    9.674984] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 49152 bytes
[    9.684623] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 57344 bytes
[    9.696632] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 57344 bytes
[    9.706280] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 73728 bytes
[    9.718974] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 73728 bytes
[    9.728744] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 49152 bytes
[    9.740441] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 49152 bytes
[    9.750081] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 65536 bytes
[    9.762434] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 65536 bytes
[    9.772246] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 20480 bytes
[    9.782726] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 20480 bytes
[    9.792669] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.802341] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.811880] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.821551] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.831087] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.840755] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.850290] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.859957] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.869492] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.879159] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.888694] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.898360] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.907895] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.917564] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.927099] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.936764] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.946299] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.955966] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.965501] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.975167] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[    9.984701] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[    9.994367] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.003902] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 86016 bytes
[   10.017103] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 86016 bytes
[   10.026775] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 24576 bytes
[   10.037406] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 24576 bytes
[   10.047040] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 106496 bytes
[   10.061464] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 106496 bytes
[   10.071228] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 16384 bytes
[   10.081532] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 16384 bytes
[   10.091159] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 114688 bytes
[   10.105640] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 114688 bytes
[   10.115539] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 131072 bytes
[   10.130704] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 131072 bytes
[   10.140607] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 131072 bytes
[   10.155773] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 131072 bytes
[   10.165660] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 77824 bytes
[   10.178522] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 77824 bytes
[   10.188312] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 36864 bytes
[   10.199470] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 36864 bytes
[   10.209106] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 53248 bytes
[   10.220949] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 53248 bytes
[   10.230744] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 131072 bytes
[   10.245907] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 131072 bytes
[   10.255806] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 131072 bytes
[   10.270971] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 131072 bytes
[   10.280848] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 77824 bytes
[   10.293716] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 77824 bytes
[   10.303516] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.313483] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.323228] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 106496 bytes
[   10.337656] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 106496 bytes
[   10.347420] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 24576 bytes
[   10.358068] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 24576 bytes
[   10.367888] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 131072 bytes
[   10.383054] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 131072 bytes
[   10.392840] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 40960 bytes
[   10.404739] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 40960 bytes
[   10.414377] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 49152 bytes
[   10.426049] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 49152 bytes
[   10.435687] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 57344 bytes
[   10.447978] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 57344 bytes
[   10.457794] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 16384 bytes
[   10.468104] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 16384 bytes
[   10.483512] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 8192 bytes
[   10.493362] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 8192 bytes
[   10.502899] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 28672 bytes
[   10.513711] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 28672 bytes
[   10.523479] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.533146] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.542799] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.560991] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.570567] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.580254] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.589802] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.608733] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.618309] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.637248] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.646823] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.665858] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.675433] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.694307] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.703883] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.722884] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.732460] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.751268] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.760843] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.779782] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.789357] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.808140] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.817714] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.836686] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.846264] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.865180] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.874755] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.893849] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.903424] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.922379] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.931954] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.950951] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.960526] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   10.979432] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   10.989007] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.008110] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.017685] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.036625] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.046200] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.065223] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.074797] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.093721] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.103296] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.113261] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.122807] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.141852] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.151426] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.161106] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.170802] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.180468] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.190099] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.199765] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.209366] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.219046] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.228596] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.238275] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.247820] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.257499] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.267044] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.276723] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.286270] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.295950] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.305497] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.315177] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.324722] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.334401] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.343946] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.353626] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.363171] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.372836] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.382381] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.392051] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.401601] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.411266] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.420812] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.430477] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.440022] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.449687] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.459287] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.468956] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.478502] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.488168] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.497713] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.507378] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.516924] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.526589] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.536133] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.545798] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.555343] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.565008] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.574553] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.584221] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.593771] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.603436] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.612982] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.622646] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.632191] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.641856] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.651401] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.661065] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.670610] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.680275] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.689825] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.699491] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.709036] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.718701] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.728246] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.737913] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.747459] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.757125] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.766670] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.776336] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.785881] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.795548] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.805093] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.814757] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.824302] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.833967] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.843578] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.853246] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.863158] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.872825] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.882370] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.892039] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.901585] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.911252] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.920796] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.930462] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.940008] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.949674] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.959227] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.968892] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.978437] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   11.988104] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   11.997649] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.007318] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.016864] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.026530] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.036345] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.046016] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.055566] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.065233] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.074778] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.084446] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.093991] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.103659] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.113205] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.122872] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.132416] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.142086] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.151631] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.161297] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.170842] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.180510] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.190054] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.199728] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.209273] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.218941] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.228486] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.238153] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.247697] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.257363] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.266908] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.276576] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.286121] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.295788] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.305334] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.315000] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.324545] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.334212] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.343756] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 32768 bytes
[   12.354744] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 32768 bytes
[   12.364607] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 53248 bytes
[   12.376563] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 53248 bytes
[   12.386214] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.395881] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.405425] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 8192 bytes
[   12.415263] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 8192 bytes
[   12.424810] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 32768 bytes
[   12.436033] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 32768 bytes
[   12.445677] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 8192 bytes
[   12.455636] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 8192 bytes
[   12.465307] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 12288 bytes
[   12.475408] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 12288 bytes
[   12.485335] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.494999] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.504611] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.514274] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.523823] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.533490] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.543035] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.552698] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.562243] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.571907] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.581451] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.591115] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.600661] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.610324] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.619870] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.629539] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.639089] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.648754] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.658299] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.667963] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.677508] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.687171] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.696716] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.706379] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.715924] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.725587] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.735133] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.744795] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.754340] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.764004] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.773549] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.783213] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.792758] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.802423] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.811967] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.821631] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.831176] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.840838] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.850383] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.860044] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.869590] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.879252] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.888797] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.898457] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.908001] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.917663] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.927207] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.936868] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.946412] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.956074] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.965620] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.975281] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   12.984826] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   12.994486] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.004031] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.013692] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.023257] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.032919] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.042465] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.052127] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.061677] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.071364] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.080909] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.090595] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.100139] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.109824] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.119369] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.129032] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.138638] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.148306] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.157915] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.167583] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.177216] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.187180] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.196725] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.206403] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.215948] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.225634] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.235180] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.244861] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.255058] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.264740] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.274285] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.283966] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.293510] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.303189] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.312734] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.322415] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.331959] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 4096 bytes
[   13.341643] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 4096 bytes
[   13.351188] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 45056 bytes
[   13.362696] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 45056 bytes
[   13.372348] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 262144 bytes
[   13.393108] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_unmap_single: trying to unmap 262144 bytes
[   13.402957] renesas_sdhi_internal_dmac ee100000.sd: 
swiotlb_tbl_map_single: trying to map 524288 bytes
[   13.412421] renesas_sdhi_internal_dmac ee100000.sd: swiotlb buffer is 
full (sz: 524288 bytes)
