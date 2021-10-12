Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E31C433F5
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Oct 2021 16:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCDD960EBB
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Oct 2021 16:51:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbhJLQxz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Oct 2021 12:53:55 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:40546 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231622AbhJLQxy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 12:53:54 -0400
X-IronPort-AV: E=Sophos;i="5.85,368,1624287600"; 
   d="scan'208";a="96964201"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Oct 2021 01:51:51 +0900
Received: from localhost.localdomain (unknown [10.226.92.46])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4F5A940AFC12;
        Wed, 13 Oct 2021 01:51:49 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add Ethernet support
Date:   Tue, 12 Oct 2021 17:51:42 +0100
Message-Id: <20211012165144.30350-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add Ethernet support on RZ/G2L SMARC EVK
platform.

This patch series has functional dependency on [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=561965

Biju Das (2):
  arm64: dts: renesas: r9a07g044: Add GbEther nodes
  arm64: dts: renesas: rzg2l-smarc-som: Enable Ethernet

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 40 ++++++++
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 97 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |  1 -
 3 files changed, 137 insertions(+), 1 deletion(-)

-- 
2.17.1

