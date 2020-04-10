Return-Path: <SRS0=ylRb=52=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF48FC2BB85
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 10 Apr 2020 10:47:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A11422084D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 10 Apr 2020 10:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgDJKrn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 10 Apr 2020 06:47:43 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:28960 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725955AbgDJKrn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 06:47:43 -0400
X-IronPort-AV: E=Sophos;i="5.72,366,1580742000"; 
   d="scan'208";a="44372300"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Apr 2020 19:47:42 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 93F0642105A8;
        Fri, 10 Apr 2020 19:47:42 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 0/2] arm64: dts: renesas: add some device nodes for r8a77961
Date:   Fri, 10 Apr 2020 19:47:12 +0900
Message-Id: <1586515634-28095-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on renesas-devel / renesas-arm64-dt-for-v5.8
branch. Since the dt-bindings for these device nodes are submitting now [1],
I marked RFC on this patch series.

[1]
https://patchwork.kernel.org/patch/11483041/
https://patchwork.kernel.org/patch/11483045/


Yoshihiro Shimoda (2):
  arm64: dts: renesas: add PWM device nodes for r8a77961
  arm64: dts: renesas: add PCIe device nodes for r8a77961

 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 114 +++++++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 3 deletions(-)

-- 
2.7.4

