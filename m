Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:17131 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727293AbeH2N3j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 09:29:39 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        geert+renesas@glider.be
Cc: yoshihiro.shimoda.uh@renesas.com, magnus.damm@gmail.com,
        kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, cv-dong@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH] Add PWM-2 channel support for Salvator-X
Date: Wed, 29 Aug 2018 18:33:26 +0900
Message-Id: <1535535207-2800-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Since the Salvator-X boards have 2 PWM channels, this patch adds the PWM-2 channel, I tested by measuring the output signal at CN28-pin30.

Hoan Nguyen An (1):
  arm64: dts: salvator-common: Add PWM-2 channel

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.7.4
