Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8C1C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:44:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CFFA2133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731939AbeLQOoG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:44:06 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:26039 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726574AbeLQOoG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:44:06 -0500
X-IronPort-AV: E=Sophos;i="5.56,365,1539615600"; 
   d="scan'208";a="3052355"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Dec 2018 23:44:04 +0900
Received: from rtamta01.rta.renesas.com (transport.eroom.renesas.com [143.103.48.75])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 28F01496F66F;
        Mon, 17 Dec 2018 23:44:04 +0900 (JST)
Received: from ubuntu.localdomain (unknown [143.103.58.81])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id 4559D96;
        Mon, 17 Dec 2018 14:44:03 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 0/2] Add Initial Device Tree for RZ/A2
Date:   Mon, 17 Dec 2018 09:43:22 -0500
Message-Id: <20181217144324.99422-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a Device Tree for RZ/A2 and the existing eval board.

Once these get approved, I'll start piling on the other drivers in
another patch series

NOTE:
Since Rob is currently converting shmobile.txt to renesas.yaml,
I'll wait till renesas.yaml hits -next, then add this RZ/A2M EVB
board (it's too confusing to me to figure out how to make a patch
series using multiple different trees)

Chris Brandt (2):
  ARM: dts: r7s9210: Initial SoC device tree
  ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB

 arch/arm/boot/dts/Makefile             |   1 +
 arch/arm/boot/dts/r7s9210-rza2mevb.dts |  82 +++++++++++++
 arch/arm/boot/dts/r7s9210.dtsi         | 204 +++++++++++++++++++++++++++++++++
 3 files changed, 287 insertions(+)
 create mode 100644 arch/arm/boot/dts/r7s9210-rza2mevb.dts
 create mode 100644 arch/arm/boot/dts/r7s9210.dtsi

-- 
2.16.1

