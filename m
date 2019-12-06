Return-Path: <SRS0=tds5=Z4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3986C2BBE2
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  6 Dec 2019 14:20:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 736A720707
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  6 Dec 2019 14:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575642038;
	bh=0ZFet+ADBLO/jqPTs89Jq4AK4PDw0qGnXxp8HkUJNwE=;
	h=Subject:From:Date:To:List-ID:From;
	b=DxaxNj9R6QO4Te3VTpQlrshAYgbGmoE/XVzs9elv6Bvl0xp01L7OJMFvIckj1xJ/d
	 4YdXr1tIE/kwPwsIJKQtgO6nfyn05Ah5VlpfkW+koamWJstBmJ8SI4uqHXRaUjDaaE
	 v8DZ34Vypkzeq7YTElEW8wuWJEJvjyk3hCFfhXFI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbfLFOUi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 6 Dec 2019 09:20:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:41992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726256AbfLFOUi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 09:20:38 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575642037;
        bh=0ZFet+ADBLO/jqPTs89Jq4AK4PDw0qGnXxp8HkUJNwE=;
        h=Subject:From:Date:To:From;
        b=cYmURJLgDunl+hefuUa78iQUTT9bshUzSN6PvRoFC7mk1jh9AQdbUPbVpeRbg6uq6
         0xR33ytm6sh2murek0cCSXeFpwSP4d0bUC3VGhcDpbV2l5ZcNAdKicj9uDKNnaKvxM
         BRxY4321j5SVDbyFjwbbMniTwayI4Bc9Xn/G3bt4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157564203769.15494.2190730344566789078.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 06 Dec 2019 14:20:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] spi: Add Renesas SPIBSC controller (2019-12-06T13:41:56)
  Superseding: [v1] spi: Add Renesas SPIBSC controller (2019-12-03T03:45:15):
    [1/6] clk: renesas: mstp: Add critical clock from device tree support
    [2/6] ARM: dts: r7s72100: Add SPIBSC clocks
    [3/6] clk: renesas: r7s9210: Add SPIBSC clock
    [4/6] spi: Add SPIBSC driver
    [5/6] ARM: dts: r7s9210: Add SPIBSC Device support
    [6/6] dt-bindings: spi: Document Renesas SPIBSC bindings


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
