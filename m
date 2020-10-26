Return-Path: <SRS0=S8os=EB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0DFC2D0A3
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 26 Oct 2020 23:54:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4FBA221FC
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 26 Oct 2020 23:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603756477;
	bh=DgsLJmdwDm+iZqr9b4sB4qpBpPNmURVNQ9bdUajr2T0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=mABRnR8+MTSGbRVxuBWG/BpdSxPn+rc6GZLC38qAr5Br9021p2VMkL4gZJuwdST0e
	 Qinu589bNfttH4hO7NXKwavh9CB/jtZDFVjrVzxlKbIaczfDDWXkJ8SVe/2aePvUhn
	 G9vsV5zPHwZbl1lNW4ZaXDUeZYKgIoo1sAtJtogo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410501AbgJZXyh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 19:54:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:60554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2410491AbgJZXyf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 19:54:35 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4DF420B1F;
        Mon, 26 Oct 2020 23:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603756474;
        bh=DgsLJmdwDm+iZqr9b4sB4qpBpPNmURVNQ9bdUajr2T0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ysJZec5XVvn7Eo7qWoTU7wVUxL/WG/Th0YfcNKedVOj5TQ63rqJGQKTblgYd92Wbm
         M+0Qqykk/h5CEN/rspT6NzmquJkbC2Mpswy3qni87kJZ4kH9X9BR2ahHtIUuXQnFiI
         j3ctoj074dmkCORU4kvhkMkf/p/FtCAFsztK1B6U=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sasha Levin <sashal@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 120/132] arm64: dts: renesas: ulcb: add full-pwr-cycle-in-suspend into eMMC nodes
Date:   Mon, 26 Oct 2020 19:51:52 -0400
Message-Id: <20201026235205.1023962-120-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026235205.1023962-1-sashal@kernel.org>
References: <20201026235205.1023962-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

[ Upstream commit 992d7a8b88c83c05664b649fc54501ce58e19132 ]

Add full-pwr-cycle-in-suspend property to do a graceful shutdown of
the eMMC device in system suspend.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Link: https://lore.kernel.org/r/1594989201-24228-1-git-send-email-yoshihiro.shimoda.uh@renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index ff88af8e39d3f..a2e085db87c53 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -469,6 +469,7 @@ &sdhi2 {
 	mmc-hs200-1_8v;
 	mmc-hs400-1_8v;
 	non-removable;
+	full-pwr-cycle-in-suspend;
 	status = "okay";
 };
 
-- 
2.25.1

