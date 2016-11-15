Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:51718 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753123AbcKORER (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2016 12:04:17 -0500
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
        by ayla.of.borg with esmtp (Exim 4.82)
        (envelope-from <geert@linux-m68k.org>)
        id 1c6h9Z-0003NP-IL
        for linux-renesas-soc@vger.kernel.org; Tue, 15 Nov 2016 18:04:13 +0100
Received: from geert by ramsan with local (Exim 4.82)
        (envelope-from <geert@linux-m68k.org>)
        id 1c6h9j-0005lK-5Q
        for linux-renesas-soc@vger.kernel.org; Tue, 15 Nov 2016 18:04:23 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2016-11-15-v4.9-rc5
Date: Tue, 15 Nov 2016 18:04:23 +0100
Message-Id: <1479229463-22116-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have pushed renesas-drivers-2016-11-15-v4.9-rc5 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM SoCs. It is created by merging branches with driver code
submitted or planned for submission to maintainers into the development
branch of Simon Horman's renesas.git tree.

As we are currently focusing on a stable v4.9, no for-next branches
of various subsystem trees have been included.

Today's version is based on renesas-devel-20161114-v4.9-rc5.

Included branches with driver code:
  - clk-renesas-for-v4.10
  - sh-pfc-for-v4.10
  - topic/rcar-secondary-booting-in-debug-mode-v1-rebased1
  - topic/renesas-soc-id-v3
  - topic/r8a7796-ravb-v1-rebased1
  - topic/r8a7796-dmac-driver-v2-rebased1
  - topic/r8a7796-dmac-dts-v2-rebased1~3
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/sdr104-driver-v8
  - topic/vin-gen2-driver-v1-rebased2
  - topic/rcar-du-lvds-mode-selection-v1
  - topic/rcar-gen3-usb2-role-swap-v5
  - topic/dma-map-resource-v1
  - https://git.ragnatech.se/linux#for-renesas-drivers
  - topic/ipmmu-multi-arch-v5-rebased1
  - topic/r8a7795-ipmmu-v2-rebased3
  - topic/r8a7796-ipmmu-v1-rebased3
  - topic/salvator-x-ipmmu-rfc-v3-rebased4~1
  - topic/vin-gen2-dts-v1-rebased3
  - topic/vsp1-pa-improvements-v1-rebased1
  - topic/vsp1-writeback-v2-rebased1
  - git://linuxtv.org/pinchartl/media.git#drm/r8a7796/next
  - git://linuxtv.org/pinchartl/media.git#drm/next/lvds
  - topic/iommu-devel-du-rebased1
  - git://github.com/uli/kernel.git#r8a7795-hdmi-out-driver-v1
  - git://github.com/uli/kernel.git#r8a7795-hdmi-out-dts-v1
  - topic/r8a7795-es2-v1-rebased3
  - topic/r8a7796-64b-mem+ravb-prototype-v1-rebased2~1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
