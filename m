Return-Path: <SRS0=9Cy4=AY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9D5C433E1
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 13 Jul 2020 09:40:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E535620773
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 13 Jul 2020 09:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594633244;
	bh=UpmshE1Y+Gt6ZSIIlEEt9sZUS9rKqKPuQa6FCZwf5EA=;
	h=Subject:From:Date:To:List-ID:From;
	b=oQBrQLZPfDVCDScpkQAPbAN+7JMgz83qvWIFsLngs2hYYMqce1giwN5ORtYlXnVbf
	 nI8IVkqFT5tXNu5OvaHGCh9wolXXFlP3MFM9ca/OQ0ANaB0nVx+CDefutUnZDUWuy7
	 Dzfd5SmBEG2C1TiSmfxpcUjRFB4iBDgm+rVQpu9c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbgGMJkn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 13 Jul 2020 05:40:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:35450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727035AbgGMJkn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 05:40:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594633243;
        bh=UpmshE1Y+Gt6ZSIIlEEt9sZUS9rKqKPuQa6FCZwf5EA=;
        h=Subject:From:Date:To:From;
        b=beQRX42ufkC7OyVg8gNhZdRPG/4cRxyFeyCDpSJsD5IpawwHI5tdE9GxCXjDwoa4c
         fwKaFJkSdNThVYGNvaYKMc5huEDBNsCurtNtjYFAHCmCd3FgI0+HS0proXX9DExQfT
         JRsFqjiz0znet1ojbSrYRVxwuCoTQFWPRJA2uKUk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159463324328.26254.11034091640096603344.git-patchwork-summary@kernel.org>
Date:   Mon, 13 Jul 2020 09:40:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Series: Add R8A77970 RPC-IF support
  Submitter: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=305843
  Link: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com>
    Patches: [v2,1/2] arm64: dts: renesas: r8a77970: add RPC-IF support
             [v2,2/2] arm64: dts: renesas: r8a77980: eagle/v3msk: add QSPI flash support

Patch: arm64: dts: renesas: cat875: Drop superfluous phy-mode
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=313477
  Link: <20200706151400.23105-1-geert+renesas@glider.be>

Patch: arm64: defconfig: enable CONFIG_PCIE_RCAR_HOST
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=288095
  Link: <1589494238-2933-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>

Patch: arm64: dts: renesas: Restructure Makefile
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=313497
  Link: <20200706154015.29257-1-geert+renesas@glider.be>

Patch: PATCH v2 1/2] arm64: dts: renesas: r8a77980: add RPC-IF support
  Submitter: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=290421
  Link: <f18853d9-8ef9-717a-9039-2191b26e579f@cogentembedded.com>

Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
