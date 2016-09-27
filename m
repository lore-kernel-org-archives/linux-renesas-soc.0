Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:34056 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753171AbcI0KLg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2016 06:11:36 -0400
Received: by mail-lf0-f48.google.com with SMTP id y6so17021823lff.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2016 03:11:35 -0700 (PDT)
Date: Tue, 27 Sep 2016 12:11:32 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH/RFC] iommu/ipmmu-vmsa: IPMMU SYS-DMAC iova mapping
 workaround
Message-ID: <20160927101132.GF16263@bigcity.dyn.berto.se>
References: <20160920115433.14772.84308.sendpatchset@little-apple>
 <20160927062018.GD16263@bigcity.dyn.berto.se>
 <CANqRtoS_ZDzjz0qpKO0sep-gypvOVKkUFkB+8tsZeqphsMwwNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANqRtoS_ZDzjz0qpKO0sep-gypvOVKkUFkB+8tsZeqphsMwwNQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On 2016-09-27 15:43:30 +0900, Magnus Damm wrote:
> Hi Niklas,
> 
> On Tue, Sep 27, 2016 at 3:20 PM, Niklas S�derlund
> <niklas.soderlund@ragnatech.se> wrote:
> > Hi Magnus,
> >
> > On 2016-09-20 20:54:33 +0900, Magnus Damm wrote:
> >> From: Magnus Damm <damm+renesas@opensource.se>
> >>
> >> Here's some prototype code that works around the lack of software
> >> support for mapping I/O devices to the SYS-DMAC hardware via the
> >> DMA Engine framework when using IOMMU.
> >>
> >> The code itself is one big layering violation that goes through
> >> the DT and unconditionally maps I/O devices using DMACs via the
> >> IPMMU device instance into iova space with a 1:1 mapping.
> >>
> >> This very short term prototype will for instance automatically make
> >> the SCIF serial port function with the IPMMU hardware in case the
> >> SYS-DMAC is hooked up to the IPMMU device.
> >>
> >> Not to be confused with the more long term solution to allow the
> >> DMA Engine framework to map I/O device memory dynamically.
> >
> > Good news, Vinod queued the dma_{map,unmap}_resource API and rcar-dmac
> > usage of it yesterday \o/.
> 
> Excellent. Are the DMA Engine slave devices supposed to work out of
> the box with the IPMMU then, or is some other component missing?

The DT and shmobile_defconfig patches are missing. If you enable 
CONFIG_IPMMU_VMSA and wire up DT (see bellow for Koelsch example) then 
all devices I have tried works (MMC, I2C and serial consoles).

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 8f0086b..d19bffd 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -325,6 +325,21 @@
                power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
                #dma-cells = <1>;
                dma-channels = <15>;
+               iommus = <&ipmmu_ds 0>,
+                        <&ipmmu_ds 1>,
+                        <&ipmmu_ds 2>,
+                        <&ipmmu_ds 3>,
+                        <&ipmmu_ds 4>,
+                        <&ipmmu_ds 5>,
+                        <&ipmmu_ds 6>,
+                        <&ipmmu_ds 7>,
+                        <&ipmmu_ds 8>,
+                        <&ipmmu_ds 9>,
+                        <&ipmmu_ds 10>,
+                        <&ipmmu_ds 11>,
+                        <&ipmmu_ds 12>,
+                        <&ipmmu_ds 13>,
+                        <&ipmmu_ds 14>;
        };
 
        dmac1: dma-controller@e6720000 {
@@ -356,6 +371,21 @@
                power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
                #dma-cells = <1>;
                dma-channels = <15>;
+               iommus = <&ipmmu_ds 15>,
+                        <&ipmmu_ds 16>,
+                        <&ipmmu_ds 17>,
+                        <&ipmmu_ds 18>,
+                        <&ipmmu_ds 19>,
+                        <&ipmmu_ds 20>,
+                        <&ipmmu_ds 21>,
+                        <&ipmmu_ds 22>,
+                        <&ipmmu_ds 23>,
+                        <&ipmmu_ds 24>,
+                        <&ipmmu_ds 25>,
+                        <&ipmmu_ds 26>,
+                        <&ipmmu_ds 27>,
+                        <&ipmmu_ds 28>,
+                        <&ipmmu_ds 29>;
        };
 
        audma0: dma-controller@ec700000 {
@@ -1693,7 +1723,7 @@
                interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
                             <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
                #iommu-cells = <1>;
-               status = "disabled";
+               status = "okay";
        };
 
        ipmmu_mp: mmu@ec680000 {

Also please note that I'm having problems with the next branch of 
git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/slave-dma.git and 
the commit 761ed4a (tty: serial_core: convert uart_close to use 
tty_port_close) together with a systemd init system. I have to revert to 
commit in order for the system to boot, but I will comment on that in a 
separate e-mail.

-- 
Regards,
Niklas S�derlund
