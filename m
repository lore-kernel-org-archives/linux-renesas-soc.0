Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF06BC43217
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Apr 2022 14:55:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347061AbiDVO6E (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Apr 2022 10:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448626AbiDVO57 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 10:57:59 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52F960D6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Apr 2022 07:54:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2928:9f72:c4af:fbd9])
        by xavier.telenet-ops.be with bizsmtp
        id Mquw2700L2Ah9RF01quwKK; Fri, 22 Apr 2022 16:54:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhugS-001cQA-Af; Fri, 22 Apr 2022 16:54:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhugR-00COlP-PO; Fri, 22 Apr 2022 16:54:55 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas driver updates for v5.19
Date:   Fri, 22 Apr 2022 16:54:52 +0200
Message-Id: <cover.1650638515.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650638502.git.geert+renesas@glider.be>
References: <cover.1650638502.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.19-tag1

for you to fetch changes up to 2f89bef90de4740be33b2cb4ba95e0107df0d25e:

  soc: renesas: Identify RZ/G2UL SoC (2022-04-04 11:01:53 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.19

  - Initial support for the new RZ/G2UL SoC.

----------------------------------------------------------------
Biju Das (1):
      soc: renesas: Identify RZ/G2UL SoC

 drivers/soc/renesas/Kconfig       |  6 ++++++
 drivers/soc/renesas/renesas-soc.c | 13 +++++++++++++
 2 files changed, 19 insertions(+)
