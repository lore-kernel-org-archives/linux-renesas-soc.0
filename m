Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:44189 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751780AbdBOKvZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2017 05:51:25 -0500
From: DongCV <cv-dong@jinso.co.jp>
To: broonie@kernel.org, geert+renesas@glider.be,
        linux-spi@vger.kernel.org
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        ryusuke.sakato.bx@renesas.com, linux-renesas-soc@vger.kernel.org,
        nv-dung@jinso.co.jp, h-inayoshi@jinso.co.jp, cm-hiep@jinso.co.jp
Subject: [PATCH 0/2 v4] spi: rspi: Fixes bogus received byte and replaces "n" by "len"
Date: Wed, 15 Feb 2017 19:50:50 +0900
Message-Id: <1487155852-12102-1-git-send-email-cv-dong@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Mark,
Cc: Geert, Sergei

Thanks for your comments and advices.

I separated my patch into two patches as you've shown me.
These patches fix: 3be09bec42a800d4 "spi: rspi: supports 32bytes 
buffer for DUAL and QUAD". One of them is to fix bogus received byte 
into qspi_transfer_in(), and other is to replace "n" by "len" bytes of 
data in qspi_transfer_in()and qspi_transfer_out().
These patches were tested at v4.10-rc8 on Renesas Gen2 Lager board.

Please consider these patches to Renesas Rcar family.
Thank you.
Jinso/Dong.

DongCV (2):
  spi: rspi: Fixes bogus received byte in qspi_transfer_in()
  spi: rspi: Replaces "n" by "len" in qspi_transfer_in() and
    qspi_transfer_out()

 drivers/spi/spi-rspi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
1.9.1
