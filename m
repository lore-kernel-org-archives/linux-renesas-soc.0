Return-Path: <SRS0=m7mt=5K=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C29BC1975A
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 25 Mar 2020 06:24:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B70920719
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 25 Mar 2020 06:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgCYGYi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 25 Mar 2020 02:24:38 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:53834 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725781AbgCYGYi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 02:24:38 -0400
X-IronPort-AV: E=Sophos;i="5.72,303,1580742000"; 
   d="scan'208";a="42786377"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Mar 2020 15:24:37 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A82824004CF2;
        Wed, 25 Mar 2020 15:24:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 0/2] arm64: dts: renesas: add USB2.0/3.0 device nodes for r8a77961
Date:   Wed, 25 Mar 2020 15:24:28 +0900
Message-Id: <1585117470-8625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds USB2.0/3.0 device nodes for r8a77961(R-Car M3-W+).
The dt-bindings of these devices are not merged yet. So, I marked
RFC on this patch series.

Yoshihiro Shimoda (2):
  arm64: dts: renesas: add USB2.0 device nodes for r8a77961
  arm64: dts: renesas: add USB3.0 device nodes for r8a77961

 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 122 +++++++++++++++++++++++++++---
 1 file changed, 112 insertions(+), 10 deletions(-)

-- 
2.7.4

