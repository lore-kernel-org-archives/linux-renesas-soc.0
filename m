Return-Path: <SRS0=mr1P=YL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5D8CA9EAB
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Oct 2019 11:01:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B73032064B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Oct 2019 11:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633625AbfJRLBM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Oct 2019 07:01:12 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:43436 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633620AbfJRLBM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Oct 2019 07:01:12 -0400
Received: from ramsan ([84.194.98.4])
        by andre.telenet-ops.be with bizsmtp
        id Ez142100r05gfCL01z14st; Fri, 18 Oct 2019 13:01:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLQ0G-0005q3-Oc; Fri, 18 Oct 2019 13:01:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLPEt-0006rw-Qt; Fri, 18 Oct 2019 12:12:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL 1/5] Renesas ARM DT updates for v5.5
Date:   Fri, 18 Oct 2019 12:11:32 +0200
Message-Id: <20191018101136.26350-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018101136.26350-1-geert+renesas@glider.be>
References: <20191018101136.26350-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.5-tag1

for you to fetch changes up to 84cd9d3442b755b804618b265d39ab99df829ab2:

  ARM: dts: emev2: Add whitespace for GPIO nodes (2019-10-01 09:51:42 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.5

  - Whitespace cleanups.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      ARM: dts: gose: Replace spaces by TABs
      ARM: dts: lager: Replace spaces by TABs

Magnus Damm (1):
      ARM: dts: emev2: Add whitespace for GPIO nodes

 arch/arm/boot/dts/emev2.dtsi        |   4 ++
 arch/arm/boot/dts/r8a7790-lager.dts |   8 +--
 arch/arm/boot/dts/r8a7793-gose.dts  | 110 ++++++++++++++++++------------------
 3 files changed, 63 insertions(+), 59 deletions(-)
