Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:20734 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbeHXIZf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 04:25:35 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        geert+renesas@glider.be
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp,
        na-hoan@jinso.co.jp
Subject: [PATCH 0/2]  Add support fdp1 device for Salvator-XS M3-N
Date: Fri, 24 Aug 2018 13:52:27 +0900
Message-Id: <1535086349-10657-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

These patches add fdp1 device support for M3-N r8a77965 board.
Please review for me, thank you!

Hoan Nguyen An (2):
  arm64: dts: r8a77965: add FDP1 device nodes
  clk: renesas: r8a77965: Add FDP clock

 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 10 ++++++++++
 drivers/clk/renesas/r8a77965-cpg-mssr.c   |  1 +
 2 files changed, 11 insertions(+)

-- 
2.7.4
