Return-Path: <SRS0=CNOd=RD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5773CC10F00
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 15:34:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24FBA206DD
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 15:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1551368061;
	bh=ZsqKXICJm5SqmJ62b5L1X5qx0uaMbjJcRC2+EtDtRf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=uXFUauJ3J2A7hQ8V3+/qsquYbQWSc8xxJzpYEbER364Br5wFNl3GgBwHnOzIU+5C/
	 CA09IiZSW33K4MBDGO81l61+yZ9Zo+Lgw0ZSTqIMdOHq7jUVRrgZD3VJEbs69Lcr0+
	 +uk7+G3husdEn8ji1Ba5IC8JK7UvRwKWt4vwPxlg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732836AbfB1PI3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Feb 2019 10:08:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:40628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732816AbfB1PI2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Feb 2019 10:08:28 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4DA1B2184A;
        Thu, 28 Feb 2019 15:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1551366508;
        bh=ZsqKXICJm5SqmJ62b5L1X5qx0uaMbjJcRC2+EtDtRf8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X/Zm1KFRY59fsv3INBRRLrEXnpdXN5+jxSqI52dRyiMl0nPyuF+MTyWsrMyc3jHPh
         KI0oBjZiBHx6Zz7yP4X7YrAYpa/xgtMaWQzuXcH0oVTTpIXLGZHgv9ogL4eiPizMKC
         BPwe5kQV6mi/rdtrD76lNZRYZC57alSFDDuCwGxg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Sasha Levin <sashal@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.20 10/81] arm64: dts: renesas: r8a7796: Enable DMA for SCIF2
Date:   Thu, 28 Feb 2019 10:07:02 -0500
Message-Id: <20190228150813.10256-10-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190228150813.10256-1-sashal@kernel.org>
References: <20190228150813.10256-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

[ Upstream commit 97f26702bc95b5c3a72671d5c6675e4d6ee0a2f4 ]

SCIF2 on R-Car M3-W can be used with both DMAC1 and DMAC2.

Fixes: dbcae5ea4bd27409 ("arm64: dts: r8a7796: Enable SCIF DMA")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 1ec6aaa520c19..09320caea54ed 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1160,6 +1160,9 @@
 				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x13>, <&dmac1 0x12>,
+			       <&dmac2 0x13>, <&dmac2 0x12>;
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 310>;
 			status = "disabled";
-- 
2.19.1

