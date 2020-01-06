Return-Path: <SRS0=Tv30=23=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF7FC4741C
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  6 Jan 2020 10:49:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED2082075A
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  6 Jan 2020 10:49:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgAFKtL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 6 Jan 2020 05:49:11 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:57860 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgAFKtL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jan 2020 05:49:11 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id myp52100T5USYZQ06yp5RQ; Mon, 06 Jan 2020 11:49:09 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ioPwX-0001yh-KU; Mon, 06 Jan 2020 11:49:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ioPwX-0002Br-Jc; Mon, 06 Jan 2020 11:49:05 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/5] Renesas ARM defconfig updates for v5.6
Date:   Mon,  6 Jan 2020 11:48:53 +0100
Message-Id: <20200106104857.8361-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106104857.8361-1-geert+renesas@glider.be>
References: <20200106104857.8361-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit fa2cdb1762d15f701b83efa60b04f0d04e71bf89:

  ARM: shmobile: defconfig: Restore debugfs support (2019-12-13 13:56:48 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.6-tag1

for you to fetch changes up to a630a6121bef3e9598482a49eda6b1fa715385d6:

  ARM: shmobile: defconfig: Enable support for panels from EDT (2019-12-13 14:39:05 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.6

  - Enable support for the display panel on the iwg20d board.

----------------------------------------------------------------
Fabrizio Castro (1):
      ARM: shmobile: defconfig: Enable support for panels from EDT

 arch/arm/configs/shmobile_defconfig | 3 +++
 1 file changed, 3 insertions(+)
