Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662D4C282E5
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 01:25:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35DCA2175B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 01:25:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387795AbfDYBZt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 21:25:49 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:23992 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728794AbfDYBZt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 21:25:49 -0400
Received: from fsav108.sakura.ne.jp (fsav108.sakura.ne.jp [27.133.134.235])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x3P1PKNU002839;
        Thu, 25 Apr 2019 10:25:20 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav108.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav108.sakura.ne.jp);
 Thu, 25 Apr 2019 10:25:20 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav108.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x3P1PHsb002801
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 25 Apr 2019 10:25:20 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
From:   Cao Van Dong <cv-dong@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        geert+renesas@glider.be, broonie@kernel.org,
        devicetree@vger.kernel.org, mark.rutland@arm.com,
        daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org
Cc:     yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
Subject: [PATCH v2 0/5] Add TPU support for R-Car H3/M3-W/M3-N 
Date:   Thu, 25 Apr 2019 10:25:12 +0900
Message-Id: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series adds tpu support for r8a7795/r8a7796/r8a77965 SoCs.
Based on the renesas-drivers-2019-04-02-v5.1-rc3 tag of renesas-drivers tree.
For test, after booting, I found the device was registered in the booting log.

Cao Van Dong (5):
  clk: renesas: r8a779{5|6|65}: Add TPU clock
  arm64: dts: renesas: r8a7795: Add TPU support
  arm64: dts: renesas: r8a7796: Add TPU support
  arm64: dts: renesas: r8a77965: Add TPU support
  dt-bindings: pwm: renesas: tpu: Document R8A779{5|6|65} bindings

 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt |  3 +++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi                  | 11 +++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi                  | 11 +++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi                 | 11 +++++++++++
 drivers/clk/renesas/r8a7795-cpg-mssr.c                    |  1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c                    |  1 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c                   |  1 +
 7 files changed, 39 insertions(+)

-- 
2.7.4

