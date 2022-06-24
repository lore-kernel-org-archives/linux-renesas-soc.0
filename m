Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B47ECCA473
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 24 Jun 2022 12:01:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbiFXMBr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 24 Jun 2022 08:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiFXMBp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jun 2022 08:01:45 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD73B7E030
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jun 2022 05:01:43 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id n01f270074C55Sk0101fN3; Fri, 24 Jun 2022 14:01:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o4i0I-000gWc-Lv; Fri, 24 Jun 2022 14:01:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o4i0H-009mqM-Tg; Fri, 24 Jun 2022 14:01:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v5.20
Date:   Fri, 24 Jun 2022 14:01:32 +0200
Message-Id: <cover.1656069640.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656069631.git.geert+renesas@glider.be>
References: <cover.1656069631.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.20-tag1

for you to fetch changes up to 774fecc7ece1d5b7c604402ac2daede14825a467:

  dt-bindings: soc: renesas: Move renesas,prr from arm to soc (2022-06-17 09:18:33 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.20

  - Reorganize the renesas,prr DT binding document.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: soc: renesas: Move renesas,prr from arm to soc

 .../devicetree/bindings/{arm => soc/renesas}/renesas,prr.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/{arm => soc/renesas}/renesas,prr.yaml (85%)
