Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34464 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754703AbcLUJ2U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Dec 2016 04:28:20 -0500
Received: by mail-it0-f67.google.com with SMTP id 75so16754499ite.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Dec 2016 01:28:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <874m1xycmy.wl%kuninori.morimoto.gx@renesas.com>
References: <1477933702-13423-1-git-send-email-geert+renesas@glider.be>
 <1477933702-13423-6-git-send-email-geert+renesas@glider.be>
 <CAMuHMdXOTqr=h0fF6AzCjX5Tv71xF8g=t-4=ZGwFuXZ75K_UyA@mail.gmail.com>
 <CANqRtoSrLj4swEXkOXBob3F2ozN7P2aH0VPRS0QBCocSgYt1cg@mail.gmail.com> <874m1xycmy.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Dec 2016 10:28:18 +0100
Message-ID: <CAMuHMdV+z=OHF0V6-njA+0OtBuc3EKmsy18YdiwFv8atH6+DYg@mail.gmail.com>
Subject: Re: [PATCH/RFC 5/5] dmaengine: rcar-dmac: Widen DMA mask to 40 bits
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san, Magnus,

On Wed, Dec 21, 2016 at 8:17 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> >> By default, the DMA mask covers only the low 32-bit address space, which
>> >> causes SWIOTLB on arm64 to fall back to a bounce buffer for DMA
>> >> transfers involving memory outside the 32-bit address space.
>> >>
>> >> The R-Car DMA controller hardware supports a 40-bit address space, hence
>> >> widen the DMA mask to 40 bits to actually make use of this feature.
>> >>
>> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> >
>> > Any comments? Thanks!
>> >
>> >> ---
>> >>  drivers/dma/sh/rcar-dmac.c | 1 +
>> >>  1 file changed, 1 insertion(+)
>> >>
>> >> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
>> >> index 2e441d0ccd79a37a..93a69b992a51a7aa 100644
>> >> --- a/drivers/dma/sh/rcar-dmac.c
>> >> +++ b/drivers/dma/sh/rcar-dmac.c
>> >> @@ -1716,6 +1716,7 @@ static int rcar_dmac_probe(struct platform_device *pdev)
>> >>
>> >>         dmac->dev = &pdev->dev;
>> >>         platform_set_drvdata(pdev, dmac);
>> >> +       dma_set_mask_and_coherent(dmac->dev, DMA_BIT_MASK(40));
>>
>> This makes sense to me since the hardware and the driver both can
>> access more than 32-bits of physical address space.
>
> Unfortunately, this patch breaks H3 IPMMU at least
> on SCIF/MSOIF/Sound. It could start works if we reverted
> this patch (= 3e58e24ad844a41389c849cfc581e3339299690e)
> I'm using renesas-drivers-next-2016-12-13-v4.9

I could reproduce this on salvator-x with both r8a7795 and r8a7796, after
enabling pimmu_{ds0,ds1,mm}, and binding the sys-dmacs to the ipmmu on
r8a7796.

ipmmu-vmsa e7740000.mmu: Unhandled fault: status 0x00000101 iova 0xfffff000

With DMA debugging enabled, I get:

ipmmu-vmsa e67b0000.mmu: DMA-API: device driver tries to sync DMA
memory it has not allocated [device address=0x0000000
7ba64018] [size=8 bytes]
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at lib/dma-debug.c:1234 check_sync+0xcc/0x568
Modules linked in:

CPU: 0 PID: 1 Comm: swapper/0 Not tainted
4.9.0-salvator-x-00438-g3c6a18a0b4e6f97a-dirty #995
Hardware name: Renesas Salvator-X board based on r8a7796 (DT)
task: ffffffc63b8ce080 task.stack: ffffffc63b8d0000
PC is at check_sync+0xcc/0x568
LR is at check_sync+0xcc/0x568
pc : [<ffffff800828a75c>] lr : [<ffffff800828a75c>] pstate: 604000c5
sp : ffffffc63b8d36b0
x29: ffffffc63b8d36b0 x28: ffffff8008c76560
x27: 000000067a14b000 x26: 0000000000001000
x25: ffffffc63ba64018 x24: 0000000000000001
x23: 00000000fffff000 x22: 0000000000000000
x21: ffffff8008c08000 x20: ffffffc63b8d3710
x19: ffffffc63ba2f810 x18: 0000000066a00782
x17: 00000000c0f4b676 x16: 000000007e7e7094
x15: 000000007369e22e x14: 735b205d38313034
x13: 3661623736303030 x12: 3030303078303d73
x11: 7365726464612065 x10: 63697665645b2064
x9 : 657461636f6c6c61 x8 : 20746f6e20736168
x7 : 2074692079726f6d x6 : ffffffc63b8ce080
x5 : 0000000000000000 x4 : 0000000000000000
x3 : 000000463754f000 x2 : 000000463754f000
x1 : ffffffc63b8ce080 x0 : 0000000000000090

---[ end trace df402ecfddb29a91 ]---
Call trace:
Exception stack(0xffffffc63b8d34e0 to 0xffffffc63b8d3610)
34e0: ffffffc63ba2f810 0000008000000000 0000000048d69000 ffffff800828a75c
3500: ffffff80087b7313 ffffff80087bec8b 000000013b8d3530 0000000000000007
3520: 000000000000022d 0000000100000000 ffffffc63b8d35d0 ffffff80080e8b68
3540: ffffffc63ba2f810 ffffffc63b8d3710 ffffff8008c08000 0000000000000000
3560: 00000000fffff000 0000000000000001 ffffffc63ba64018 0000000000001000
3580: 0000000000000090 ffffffc63b8ce080 000000463754f000 000000463754f000
35a0: 0000000000000000 0000000000000000 ffffffc63b8ce080 2074692079726f6d
35c0: 20746f6e20736168 657461636f6c6c61 63697665645b2064 7365726464612065
35e0: 3030303078303d73 3661623736303030 735b205d38313034 000000007369e22e
3600: 000000007e7e7094 00000000c0f4b676
[<ffffff800828a75c>] check_sync+0xcc/0x568
[<ffffff800828ac88>] debug_dma_sync_single_for_device+0x44/0x4c
[<ffffff8008310730>] __arm_lpae_set_pte.isra.1+0x8c/0x98
[<ffffff80083109bc>] __arm_lpae_map+0x280/0x2dc
[<ffffff8008310ee4>] arm_lpae_map+0xb0/0xc4
[<ffffff80083123c4>] ipmmu_map+0x20/0x30
[<ffffff800830cfb0>] iommu_map+0xdc/0x1d4
[<ffffff800830ef68>] __iommu_dma_map+0xb8/0xec
[<ffffff800830f650>] iommu_dma_map_page+0x50/0x58
[<ffffff800809797c>] __iommu_map_page+0x54/0x98
[<ffffff8008302a50>] sci_startup+0x1e8/0x424
[<ffffff800830069c>] uart_port_startup+0x78/0x118
[<ffffff8008300e9c>] uart_port_activate+0x5c/0x88
[<ffffff80082ed544>] tty_port_open+0x84/0xd4
[<ffffff80082ff498>] uart_open+0x34/0x44
[<ffffff80082e6d00>] tty_open+0x340/0x4d0
[<ffffff80081924a4>] chrdev_open+0x138/0x16c
[<ffffff800818ba40>] do_dentry_open.isra.17+0x1c4/0x2d8
[<ffffff800818c6e4>] vfs_open+0x60/0x6c
[<ffffff800819c134>] path_openat+0xaa4/0xc54
[<ffffff800819c320>] do_filp_open+0x3c/0x84
[<ffffff800818ca94>] do_sys_open+0x150/0x1e8
[<ffffff800818cb4c>] SyS_open+0x20/0x28
[<ffffff8008a00c4c>] kernel_init_freeable+0x16c/0x1e0
[<ffffff80085b0bd4>] kernel_init+0x10/0xfc
[<ffffff8008083080>] ret_from_fork+0x10/0x50

I believe I reported that before (yes, first time on Jan 18 ;-)

Any chance "iova 0xfffff000" in the fault message is related to
"x23: 00000000fffff000" in the backtrace, after truncation from 40-bit
to 32-bit?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
