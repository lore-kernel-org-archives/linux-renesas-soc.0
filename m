Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:38776 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965402AbcKLQLd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Nov 2016 11:11:33 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 0/2] pinctrl: sh-pfc: r8a7796: Add drive strength and bias support
Date: Sat, 12 Nov 2016 17:10:00 +0100
Message-Id: <20161112161002.13070-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

These patches add drive strength and bias support for both GPIO and none
GPIO pins to r8a7796. Similar to the none GPIO pins for r8a7795 the
system to derive unique pin numbers are the R-Car M3SiP pin layout.

Tested on M3-W and the series depends on the series '[PATCHv3 0/6]
pinctrl: sh-pfc: Fixups for bias handling and preparation for none GPIO
pins'.

Changes since v1
- Update use of bias information helper function to match changes to the series 
  which this patch depend on.

Niklas Söderlund (2):
  pinctrl: sh-pfc: r8a7796: Add drive strength support
  pinctrl: sh-pfc: r8a7796: Add bias pinconf support

 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 638 ++++++++++++++++++++++++++++++++++-
 1 file changed, 626 insertions(+), 12 deletions(-)

-- 
2.10.2
