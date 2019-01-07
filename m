Return-Path: <SRS0=nqfF=PP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03708C43612
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 16:23:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D33BB2173C
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 16:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729761AbfAGQX0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Jan 2019 11:23:26 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:59592 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730196AbfAGQXZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jan 2019 11:23:25 -0500
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id MUPM1z00S3XaVaC06UPM90; Mon, 07 Jan 2019 17:23:24 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ggXgP-0008Fv-Dd; Mon, 07 Jan 2019 17:23:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ggXgP-00043J-Bv; Mon, 07 Jan 2019 17:23:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 0/4] serial: sh-sci: Fix fallback to PIO on DMA failure
Date:   Mon,  7 Jan 2019 17:23:16 +0100
Message-Id: <20190107162320.15530-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Greg, Jiri,

When submitting a DMA request fails, the sh-sci driver is supposed to
fall back to PIO.  However, this never really worked due to various
reasons (sh-sci driver issues and dmaengine framework limitations).

There are three places where DMA submission can fail, and the driver
should fall back to PIO:
  1. sci_dma_rx_complete(),
  2. sci_submit_rx(),
  3. work_fn_tx().

This patch series fixes fallback to PIO in case 1, which is the only one
that does not work yet in v5.0-rc1.

Changes compared to v4:
  - Drop patches to fix case 2, whch have been applied in v5.0-rc1,
  - Add patches to extract common helpers and make naming more
    consistent,
  - Call new helpers sci_dma_rx_chan_invalidate() and
    sci_dma_rx_reenable_irq() instead of open-coding.

Changes compared to v3:
  - Let sci_submit_rx() return -EAGAIN instead of -1 on failure,
  - Check for negative error in sci_submit_rx() caller.

Changes compared to v2:
  - Add missing definition of "u16 scr" to sci_dma_rx_complete(),
  - Move label handle_pio inside #ifdef to kill defined but not used
    compiler warning when CONFIG_SERIAL_SH_SCI_DMA=n,
  - Move call to dmaengine_terminate_async() in sci_dma_rx_complete()
    inside the spinlock, for symmetry with sci_submit_rx(),
  - Move the call sci_submit_rx() in sci_rx_interrupt() up, as it may
    fail, rendering the modification of scr unused,
  - Split in multiple patches,
  - Drop RFC status.

Changes compared to v1:
  - Fix fallback in sci_dma_rx_complete(),
  - Fallback in the transmit path already works fine,
  - Widen audience, but keep RFC.

This has been tested on r8a7791/koelsch, using SCIF1 on debug serial 1,
and SCIFA3 on EXIO-B, by introducing random failures in DMA submission
code.  For testing, this series is also available in the
topic/scif-pio-fallback-v5 branch of my renesas-drivers git repository
at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.

Thanks!

Geert Uytterhoeven (4):
  serial: sh-sci: Extract sci_dma_rx_chan_invalidate()
  serial: sh-sci: Extract sci_dma_rx_reenable_irq()
  serial: sh-sci: Fix fallback to PIO in sci_dma_rx_complete()
  serial: sh-sci: Make RX/TX DMA function names consistent

 drivers/tty/serial/sh-sci.c | 71 ++++++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 28 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
