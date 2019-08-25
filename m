Return-Path: <SRS0=6xpY=WV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E660C3A5A1
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 25 Aug 2019 14:00:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 001122070B
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 25 Aug 2019 14:00:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbfHYOAQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 25 Aug 2019 10:00:16 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:60237 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728359AbfHYOAQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Aug 2019 10:00:16 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F2498FF80D;
        Sun, 25 Aug 2019 14:00:12 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: renesas: Add LIF channel to 'vsps' property
Date:   Sun, 25 Aug 2019 16:01:33 +0200
Message-Id: <20190825140135.12150-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

V2 of this patch splits the DTS changes from the updating of the DU driver
comment as suggested by Laurent and Geert.

Patches based on renesas-devel-2019-08-21.

Thanks
  j

Jacopo Mondi (2):
  arm64: dts: renesas: Add LIF channel indices to vsps property
  drm: rcar-du: kms: Expand comment in vsps parsing routine

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi     | 2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi    | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c        | 6 +++++-
 6 files changed, 10 insertions(+), 6 deletions(-)

--
2.23.0

