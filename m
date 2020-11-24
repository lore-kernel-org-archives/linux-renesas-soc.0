Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EB1C2D0E4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 24 Nov 2020 11:26:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4E162075A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 24 Nov 2020 11:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732077AbgKXL0H (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 24 Nov 2020 06:26:07 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:29824 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728346AbgKXL0H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 06:26:07 -0500
X-IronPort-AV: E=Sophos;i="5.78,366,1599490800"; 
   d="scan'208";a="63502443"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Nov 2020 20:26:06 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 07C814362273;
        Tue, 24 Nov 2020 20:26:03 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/5] memory: renesas-rpc-if: Trivial fixes
Date:   Tue, 24 Nov 2020 11:25:47 +0000
Message-Id: <20201124112552.26377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series fixes trivial issues in RPC-IF driver.

Cheers,
Prabhakar

Lad Prabhakar (5):
  memory: renesas-rpc-if: Return correct value to the caller of
    rpcif_manual_xfer()
  memory: renesas-rpc-if: Make rpcif_enable/disable_rpm() as static
    inline
  memory: renesas-rpc-if: Export symbols as GPL
  memory: renesas-rpc-if: Avoid use of C++ style comments
  memory: renesas-rpc-if: Fix a reference leak in rpcif_probe()

 drivers/memory/renesas-rpc-if.c | 28 +++++++++-------------------
 include/memory/renesas-rpc-if.h | 19 ++++++++++++++-----
 2 files changed, 23 insertions(+), 24 deletions(-)

-- 
2.17.1

