Return-Path: <SRS0=yd6p=CN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042DAC433E2
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Sep 2020 11:48:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF4522098B
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Sep 2020 11:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729297AbgIDLsl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Sep 2020 07:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728118AbgIDLsc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 07:48:32 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B93EC061246
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2020 04:48:31 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id PnoM2300D4C55Sk06noMQx; Fri, 04 Sep 2020 13:48:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEACb-0004eL-71; Fri, 04 Sep 2020 13:48:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEACb-0007sm-5t; Fri, 04 Sep 2020 13:48:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v5.10
Date:   Fri,  4 Sep 2020 13:48:17 +0200
Message-Id: <20200904114819.30254-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904114819.30254-1-geert+renesas@glider.be>
References: <20200904114819.30254-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.10-tag1

for you to fetch changes up to 5a87251dac0db8704d4d18b6dc7c23e30804585b:

  ARM: shmobile: defconfig: Enable CONFIG_PCIE_RCAR_HOST (2020-09-01 13:54:41 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.10

  - Enable touchscreen support on the iWave RZ/G1E platform,
  - Update for PCIE_RCAR => CONFIG_PCIE_RCAR_{HOST,EP} split, including
    enabling the latter,
  - Enable FLASH support on various R-Car Gen3 boards,
  - Refresh shmobile_defconfig for v5.9-rc1.

----------------------------------------------------------------
Biju Das (1):
      ARM: shmobile: defconfig: Enable TOUCHSCREEN_STMPE

Geert Uytterhoeven (2):
      ARM: shmobile: defconfig: Refresh for v5.9-rc1
      arm64: defconfig: Enable RPC-IF support

Lad Prabhakar (3):
      arm64: defconfig: Enable R-Car PCIe endpoint driver
      ARM: multi_v7_defconfig: Enable CONFIG_PCIE_RCAR_HOST
      ARM: shmobile: defconfig: Enable CONFIG_PCIE_RCAR_HOST

 arch/arm/configs/multi_v7_defconfig | 2 +-
 arch/arm/configs/shmobile_defconfig | 5 +++--
 arch/arm64/configs/defconfig        | 7 +++++++
 3 files changed, 11 insertions(+), 3 deletions(-)
