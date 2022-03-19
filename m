Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A7BC433EF
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Mar 2022 22:33:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234421AbiCSWeo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 19 Mar 2022 18:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244289AbiCSWel (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Mar 2022 18:34:41 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 669161401F
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Mar 2022 15:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=jujWFwWUN6GDmMsJu5aWA7fgLX6
        gCUmbl66ZFhjteBU=; b=W/eNriIjcal3rIr/wajCADD2K42QSlLJeXmuBtxqwqD
        WLqlNknO4Dor0t7ftp2qzAffWhxb9OXlJt8SsaJXkf7NG1Her0pWd5s+dDyjKntF
        /atnpbd7GQ5UKoYq7zXqjXYqDMDANFQT5YbBqCxfzb/OP3YrQvb+085L5imwI0sU
        =
Received: (qmail 252382 invoked from network); 19 Mar 2022 23:33:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2022 23:33:17 +0100
X-UD-Smtp-Session: l3s3148p1@3kd12Zna0twgAQnoAFEUAKkXZRZ8X9Wv
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a77961: improvements from BSP
Date:   Sat, 19 Mar 2022 23:33:04 +0100
Message-Id: <20220319223306.60782-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The BSP has these two additions for M3-W+ which also make sense upstream.

Koji Matsuoka (1):
  arm64: dts: renesas: r8a77961: Add CAN-FD node

LUU HOAI (1):
  arm64: dts: renesas: r8a77961: Add i2c aliases

 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

-- 
2.30.2

