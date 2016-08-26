Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www1246.sakura.ne.jp ([219.94.162.56]:25086 "EHLO
        www1246.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752354AbcHZA7F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2016 20:59:05 -0400
Message-ID: <57BF944F.8000501@jinso.co.jp>
Date: Fri, 26 Aug 2016 09:58:55 +0900
From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sakato Ryusuke <ryusuke.sakato.bx@renesas.com>,
        kuninori morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Nguyen Viet Dung <nv-dung@jinso.co.jp>
Subject: R-Car Gen2 QSPI driver performance
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert.

I'd like to ask you about R-Car Gen2 QSPI driver performance test of 
single, dual and quad.

------
commit 4f12b5e529e4ff274eb478ec1c2ef41358ed9577
Author: Geert Uytterhoeven <geert+renesas@glider.be>
Date:   Mon Jun 2 15:38:17 2014 +0200

      spi: rspi: Add DMA support for QSPI on R-Car Gen2

      Enable DMA support for QSPI on R-Car Gen2, for Single, Dual, and 
Quad SPI
      Transfers.

      Performance figures for reading from a QSPI FLASH driven at 24.375 
MHz
      on r8a7791/koelsch:
        - Single:  1.1 Mbps PIO, 23 Mbps DMA
        - Dual  : 12.7 Mbps PIO, 48 Mbps DMA
        - Quad  : 13   Mbps PIO, 70 Mbps DMA
------
Could you show me how to test these performances?

I have tried to reproduce them but I only got the results like this:

Enabled DMA:
Linux stable v4.7
      Quad-spi： Read 3.2 MB/s Write 601 kB/s
      Dual-spi： Read 3.1 MB/s Write 847 kB/s
      Single-spi： Read 2.5 MB/s Write 850 kB/s

PIO:
RcarGen2_BSP linux_v3.10.101-ltsi
      Quad-spi： Read 2.2 MB/s Write 1.1 MB/s
      Dual-spi： Read 2.1 MB/s Write 158 kB/s
      Single-spi： Read 173 kB/s Write 159 kB/s

Regards,
Jinso/Hiep.
