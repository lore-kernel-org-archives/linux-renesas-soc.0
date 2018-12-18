Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2062C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 17:06:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C008217D9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 17:06:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbeLRRGG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 12:06:06 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:56243 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726868AbeLRRGF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 12:06:05 -0500
X-IronPort-AV: E=Sophos;i="5.56,368,1539615600"; 
   d="scan'208";a="3165493"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 19 Dec 2018 02:06:03 +0900
Received: from rtamta01.rta.renesas.com (transport.eroom.renesas.com [143.103.48.75])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CDA1440174BA;
        Wed, 19 Dec 2018 02:06:03 +0900 (JST)
Received: from ubuntu.localdomain (unknown [143.103.58.94])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id D62CFA8;
        Tue, 18 Dec 2018 17:06:02 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v4 0/2] Add Initial Device Tree for RZ/A2
Date:   Tue, 18 Dec 2018 12:05:53 -0500
Message-Id: <20181218170555.121673-1-chris.brandt@renesas.com>
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
 arch/arm/boot/dts/r7s9210.dtsi         | 218 +++++++++++++++++++++++++++++++++
 3 files changed, 301 insertions(+)
 create mode 100644 arch/arm/boot/dts/r7s9210-rza2mevb.dts
 create mode 100644 arch/arm/boot/dts/r7s9210.dtsi

-- 
2.16.1

