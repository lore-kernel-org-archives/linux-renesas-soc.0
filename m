Return-Path: <SRS0=Zu5O=OT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B922C5CFFE
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 18:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CA262082F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 18:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CA262082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728341AbeLJSV7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 10 Dec 2018 13:21:59 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:40756 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728484AbeLJSV6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 13:21:58 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id AJMv1z00c3XaVaC01JMvor; Mon, 10 Dec 2018 19:21:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gWQBn-00021K-Qk; Mon, 10 Dec 2018 19:21:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gWQBn-0005J9-O4; Mon, 10 Dec 2018 19:21:55 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 0/4] serial: sh-sci: Fix fallback to PIO on DMA failure
Date:   Mon, 10 Dec 2018 19:21:50 +0100
Message-Id: <20181210182154.20357-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
Message-ID: <20181210182150.XRLhXMdzOjJkFtnHK2TyMsGCfnrDMbu_ARjG-acT-u0@z>

	Hi Greg, Jiri,

When submitting a DMA request fails, the sh-sci driver is supposed to
fall back to PIO.  However, this never really worked due to various
reasons (sh-sci driver issues and dmaengine framework limitations).

There are three places where DMA submission can fail, and the driver
should fall back to PIO:
  1. sci_dma_rx_complete(),
  2. sci_submit_rx(),
  3. work_fn_tx().

This patch series fixes fallback to PIO in the receive path (cases 1 and
2).
Fallback to PIO in the transmit path (case 3) already seems to work
fine.

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
topic/scif-pio-fallback-v3 branch of my renesas-drivers git repository
at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.

Thanks!

Geert Uytterhoeven (4):
  serial: sh-sci: Fix locking in sci_submit_rx()
  serial: sh-sci: Fix crash in rx_timer_fn() on PIO fallback
  serial: sh-sci: Resume PIO in sci_rx_interrupt() on DMA failure
  serial: sh-sci: Fix fallback to PIO in sci_dma_rx_complete()

 drivers/tty/serial/sh-sci.c | 39 +++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
