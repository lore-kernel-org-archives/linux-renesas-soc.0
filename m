Return-Path: <SRS0=bcL1=6O=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2260C8300A
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 30 Apr 2020 08:48:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B5C420787
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 30 Apr 2020 08:48:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgD3Isj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 30 Apr 2020 04:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726531AbgD3Isj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Apr 2020 04:48:39 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B2FC035494
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2020 01:48:38 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:182a:142e:a95f:66c2])
        by laurent.telenet-ops.be with bizsmtp
        id Ywoc220090w8ZL601wocCu; Thu, 30 Apr 2020 10:48:36 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4s0-0002kK-3M; Thu, 30 Apr 2020 10:48:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4s0-0000N3-0t; Thu, 30 Apr 2020 10:48:36 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v5.7
Date:   Thu, 30 Apr 2020 10:48:34 +0200
Message-Id: <20200430084834.1384-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v5.7-tag1

for you to fetch changes up to b704fc1da9b84d7145db550a13e2b7140f6b419b:

  ARM: dts: r7s9210: Remove bogus clock-names from OSTM nodes (2020-04-28 10:15:38 +0200)

----------------------------------------------------------------
Renesas fixes for v5.7

  - Fix IOMMU support on R-Car V3H,
  - Minor fixes that are fast-tracked to avoid introducing regressions
    during conversion of DT bindings to json-schema.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (2):
      ARM: dts: r8a73a4: Add missing CMT1 interrupts
      ARM: dts: r7s9210: Remove bogus clock-names from OSTM nodes

Yoshihiro Shimoda (1):
      arm64: dts: renesas: r8a77980: Fix IPMMU VIP[01] nodes

 arch/arm/boot/dts/r7s9210.dtsi            | 3 ---
 arch/arm/boot/dts/r8a73a4.dtsi            | 9 ++++++++-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 ++
 3 files changed, 10 insertions(+), 4 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
