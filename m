Return-Path: <SRS0=K2hx=UX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17873C43613
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 24 Jun 2019 10:52:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAD9D20820
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 24 Jun 2019 10:52:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729383AbfFXKwp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 24 Jun 2019 06:52:45 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:59978 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728369AbfFXKwp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jun 2019 06:52:45 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3B4F825B775;
        Mon, 24 Jun 2019 20:52:42 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 085DFE21A80; Mon, 24 Jun 2019 12:52:40 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: renesas: r8a7799[05]: Add cpg reset for DU
Date:   Mon, 24 Jun 2019 12:52:22 +0200
Message-Id: <20190624105224.23927-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

this short series adds CPG reset for DU of the
R-Car E3 (r8a77995) and D3 (r8a77990) SoCs.

Based on renesas-devel-20190624-v5.2-rc6

Changes since v2
- rewrote changelogs

Changes since v1
- only add one reset entry per group

Takeshi Kihara (1):
  arm64: dts: renesas: r8a77990: Add cpg reset for DU

Yoshihiro Kaneko (1):
  arm64: dts: renesas: r8a77995: Add cpg reset for DU

 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.11.0

