Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3033DC433FE
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Nov 2022 16:45:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242011AbiKRQpT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Nov 2022 11:45:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241647AbiKRQpR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 11:45:17 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9DB13EAF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 08:45:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d0b:c833:41f6:da0e])
        by xavier.telenet-ops.be with bizsmtp
        id lslC2800E29fmst01slC57; Fri, 18 Nov 2022 17:45:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ow4UK-000pA9-Ec; Fri, 18 Nov 2022 17:45:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ow4UJ-00FrgI-TO; Fri, 18 Nov 2022 17:45:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/7] Renesas ARM defconfig updates for v6.2
Date:   Fri, 18 Nov 2022 17:44:58 +0100
Message-Id: <cover.1668788920.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668788918.git.geert+renesas@glider.be>
References: <cover.1668788918.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.2-tag1

for you to fetch changes up to fa8eec59570923f4132253e61c45f9d70377f049:

  arm64: defconfig: Enable Renesas R-Car S4-8 Spider Ethernet devices (2022-11-18 17:12:30 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.2

  - Enable support for Renesas R-Car S4-8 Spider Ethernet devices in the
    arm64 defconfig.

----------------------------------------------------------------
Yoshihiro Shimoda (1):
      arm64: defconfig: Enable Renesas R-Car S4-8 Spider Ethernet devices

 arch/arm64/configs/defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
