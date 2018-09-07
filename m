Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:13991 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbeIGNFr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Sep 2018 09:05:47 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        horms+renesas@verge.net.au, geert+renesas@glider.be
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        magnus.damm@gmail.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp,
        cv-dong@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH 0/4] Enable Audio support for the Draak D3 board on r8a77995.
Date: Fri,  7 Sep 2018 17:25:39 +0900
Message-Id: <1536308743-29573-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

These patches enable Audio support for the Draak D3 board on the r8a77995 SoC.
Since Sound has a clock source for ADG from ZA2, add ZA2 clock.

Thanks you for reading!

Hoan Nguyen An (4):
  arm64: dts: r8a77995: Add Audio DMAC node
  arm64: dts: r8a77995: Add Audio device nodes
  arm64: dts: r8a77995-draak: Enable Audio
  clk: renesas: r8a77995: Add ZA2 clock

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 123 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi      | 217 +++++++++++++++++++++++++
 drivers/clk/renesas/r8a77995-cpg-mssr.c        |   1 +
 3 files changed, 341 insertions(+)

-- 
2.7.4
