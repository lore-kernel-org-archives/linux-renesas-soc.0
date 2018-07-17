Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:38253 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729720AbeGQUWT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 16:22:19 -0400
Received: by mail-pl0-f65.google.com with SMTP id b1-v6so909126pls.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jul 2018 12:48:11 -0700 (PDT)
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT 0/7] rsnd: add support for r8a77965
Date: Wed, 18 Jul 2018 04:47:56 +0900
Message-Id: <1531856883-19645-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series adds sound support for r8a77965 (R-Car M3-N).
This series is based on the devel branch of Simon Horman's renesas tree.

Hiroyuki Yokoyama (1):
  ASoC: rsnd: Document R-Car M3-N support

Takeshi Kihara (6):
  arm64: dts: renesas: r8a77965: Add Audio-DMAC device nodes
  arm64: dts: renesas: r8a77965: Add Sound device node and SSI support
  arm64: dts: renesas: r8a77965: Add Sound SRC support
  arm64: dts: renesas: r8a77965: Add Sound DVC device nodes
  arm64: dts: renesas: r8a77965: Add Sound CTU support
  arm64: dts: renesas: r8a77965: Add Sound MIX support

 .../devicetree/bindings/sound/renesas,rsnd.txt     |   1 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          | 245 ++++++++++++++++++++-
 2 files changed, 235 insertions(+), 11 deletions(-)

-- 
1.9.1
