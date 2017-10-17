Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:55429 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752381AbdJQFIB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2017 01:08:01 -0400
Subject: Re: mainline 4.14-rc4: renesas_sdhi_internal_dmac ee100000.sd:
 swiotlb buffer is full?
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <50d1a9ac-fe5f-d0a1-62bc-ff3e252e99da@de.bosch.com>
 <CAMuHMdXPYyi_pXcdtNJkT737dSXnwG88vqETN0Kbe-3AAJ0zOg@mail.gmail.com>
 <f7596566-2f98-d4a1-612c-77caa51b892e@de.bosch.com>
 <CAMuHMdXEXwwdNPmoFa+peivR_8Bv06r39bg1pAsL7498xrod6A@mail.gmail.com>
 <5ccf4c75-6dd5-0818-54de-2a99a786a5c4@de.bosch.com>
 <aecf1ec0-7172-ec41-1759-be261f3e0dd2@de.bosch.com>
 <TY1PR06MB0992FAD2C2CD90FFF71E1807D84F0@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAMuHMdV=3_9af-aTGnWBLemg3Hrh-D4im1Vxk0mTXstiz0vVUA@mail.gmail.com>
 <CACRpkdZbdhAbFUa9Dh9j8WtY7iYNhB27Ar4XzTZLrTz=gPPsvQ@mail.gmail.com>
 <CAMuHMdVdfZT-X1bNSBfzBOS=BWgi3d6XySUAJvfz+tvh1=twwQ@mail.gmail.com>
 <CACRpkdZoXpMt7+5_-aEyA4V06cc-ofuA_BQVhYOuVoZDDn_Kbw@mail.gmail.com>
 <TY1PR06MB09924402AE9EAA79CCD9E194D84C0@TY1PR06MB0992.apcprd06.prod.outlook.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <85b9aac9-a12c-a102-a029-1960e12013b0@de.bosch.com>
Date: Tue, 17 Oct 2017 07:07:58 +0200
MIME-Version: 1.0
In-Reply-To: <TY1PR06MB09924402AE9EAA79CCD9E194D84C0@TY1PR06MB0992.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Limiting the thread to Renesas only, again, to discuss the other issue:

On 17.10.2017 06:51, Yoshihiro Shimoda wrote:
> Hi Linus-san,
> 
>> From: Linus Walleij, Sent: Monday, October 16, 2017 9:22 PM
>>
>> On Mon, Oct 16, 2017 at 2:07 PM, Geert Uytterhoeven
>> <geert@linux-m68k.org> wrote:
>>> On Mon, Oct 16, 2017 at 1:41 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>>>> On Mon, Oct 16, 2017 at 11:02 AM, Geert Uytterhoeven
>>>> <geert@linux-m68k.org> wrote:
>>>>>> IIUC,
>>>>>> - Since the MMC_BOUNCE disappeared in v4.14-rc1, the MMC core will request a command with 64kbyte+ size.
>>>>>>   - So, swiotlb will got request 64kbyte+ size. This is different with previous version.
>>>>
>>>> Other people reported problems with that. Sorry about this...
>>>>
>>>> This problem should be solved by upstream
>>>> commit de3ee99b097dd51938276e3af388cd4ad0f2750a
>>>> "mmc: Delete bounce buffer handling"
>>>>
>>>> I just killed off the bounce buffers so they can't hurt anyone anymore.
>>>>
>>>> Can you check that you have this patch in your tree?
>>>
>>> Given Dirk saw the issue with v4.14-rc4, I'm afraid that patch is already
>>> included :-(
>>
>> So the first issue is definately gone.
>>
>> Then it seems the driver is specifying to high ->max_seg_size
>> since the buffer cannot be mapped?
>>
>> Unless you're using ADMA drivers/mmc/host/sdhci.c sets it as:
>> mmc->max_seg_size = mmc->max_req_size;
> 
> Thank you for the comment!
> On R-Car Gen3, it's using drivers/mmc/host/renesas_sdhi_internal_dmac.c,
> and sets the max_seg_size to very big size (0xffffffff * 512) now...
> 
> So, I modified the value to 262144 and rebase the kernel to v4.14-rc5
> (-rc4 seems have other issue in block driver.), the "swiotlb buffer is full" issue disappeared.
> 
>> And:
>> mmc->max_req_size = 524288;
>>
>>>> renesas_sdhi_internal_dmac ee100000.sd: swiotlb_tbl_map_single: test:
>>>> size modified to 524288 bytes
>>>> renesas_sdhi_internal_dmac ee100000.sd: swiotlb buffer is full (sz:
>>>> 524288 bytes)
>>
>> So if your driver cannot handle 524288 bytes, why is it saying it can
>> handle 524288 bytes?
> 
> I think the "swiotlb buffer is full" came from lib/swiotlb.c.
> I'm not sure the detail of swiotlb.c, but IIUC, it has a memory size limitation.
> 
> - In lib/swiotlb.c, it calculates nslots.
>   - The size of one slot is 2048 bytes because IO_TLB_SHIFT in include/linux/swiotlb.h is set to 11.
> - IO_TLB_SEGSIZE is set to 128 in include/linux/swiotlb.h.
>   - This value is number of maximum slots.
>    - So, maximum size for a single map of swiotlb is 256kbytes (2048 * 128).
> 
> So, I will submit a patch to set the max_req_size to 256kbytes today.


Great, many thanks! I'll try to test that in the next days, then.

While above fixes the swiotlb full issue, we still have the issue that 
it looks like the driver doesn't handle that issue correctly and 
crashes, then:

renesas_sdhi_internal_dmac ee100000.sd: DMA: Out of SW-IOMMU space for 
524288 bytes
-> Unable to handle kernel paging request at virtual address 
ffffffffc0000000 <-

I'd propose to fix that, too. Have you looked into that issue, too?

I'm no expert on this, but it looks to me that other drivers are 
checking the return value of dma_map_sg() differently?

ret = dma_map_sg(&host->pdev->dev, sg, host->sg_len, dir);
	if (ret < 0)
		return;

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mmc/host/renesas_sdhi_internal_dmac.c#n165

They check for (ret == 0)?

Sorry if I'm wrong on that ;)

Best regards

Dirk
