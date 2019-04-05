Return-Path: <SRS0=/r1Q=SH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E9BC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 06:20:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11E9D217D7
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 06:20:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbfDEGUQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 5 Apr 2019 02:20:16 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:45961 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbfDEGUQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Apr 2019 02:20:16 -0400
X-Greylist: delayed 2152 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Apr 2019 02:20:15 EDT
Received: from fsav403.sakura.ne.jp (fsav403.sakura.ne.jp [133.242.250.102])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x355iLuD074108;
        Fri, 5 Apr 2019 14:44:21 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav403.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav403.sakura.ne.jp);
 Fri, 05 Apr 2019 14:44:21 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav403.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x355i97L073953
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Apr 2019 14:44:20 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
From:   Cao Van Dong <cv-dong@jinso.co.jp>
To:     broonie@kernel.org, geert+renesas@glider.be,
        horms+renesas@verge.net.au, devicetree@vger.kernel.org
Cc:     yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH 0/4] Add CMT support for R-Car H3/M3-N/E3
Date:   Fri,  5 Apr 2019 14:44:05 +0900
Message-Id: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series adds CMT{0|1|2|3} device nodes for r8a7795/r8a77965/r8a77990 SoCs.
Based on the renesas-drivers-2019-04-02-v5.1-rc3 tag of renesas-drivers tree.

Cao Van Dong (4):
  arm64: dts: renesas: r8a7795: Add CMT device nodes
  arm64: dts: renesas: r8a77965: Add CMT device nodes
  arm64: dts: renesas: r8a77990: Add CMT device nodes
  dt-bindings: timer: renesas, cmt: Document r8a779{5|65|90} CMT support

 .../devicetree/bindings/timer/renesas,cmt.txt      |  6 ++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 70 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          | 70 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          | 70 ++++++++++++++++++++++
 4 files changed, 216 insertions(+)

-- 
2.7.4

