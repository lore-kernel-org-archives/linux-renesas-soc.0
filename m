Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:36027 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751456AbdI2NJD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 09:09:03 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: wsa@the-dreams.de, linux-serial@vger.kernel.org,
        magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/2] HSCIF tweaks support
Date: Fri, 29 Sep 2017 15:08:52 +0200
Message-Id: <1506690534-27302-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

These patches enable tweaking of the HSCIF RX FIFO timeout and sampling
point via sysfs. I have put them in one series because they have textual
dependencies and implement similar functionality.

"serial: sh-sci: Support for variable HSCIF hardware RX timeout" includes
minor touch-ups suggested in Geert's review of the standalone version.

CU
Uli


Ulrich Hecht (2):
  serial: sh-sci: Support for variable HSCIF hardware RX timeout
  serial: sh-sci: Support for HSCIF RX sampling point adjustment

 drivers/tty/serial/sh-sci.c | 114 +++++++++++++++++++++++++++++++++++++-------
 drivers/tty/serial/sh-sci.h |   7 +++
 2 files changed, 104 insertions(+), 17 deletions(-)

-- 
2.7.4
