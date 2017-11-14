Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:58556 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754013AbdKNRIT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2017 12:08:19 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: ysato@users.sourceforge.jp, dalias@libc.org,
        laurent.pinchart@ideasonboard.com, geert@linux-m68k.org
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-sh@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Migo-R: reserve memory block with memblock APIs
Date: Tue, 14 Nov 2017 18:08:04 +0100
Message-Id: <1510679286-6988-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Re-spinn of "[PATCH] sh: migor: Reserve memory block for CEU" with additional
patch on top to post-pone page_to_pfn() mapping during mmap() on DMA memory.

Laurent is probably working on a proper fix, so I'm just copying the iommu list
here to make them aware of the problem on SH4 architecture, but please do not
consider that patch for inclusion for now.

Thanks
   j

Jacopo Mondi (2):
  sh: migor: Reserve memory block for CEU
  base: dma-mapping: Postpone page_to_pfn() on mmap()

 arch/sh/boards/mach-migor/setup.c | 29 +++++++++++++++++++++++++++--
 drivers/base/dma-mapping.c        |  3 ++-
 2 files changed, 29 insertions(+), 3 deletions(-)

--
2.7.4
