Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB0DC4320E
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Sep 2021 11:13:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E11A60F4B
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  1 Sep 2021 11:13:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241796AbhIALOJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 1 Sep 2021 07:14:09 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:19484 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S241803AbhIALOJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 07:14:09 -0400
X-IronPort-AV: E=Sophos;i="5.84,369,1620658800"; 
   d="scan'208";a="92601866"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2021 20:13:11 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A1F1F44258F1;
        Wed,  1 Sep 2021 20:13:11 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779a0: Add initial IPMMU support
Date:   Wed,  1 Sep 2021 20:13:03 +0900
Message-Id: <20210901111305.570206-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch add initial IPMMU support. The dt-binding doc for
renesas,ipmmu-r8a779a0 is under review now [1]

[1]
https://lore.kernel.org/linux-renesas-soc/20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com/

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a779a0: Add IPMMU nodes
  arm64: dts: renesas: r8a779a0: Add iommus into sdhi node

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 98 +++++++++++++++++++++++
 1 file changed, 98 insertions(+)

-- 
2.25.1

