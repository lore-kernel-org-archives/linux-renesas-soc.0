Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCDDC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Jan 2021 10:08:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9353221F0
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Jan 2021 10:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbhAUKIn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Jan 2021 05:08:43 -0500
Received: from www.zeus03.de ([194.117.254.33]:48354 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728944AbhAUKH2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 05:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=6cf9PiREKjLcxXhTnvsDwRcL3fh
        F1gVBXgl5/gVShzM=; b=w6mDgySbXWyth1D80xQGSppaOVJRfxl3y/ZJA/4dsED
        Yz89v1l/7KliugVnCh2s64mZYSlUOJ4gHmTtmmRWp4q0LpEPKBb/DXudtXXmgxMc
        uqWHpYk8SkkGCQlJ17fIeseOCnIc5AFVgEKP14xth/67gZQi7qms13YjdJY3HNSI
        =
Received: (qmail 1790345 invoked from network); 21 Jan 2021 11:06:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 11:06:24 +0100
X-UD-Smtp-Session: l3s3148p1@8htQOWa5sL4gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/5] v3u: add support for RAVB
Date:   Thu, 21 Jan 2021 11:06:14 +0100
Message-Id: <20210121100619.5653-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is the updated series to enable RAVB on V3U. Please check the
individual patches for updates. Please note that the last patch is not
for inclusion yet.

Tho Vu (1):
  arm64: dts: renesas: r8a779a0: Add Ethernet-AVB support

Wolfram Sang (4):
  dt-bindings: net: renesas,etheravb: Add r8a779a0 support
  clk: renesas: r8a779a0: add clocks for RAVB
  arm64: dts: renesas: falcon: Add Ethernet-AVB0 support
  WIP! arm64: dts: renesas: falcon: Add Ethernet-AVB1-5 support

 .../bindings/net/renesas,etheravb.yaml        |   2 +
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 195 ++++++++++++
 .../boot/dts/renesas/r8a779a0-falcon.dts      |   1 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 282 ++++++++++++++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       |   6 +
 5 files changed, 486 insertions(+)

-- 
2.29.2

