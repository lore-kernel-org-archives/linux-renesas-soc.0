Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:33049 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759438AbcJ1Mk7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2016 08:40:59 -0400
Received: by mail-oi0-f65.google.com with SMTP id i127so2957068oia.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2016 05:40:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20161027102934.26426.94225.sendpatchset@little-apple>
References: <20161027102856.26426.48132.sendpatchset@little-apple> <20161027102934.26426.94225.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Oct 2016 14:40:57 +0200
Message-ID: <CAMuHMdULu20sex4CP9rT-HZ3o5YkWidbQxQZ9Y_y+KmqEzXUwg@mail.gmail.com>
Subject: Re: [PATCH 04/04] arm64: dts: r8a7795: Connect Ethernet AVB to IPMMU
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Joerg Roedel <joro@8bytes.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Oct 27, 2016 at 12:29 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add IPMMU-DS0 to the Ethernet-AVB device node.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks for your patch!

> ---
>
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi |    1 +
>  1 file changed, 1 insertion(+)
>
> --- 0006/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi       2016-10-27 18:08:09.590607110 +0900
> @@ -706,6 +706,7 @@
>                         phy-mode = "rgmii-id";
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> +                       iommus = <&ipmmu_ds0 16>;
>                 };

I've applied the same to r8a7796.dtsi, and enabled the ipmmu_ds0 and
ipmmu_mm nodes.

With CONFIG_DMA_API_DEBUG=y, I get:

ipmmu-vmsa e67b0000.mmu: DMA-API: device driver tries to sync DMA
memory it has not allocated [device address=0x000000067b9d2018]
[size=8 bytes]
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at lib/dma-debug.c:1234 check_sync+0xcc/0x568
Modules linked in:

CPU: 0 PID: 1 Comm: swapper/0 Not tainted
4.9.0-rc2-salvator-x-01968-g5193fb91213b0165-dirty #61
Hardware name: Renesas Salvator-X board based on r8a7796 (DT)
task: ffffffc63b860080 task.stack: ffffffc63b864000
PC is at check_sync+0xcc/0x568
LR is at check_sync+0xcc/0x568
pc : [<ffffff8008234a58>] lr : [<ffffff8008234a58>] pstate: 600000c5
sp : ffffffc63b8677f0
x29: ffffffc63b8677f0 x28: ffffffc63b98f910
x27: 0000000000000000 x26: 0000000000001000
x25: ffffffc63b9d2018 x24: 0000000000000001
x23: 00000000fffff000 x22: 0000000000000000
x21: ffffff8008c05000 x20: ffffffc63b867850
x19: ffffffc63b991810 x18: 00000000e5b7a57f
x17: 00000000a2deee83 x16: 000000003ed9b3b5
x15: 00000000578b233a x14: 796220383d657a69
x13: 735b205d38313032 x12: 6439623736303030
x11: 3030303078303d73 x10: 7365726464612065
x9 : 63697665645b2064 x8 : 657461636f6c6c61
x7 : 20746f6e20736168 x6 : ffffff8008c6a5b7
x5 : 0000000000000022 x4 : 0000000000000010
x3 : 0000000000000000 x2 : 00000000dead4ead
x1 : ffffff8008c19370 x0 : 0000000000000090

---[ end trace 9e4d7153ac803e17 ]---
Call trace:
Exception stack(0xffffffc63b867620 to 0xffffffc63b867750)
7620: ffffffc63b991810 0000008000000000 ffffffc63b8677f0 ffffff8008234a58
7640: ffffff8008c05838 ffffff8008c058e0 ffffff800877cb09 00000007080d869c
7660: 00000000000001c7 0000000100000000 ffffffc63b867710 ffffff80080d8884
7680: ffffffc63b991810 ffffffc63b867850 ffffff8008c05000 0000000000000000
76a0: 00000000fffff000 0000000000000001 ffffffc63b9d2018 0000000000001000
76c0: 0000000000000090 ffffff8008c19370 00000000dead4ead 0000000000000000
76e0: 0000000000000010 0000000000000022 ffffff8008c6a5b7 20746f6e20736168
7700: 657461636f6c6c61 63697665645b2064 7365726464612065 3030303078303d73
7720: 6439623736303030 735b205d38313032 796220383d657a69 00000000578b233a
7740: 000000003ed9b3b5 00000000a2deee83
[<ffffff8008234a58>] check_sync+0xcc/0x568
[<ffffff8008234f84>] debug_dma_sync_single_for_device+0x44/0x4c
[<ffffff80082b1968>] __arm_lpae_set_pte.isra.3+0x8c/0x98
[<ffffff80082b1bf4>] __arm_lpae_map+0x280/0x2dc
[<ffffff80082b211c>] arm_lpae_map+0xb0/0xc4
[<ffffff80082b368c>] ipmmu_map+0x20/0x30
[<ffffff80082aeff8>] iommu_map+0xd4/0x128
[<ffffff80082af13c>] default_iommu_map_sg+0xf0/0x148
[<ffffff80082b067c>] iommu_dma_alloc+0x300/0x344
[<ffffff8008092e4c>] __iommu_alloc_attrs+0xb4/0x1f4
[<ffffff8008359794>] ravb_probe+0x474/0x820
[<ffffff80082ee7d8>] platform_drv_probe+0x58/0xa4
[<ffffff80082ece44>] driver_probe_device+0x124/0x278
[<ffffff80082ed00c>] __driver_attach+0x74/0xa0
[<ffffff80082eb380>] bus_for_each_dev+0x64/0x88
[<ffffff80082ec910>] driver_attach+0x20/0x28
[<ffffff80082ec4d8>] bus_add_driver+0xe4/0x1e8
[<ffffff80082ed8a4>] driver_register+0x98/0xe4
[<ffffff80082ee730>] __platform_driver_register+0x48/0x50
[<ffffff8008a216dc>] ravb_driver_init+0x18/0x20
[<ffffff8008083190>] do_one_initcall+0x88/0x108
[<ffffff8008a00c9c>] kernel_init_freeable+0x148/0x1e4
[<ffffff8008502284>] kernel_init+0x10/0xfc
[<ffffff8008082e80>] ret_from_fork+0x10/0x50

Gives this happens inside the IPMMU driver, called from the first
dma_alloc_coherent() in ravb_probe(), I think this is a bug in the IPMMU
driver, not in the RAVB driver.

Nevertheless, RAVB itself seems to work fine with IPMMU enabled.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
