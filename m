Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34579 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751089AbcGQNG2 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 17 Jul 2016 09:06:28 -0400
Received: by mail-lf0-f45.google.com with SMTP id l69so58580045lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2016 06:06:27 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] Fix DMA channel misreporting for the Renesas Ethernet drivers
Date: Sun, 17 Jul 2016 16:06:24 +0300
Message-ID: <8592210.gMERdmUlCp@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's a set of 2 patches against DaveM's 'net.git' repo fixing up the DMA
channel reporting by 'ifconfig'...

[1/2] ravb: fix DMA channel misreporting
[2/2] sh_eth: fix DMA channel misreporting

MBR, Sergei
