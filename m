Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2984C282DF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8692A222AF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbfDSSW2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:22:28 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfDSSW2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:22:28 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7547F25B7C3;
        Sat, 20 Apr 2019 00:34:00 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 644FFE21AF6; Fri, 19 Apr 2019 16:33:58 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates for v5.2
Date:   Fri, 19 Apr 2019 16:33:55 +0200
Message-Id: <cover.1555683861.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM64 based SoC DT updates
for v5.2.

This pull request is based on the previous round of
such requests, tagged as renesas-arm64-dt-for-v5.2,
which I have already sent a pull-request for.


The following changes since commit e3414b8c45afa5cdfb1ffd10f5334da3458c4aa5:

  arm64: dts: renesas: salvator-common: Add GPIO keys support (2019-03-27 13:02:12 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt2-for-v5.2

for you to fetch changes up to b7f5a8e435ecc7198407f44a2a5a6cdae1056b0d:

  arm64: dts: renesas: r8a77980: Add "renesas,id" to VIN (2019-04-15 10:43:26 +0200)

----------------------------------------------------------------
Second Round of Renesas ARM64 Based SoC DT Updates for v5.2

* R-Car H3 (r8a7795), M3-N (r8a77965) and E3 (r8a77990) SoCs
  - Describe CMT devices in DT

* R-Car M3-N (r8a77965) SoC
  - Remove unecessary reg-names of display node

* R-Car V3H (r8a77980) SoC
  - Add missing "renesas,id" property to VIN of device tree

* RZ/G2E (r8a774c0) based CAT874 board
  - Add USB-HOST support

----------------------------------------------------------------
Cao Van Dong (3):
      arm64: dts: renesas: r8a7795: Add CMT device nodes
      arm64: dts: renesas: r8a77965: Add CMT device nodes
      arm64: dts: renesas: r8a77990: Add CMT device nodes

Fabrizio Castro (1):
      arm64: dts: renesas: cat874: Add USB-HOST support

Jacopo Mondi (1):
      arm64: dts: renesas: r8a77980: Add "renesas,id" to VIN

Takeshi Kihara (1):
      arm64: dts: renesas: r8a77965: Remove reg-names of display node

 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 15 ++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi        | 70 ++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi       | 71 ++++++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi       | 16 ++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi       | 70 ++++++++++++++++++++++++
 5 files changed, 241 insertions(+), 1 deletion(-)
