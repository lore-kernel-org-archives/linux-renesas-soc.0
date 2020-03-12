Return-Path: <SRS0=5QEK=45=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28ECFC10DCE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 12 Mar 2020 10:20:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0390520674
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 12 Mar 2020 10:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584008424;
	bh=E7tjm16dF+rmw3V6NcExFFOClVGCU6mPEsIaBsMnlag=;
	h=Subject:From:Date:References:To:List-ID:From;
	b=MwU53zmnv+tOo6py40F2yAIgGLRjvBzTBQYCLqdvdsOO22Y6cqfRsYdAcfmUgB1b7
	 RV+06tPG2JChhKXJhnWdGBbgRLdsX+uNO8r5aC3d5lg3DbBILBArLGZzQX0ldx2d/L
	 TPfJVkHaTIUxjREK3i3PkbZWv9BlGlo3TrWL7V9M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgCLKUX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 12 Mar 2020 06:20:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgCLKUX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 06:20:23 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584008423;
        bh=E7tjm16dF+rmw3V6NcExFFOClVGCU6mPEsIaBsMnlag=;
        h=Subject:From:Date:References:To:From;
        b=zUUShR24aLKhF8DLeGtlFCeLkCs/aFTfrPsjUuoKb0bL7ZIOpJRXavlelPV1zU3WQ
         J2p9BpF7TbFgJRCW8h2bqxEgEKU2vNHlBzyfbWILwuQYO4BpJwVMLgMubL0pFjFT57
         V7mYuyHVo6255i5BsT5SVTkJJ1gsOA+ef5VzrClk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158400842316.3234.11165191457407109900.git-patchwork-summary@kernel.org>
Date:   Thu, 12 Mar 2020 10:20:23 +0000
References: <20200309171200.21226-1-geert+renesas@glider.be>,
 <20200309171112.21086-1-geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: arm64: dts: renesas: r8a77990: Add CPUIdle support for CA53 cores
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=253487

Patch: arm64: dts: renesas: r8a77965: Add CPUIdle support for CA57 cores
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=253483

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
