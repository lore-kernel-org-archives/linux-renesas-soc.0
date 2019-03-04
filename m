Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BB4C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 08:46:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43FEA20823
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 08:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1551689166;
	bh=b0WFPjyC8WBRnDjCS43IGPSB7Uv8ShFDJ2IkNZGc7l4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ZHHODu/+zpYE0OskageFNFhpp3Wzn0Qxq+BVy8tE4r0f6XTjc2IUnD32/I+mzHixd
	 /CG+9StFdvkgDkkPDql34OKmoNNyWUqIQHlh1X4AFJ0eeyH9Ncx1xaLJi/CLLSBVmv
	 0iWmOZZnutoU8HW2RpGaOmmu/fSNaTYtSLkDpC4A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfCDI1I (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 03:27:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:49856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726957AbfCDI1G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 03:27:06 -0500
Received: from localhost (5356596B.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1D8A20823;
        Mon,  4 Mar 2019 08:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1551688025;
        bh=b0WFPjyC8WBRnDjCS43IGPSB7Uv8ShFDJ2IkNZGc7l4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MBJ1qOapgbpuqywrNSmEu8DQMgHIuKor4lh3TZopqGMZ/6/aX0LdoDY9/Dm6pUTxp
         RGHkfY5hlsmGWAy1Cv6jGQuWrvMTt8eOym6oPfkAu82sZjZnldY6CK5gSirf7lFfvw
         rrRee4nEKcvsinTGzeZ8DJKIic+IESfBYlCFyco4=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.14 11/52] clk: vc5: Abort clock configuration without upstream clock
Date:   Mon,  4 Mar 2019 09:22:09 +0100
Message-Id: <20190304081617.773994763@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190304081617.159014799@linuxfoundation.org>
References: <20190304081617.159014799@linuxfoundation.org>
User-Agent: quilt/0.65
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

4.14-stable review patch.  If anyone has any objections, please let me know.

------------------

[ Upstream commit 2137a109a5e39c2bdccfffe65230ed3fadbaac0e ]

In case the upstream clock are not set, which can happen in case the
VC5 has no valid upstream clock, the $src variable is used uninited
by regmap_update_bits(). Check for this condition and return -EINVAL
in such case.

Note that in case the VC5 has no valid upstream clock, the VC5 can
not operate correctly. That is a hardware property of the VC5. The
internal oscilator present in some VC5 models is also considered
upstream clock.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Alexey Firago <alexey_firago@mentor.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
[sboyd@kernel.org: Added comment about probe preventing this from
happening in the first place]
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/clk-versaclock5.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index decffb3826ece..a738af893532f 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -262,8 +262,10 @@ static int vc5_mux_set_parent(struct clk_hw *hw, u8 index)
 
 		if (vc5->clk_mux_ins == VC5_MUX_IN_XIN)
 			src = VC5_PRIM_SRC_SHDN_EN_XTAL;
-		if (vc5->clk_mux_ins == VC5_MUX_IN_CLKIN)
+		else if (vc5->clk_mux_ins == VC5_MUX_IN_CLKIN)
 			src = VC5_PRIM_SRC_SHDN_EN_CLKIN;
+		else /* Invalid; should have been caught by vc5_probe() */
+			return -EINVAL;
 	}
 
 	return regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, mask, src);
-- 
2.19.1



