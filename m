Return-Path: <SRS0=bcL1=6O=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F6FC8300A
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 30 Apr 2020 08:48:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D6AF21D80
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 30 Apr 2020 08:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgD3Isy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 30 Apr 2020 04:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726531AbgD3Isx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Apr 2020 04:48:53 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9871DC035494
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2020 01:48:53 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:182a:142e:a95f:66c2])
        by albert.telenet-ops.be with bizsmtp
        id Ywor2200W0w8ZL606worP6; Thu, 30 Apr 2020 10:48:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sF-0002l2-Fw; Thu, 30 Apr 2020 10:48:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sF-0000OM-F0; Thu, 30 Apr 2020 10:48:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/5] Renesas ARM defconfig updates for v5.8
Date:   Thu, 30 Apr 2020 10:48:45 +0200
Message-Id: <20200430084849.1457-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430084849.1457-1-geert+renesas@glider.be>
References: <20200430084849.1457-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.8-tag1

for you to fetch changes up to 4c427ab28fd1cd988fce9517527476cfebd27485:

  ARM: shmobile: defconfig: Refresh for v5.7-rc1 (2020-04-20 10:02:46 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.8

  - Refresh shmobile_defconfig for v5.7-rc1.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v5.7-rc1

 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)
