Return-Path: <SRS0=MG+9=YZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9E0CA9ED3
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Nov 2019 15:58:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E89D2190F
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Nov 2019 15:58:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfKAP65 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Nov 2019 11:58:57 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:57998 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfKAP64 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Nov 2019 11:58:56 -0400
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id Lfyu210055USYZQ01fyus7; Fri, 01 Nov 2019 16:58:54 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZKA-0002ra-9J; Fri, 01 Nov 2019 16:58:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZKA-0008CZ-8b; Fri, 01 Nov 2019 16:58:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/6] Renesas ARM64 defconfig updates for v5.5 (take two)
Date:   Fri,  1 Nov 2019 16:58:39 +0100
Message-Id: <20191101155842.31467-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191101155842.31467-1-geert+renesas@glider.be>
References: <20191101155842.31467-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit d8b178741e5ba571fbcc187c9e3cf9c0eaebf328:

  arm64: defconfig: Enable R8A774B1 SoC (2019-10-01 09:51:58 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm64-defconfig-for-v5.5-tag2

for you to fetch changes up to b13d0e61629b09153ddbc52eb8b57af7805c0851:

  arm64: defconfig: Enable R8A77961 SoC (2019-11-01 14:06:01 +0100)

----------------------------------------------------------------
Renesas ARM64 defconfig updates for v5.5 (take two)

  - Enable support for the new R-Car M3-W+ (r8a77961) SoC.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: defconfig: Enable R8A77961 SoC

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
