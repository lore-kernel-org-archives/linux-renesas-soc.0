Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:49419 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732286AbeGKMeL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 08:34:11 -0400
From: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH 0/2] dt: serial: Add Renesas RZ/N1 binding documentation
Date: Wed, 11 Jul 2018 13:29:32 +0100
Message-Id: <1531312174-17489-1-git-send-email-phil.edworthy@renesas.com>
To: unlisted-recipients:; (no To-header on input)
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Just a new compatible string for the Synopsys UART to allow us to add DMA at
some point in the future.

Phil Edworthy (2):
  dt: serial: Add Renesas RZ/N1 binding documentation
  serial: 8250_dw: Add compatible string for Renesas RZ/N1 UART

 Documentation/devicetree/bindings/serial/renesas,rzn1-uart.txt | 10 ++++++++++
 drivers/tty/serial/8250/8250_dw.c                              |  1 +
 2 files changed, 11 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/renesas,rzn1-uart.txt

-- 
2.7.4
