Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F02C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 12:01:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CDE02086C
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 12:01:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbfDAMBz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 08:01:55 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:47438 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726544AbfDAMBz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 08:01:55 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id v01s1z0013XaVaC0101s3v; Mon, 01 Apr 2019 14:01:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hAvdP-0003gq-U5; Mon, 01 Apr 2019 14:01:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hAvdP-0007zj-SJ; Mon, 01 Apr 2019 14:01:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: shmobile: defconfig: Enable support for CFI NOR FLASH
Date:   Mon,  1 Apr 2019 14:01:48 +0200
Message-Id: <20190401120150.30687-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Simon, Magnus,

Now the DTS for the r8a73a4-based APE6EVM development board describes
its CFI NOR FLASH, this patch series enables support for that in
shmobile_defconfig and multi_v7_defconfig.

Note that kernels built from these configs cannot be booted by stock
APE6EVM U-Boot, due to kernel size.

Thanks!

Geert Uytterhoeven (2):
  ARM: shmobile: defconfig: Enable support for CFI NOR FLASH
  ARM: multi_v7_defconfig: Enable support for CFI NOR FLASH

 arch/arm/configs/multi_v7_defconfig | 4 ++++
 arch/arm/configs/shmobile_defconfig | 4 ++++
 2 files changed, 8 insertions(+)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
