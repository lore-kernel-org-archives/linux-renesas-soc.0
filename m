Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752478AbeBIQXm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Feb 2018 11:23:42 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [GIT PULL FOR renesas-drivers] vsp1/vga-performance-fix
Date: Fri,  9 Feb 2018 16:23:38 +0000
Message-Id: <1518193418-26969-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please consider including this fix for the VSP1 in renesas-drivers.

--
Regards

Kieran

The following changes since commit d8a5b80568a9cb66810e75b182018e9edb68e8ff:

  Linux 4.15 (2018-01-28 13:20:33 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git vsp1/vga-performance-fix

for you to fetch changes up to e0c81de98739197b6fda7ba65fe4f17c7a03c384:

  v4l: vsp1: Fix header display list status check in continuous mode (2018-02-09 15:57:49 +0000)

----------------------------------------------------------------
Kieran Bingham (1):
      v4l: vsp1: Fix header display list status check in continuous mode

 drivers/media/platform/vsp1/vsp1_dl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
