Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EB3C433F5
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 20 Sep 2021 18:32:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C04F61213
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 20 Sep 2021 18:32:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352735AbhITSd3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 20 Sep 2021 14:33:29 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:30015 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1352743AbhITSb2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 14:31:28 -0400
X-IronPort-AV: E=Sophos;i="5.85,309,1624287600"; 
   d="scan'208";a="94482028"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 Sep 2021 03:29:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.208])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6779B40D2DB0;
        Tue, 21 Sep 2021 03:29:57 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add USB2.0/I2C support
Date:   Mon, 20 Sep 2021 19:29:53 +0100
Message-Id: <20210920182955.13445-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series enables USB Phy control, USB host/device
and i2c on RZ/G2L SMARC EVK.

This patch series is based on renesas-devel

Biju Das (2):
  arm64: dts: renesas: rzg2l-smarc: Enable USB2.0 support
  arm64: dts: renesas: rzg2l-smarc: Enable I2C{0,1,3} support

 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 100 +++++++++++++++++++
 1 file changed, 100 insertions(+)

-- 
2.17.1

