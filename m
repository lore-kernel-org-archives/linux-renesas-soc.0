Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41777 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbeJORnG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Oct 2018 13:43:06 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 0/2] sh-pfc: r8a77990: Add Audio clock and SSI pins, groups and functions
Date: Mon, 15 Oct 2018 11:58:25 +0200
Message-Id: <20181015095827.25592-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

this series adds support for Audio clock and SSI pins, groups and functions
to the pfc driver for the R-Car E3 (r8a77990) SoC. It is a requirement
for working audio support on that SoC.

This series is based on sh-pfc-for-v4.20-tag3

Takeshi Kihara (2):
  pinctrl: sh-pfc: r8a77990: Add Audio clock pins, groups and functions
  pinctrl: sh-pfc: r8a77990: Add Audio SSI pins, groups and functions

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 443 +++++++++++++++++++++++++++++++++-
 1 file changed, 441 insertions(+), 2 deletions(-)

-- 
2.11.0
