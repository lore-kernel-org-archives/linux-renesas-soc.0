Return-Path: <SRS0=fckF=WT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEC4C3A5A5
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 23 Aug 2019 12:36:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82685233FE
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 23 Aug 2019 12:36:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389943AbfHWMg5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 23 Aug 2019 08:36:57 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:40594 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732384AbfHWMg4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Aug 2019 08:36:56 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id sccr2000k05gfCL01ccrcd; Fri, 23 Aug 2019 14:36:55 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i18oF-0006YM-D3; Fri, 23 Aug 2019 14:36:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i18oF-0004uI-Bu; Fri, 23 Aug 2019 14:36:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL 1/5] Renesas ARM DT updates for v5.4
Date:   Fri, 23 Aug 2019 14:36:39 +0200
Message-Id: <20190823123643.18799-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190823123643.18799-1-geert+renesas@glider.be>
References: <20190823123643.18799-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.4-tag1

for you to fetch changes up to 57012813f1ba82412cdcc3665b04d4353b357378:

  ARM: dts: r8a77470: Add PMU device node (2019-08-21 10:28:57 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.4

  - Fix HSCIF PM Domain on R-Car H1,
  - PMU support for RZ/G1C.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      ARM: dts: r8a7779: Use SYSC "always-on" PM Domain for HSCIF
      ARM: dts: r8a77470: Add PMU device node

 arch/arm/boot/dts/r8a77470.dtsi | 7 +++++++
 arch/arm/boot/dts/r8a7779.dtsi  | 4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)
