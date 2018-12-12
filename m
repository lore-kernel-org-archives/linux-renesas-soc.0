Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A49C65BAF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:54:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C21AA20839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:54:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="D486D8Nu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C21AA20839
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbeLLKyo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 05:54:44 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:44510 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbeLLKyo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 05:54:44 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BF3CA25B740;
        Wed, 12 Dec 2018 21:54:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544612082; bh=ezdPvSbf5zksIZHvtCKEf6zr/29Hou3VsrngMMcQMCE=;
        h=From:To:Cc:Subject:Date:From;
        b=D486D8NuGkflCu1ErR1Wbvnb1zHj2iPmpVVfrlLxMyJosWfGu8LqSdsE3wiscoLxx
         Vzg6xcJeH8Axp0MDBe+CXxV9r4R1B9leZOjeIVx1b/75ldGP9hNfNE/gOtR3Rw/6bv
         yb0b9DcQL6JtFoYVLiMiAR82jiKmYe2vEUK9aIz8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 20C359404C7; Wed, 12 Dec 2018 11:54:40 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH] ARM: shmobile: Add missing dts files to MAINTAINERS
Date:   Wed, 12 Dec 2018 11:54:35 +0100
Message-Id: <20181212105435.28310-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add some more patterns to the ARM/SHMOBILE ARM ARCHITECTURE
section of MAINTAINERS to complete the list of maintained dts files.

As of writing dts files covered are:
* arch/arm/boot/dts/gr-peach-audiocamerashield.dtsi
* arch/arm/boot/dts/iwg20d-q7-common.dtsi
* arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

 Based on renesas-devel-20181210-v4.20-rc6

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c7a08740cb7..2d4b90ffb14f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2075,6 +2075,8 @@ Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
 S:	Supported
 F:	arch/arm/boot/dts/emev2*
+F:	arch/arm/boot/dts/gr-peach*
+F:	arch/arm/boot/dts/iwg20d-q7*
 F:	arch/arm/boot/dts/r7s*
 F:	arch/arm/boot/dts/r8a*
 F:	arch/arm/boot/dts/r9a*
-- 
2.11.0

