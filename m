Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:47358 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755850AbcJYL4k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Oct 2016 07:56:40 -0400
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
        by ayla.of.borg with esmtp (Exim 4.82)
        (envelope-from <geert@linux-m68k.org>)
        id 1bz0LM-0001o6-Lh
        for linux-renesas-soc@vger.kernel.org; Tue, 25 Oct 2016 13:56:36 +0200
Received: from geert by ramsan with local (Exim 4.82)
        (envelope-from <geert@linux-m68k.org>)
        id 1bz0LR-0006DA-Tb
        for linux-renesas-soc@vger.kernel.org; Tue, 25 Oct 2016 13:56:41 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2016-10-25-v4.9-rc2
Date: Tue, 25 Oct 2016 13:56:41 +0200
Message-Id: <1477396601-23841-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have pushed renesas-drivers-2016-10-25-v4.9-rc2 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM SoCs. It is created by merging branches with driver code
submitted or planned for submission to maintainers into the development
branch of Simon Horman's renesas.git tree.

As we are currently focusing on a stable v4.9, no for-next branches
of various subsystem trees have been included.

Today's version is based on renesas-devel-20161024-v4.9-rc2.

Included branches with driver code:
  - clk-renesas-for-v4.10
  - sh-pfc-for-v4.10
  - topic/rcar-rst-v4
  - topic/rcar-secondary-booting-in-debug-mode-v1-rebased1
  - topic/renesas-soc-id-v1-rebased1
  - topic/r8a7796-ravb-v1-rebased1
  - topic/r8a7796-dmac-driver-v1-rebased2
  - topic/r8a7796-dmac-dts-v1-rebased2~3
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/sdr104-driver-v7
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/sdr104-integration-v7
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/sdr104-v7
  - git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git#renesas/topic/sdhi-8bit-emmc
  - topic/vin-gen2-driver-v1-rebased2
  - topic/rcar-du-lvds-mode-selection-v1
  - topic/rcar-gen3-usb2-role-swap-v1
  - topic/dma-map-resource-v1
  - https://git.ragnatech.se/linux#histogram
  - git://linuxtv.org/pinchartl/media.git#iommu/devel/du
  - topic/ipmmu-multi-arch-v5-rebased1
  - topic/r8a7795-ipmmu-v2-rebased3
  - topic/r8a7796-ipmmu-v1-rebased3
  - topic/salvator-x-ipmmu-rfc-v3-rebased4~1
  - topic/vin-gen2-dts-v1-rebased2
  - topic/r8a7795-es2-v1-rebased1

Included fixes:
  - tty: serial_core: Fix serial console crash on port shutdown

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
