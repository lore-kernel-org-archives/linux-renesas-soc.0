Return-Path: <SRS0=Z6Jp=3F=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1B0C33CB6
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 Jan 2020 18:12:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F32AE2176D
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 16 Jan 2020 18:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579198327;
	bh=Z/6Je7W6tQDJpYaxxR+scce6bDJ+iS9rauUEIqMWV8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=rJpNPexVtgYd5gKh4mg4hpFKC0UNbPtQpctO0goYsPSfUpf2kDqbQWa9dcmeP4ByL
	 Nq67vrRfsmFMbQABJWj+vsTLff5SvH1jrncSMyBKfxoMv3OhsOKZZLoz/Q6Dt10ONo
	 jI0xuDYlOTKyh54CL4OHcPY9CEa20i+MYUY5NW7c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395172AbgAPSMG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 16 Jan 2020 13:12:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:52482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393043AbgAPRhT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jan 2020 12:37:19 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 566B92468C;
        Thu, 16 Jan 2020 17:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579196239;
        bh=Z/6Je7W6tQDJpYaxxR+scce6bDJ+iS9rauUEIqMWV8w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iGUbM5fCZs9RfVmDICjwCe9K21axWVSw8XkbjDwttrfz5BiyRyw2Ic2BREUHbQ6fD
         xr7UBfhxj185sGqty7DwpVi+uenh4P/yH45/jLt72ISvBKxiWXZydbd9HZq2uShzg+
         e4dEGMloC1cSTiFrQCMVoogYST7Rf0xsLNK1q47Q=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Sasha Levin <sashal@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 069/251] pinctrl: sh-pfc: sh73a0: Fix fsic_spdif pin groups
Date:   Thu, 16 Jan 2020 12:33:38 -0500
Message-Id: <20200116173641.22137-29-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116173641.22137-1-sashal@kernel.org>
References: <20200116173641.22137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

[ Upstream commit 0e6e448bdcf896d001a289a6112a704542d51516 ]

There are two pin groups for the FSIC SPDIF signal, but the FSIC pin
group array lists only one, and it refers to a nonexistent group.

Fixes: 2ecd4154c906b7d6 ("sh-pfc: sh73a0: Add FSI pin groups and functions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-sh73a0.c b/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
index f8fbedb46585..6dca760f9f28 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
@@ -3367,7 +3367,8 @@ static const char * const fsic_groups[] = {
 	"fsic_sclk_out",
 	"fsic_data_in",
 	"fsic_data_out",
-	"fsic_spdif",
+	"fsic_spdif_0",
+	"fsic_spdif_1",
 };
 
 static const char * const fsid_groups[] = {
-- 
2.20.1

