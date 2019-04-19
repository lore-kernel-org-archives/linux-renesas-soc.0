Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A332EC282DA
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77C81222AF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbfDSSXG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:23:06 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727485AbfDSSXG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:23:06 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0A79125BEEC;
        Sat, 20 Apr 2019 00:35:36 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 02D0BE21AF6; Fri, 19 Apr 2019 16:35:34 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v5.2
Date:   Fri, 19 Apr 2019 16:35:33 +0200
Message-Id: <cover.1555684195.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT bindings updates for v5.2.


The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v5.2

for you to fetch changes up to 3961d355dfb512b1b004e32a382c25a90367e6fd:

  dt-bindings: power: r8a77965: Remove non-existent A3IR power domain (2019-03-18 10:33:58 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC DT Bindings Updates for v5.2

* R-Car M3-N (r8a77965) SoC
  - Remove non-existent A3IR power domain

* Add vendor prefix for Silicon Linux

----------------------------------------------------------------
Biju Das (1):
      dt-bindings: Add vendor prefix for Silicon Linux.

Geert Uytterhoeven (1):
      dt-bindings: power: r8a77965: Remove non-existent A3IR power domain

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 include/dt-bindings/power/r8a77965-sysc.h             | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)
