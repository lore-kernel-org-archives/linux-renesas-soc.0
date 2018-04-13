Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:41938 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751160AbeDMRA7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 13:00:59 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: wsa@the-dreams.de, geert@linux-m68k.org,
        linux-serial@vger.kernel.org, magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/2] serial: sh-sci: Use pm_runtime_get_sync()/put()
Date: Fri, 13 Apr 2018 19:00:52 +0200
Message-Id: <1523638854-21804-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

These patches make sure that the device is up while the suspend/resume code
is executed. Up-port from the BSP, tested not to break stuff.

CU
Uli


Hien Dang (2):
  serial: sh-sci: Use pm_runtime_get_sync()/put() on suspend
  serial: sh-sci: Use pm_runtime_get_sync()/put() on resume

 drivers/tty/serial/sh-sci.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.7.4
