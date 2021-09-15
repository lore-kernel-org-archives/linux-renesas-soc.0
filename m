Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F80FC433F5
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 15 Sep 2021 15:31:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E34BD60EC0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 15 Sep 2021 15:31:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234154AbhIOPdN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 11:33:13 -0400
Received: from www.zeus03.de ([194.117.254.33]:52718 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234041AbhIOPdM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 11:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=+g68ebCRCZBX9bKYoPLSg9flkJq
        HbS5gttOodVk4moM=; b=yaH9Er8J3i/ENToUefpaReInVXtHOOYWTfmgdjNtTwm
        Jip4xjgzJ4miwKB1yC6GN29BLP3GJZ9XXlnRERk4Pz59q/g9GlSyealSAv6OjImM
        onw3LYKtMWsES2Q0jpasBir1MZmDB6u0xSBPNo7DaRJ0LY5lopmjP85tyBnMNlMU
        =
Received: (qmail 868941 invoked from network); 15 Sep 2021 17:31:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Sep 2021 17:31:52 +0200
X-UD-Smtp-Session: l3s3148p1@g0i4ZQrMZM8gARa4RQ+9AROD5QHDIpVt
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] arm64: defconfig: add Renesas TPU as module
Date:   Wed, 15 Sep 2021 17:31:43 +0200
Message-Id: <20210915153143.25184-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For better build and test coverage.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 156d96afbbfc..45a17530dfa8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1091,6 +1091,7 @@ CONFIG_PWM_MESON=m
 CONFIG_PWM_MTK_DISP=m
 CONFIG_PWM_MEDIATEK=m
 CONFIG_PWM_RCAR=m
+CONFIG_PWM_RENESAS_TPU=m
 CONFIG_PWM_ROCKCHIP=y
 CONFIG_PWM_SAMSUNG=y
 CONFIG_PWM_SL28CPLD=m
-- 
2.30.2

