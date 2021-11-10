Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DC3C433F5
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Nov 2021 08:42:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DF6A61076
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Nov 2021 08:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbhKJIpZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Nov 2021 03:45:25 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:47787 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230258AbhKJIpZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 03:45:25 -0500
X-IronPort-AV: E=Sophos;i="5.87,223,1631545200"; 
   d="scan'208";a="100086081"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Nov 2021 17:42:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2AB6C42412BE;
        Wed, 10 Nov 2021 17:42:34 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Enable RZ/G2L OSTM support
Date:   Wed, 10 Nov 2021 08:42:29 +0000
Message-Id: <20211110084232.652-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to enable Generic Timer Module (a.k.a OSTM) support
for RZ/G2L SMARC platform.

This patch series is depend upon [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=577857

Biju Das (3):
  drivers: soc: renesas: Enable RENESAS_OSTM
  arm64: dts: renesas: r9a07g044: Add OSTM nodes
  arm64: dts: renesas: rzg2l-smarc-som: Enable OSTM

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 33 +++++++++++++++++++
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     |  8 +++++
 drivers/soc/renesas/Kconfig                   |  1 +
 3 files changed, 42 insertions(+)

-- 
2.17.1

