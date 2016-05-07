Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:33745 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751018AbcEGVG6 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sat, 7 May 2016 17:06:58 -0400
Received: by mail-lf0-f53.google.com with SMTP id y84so165364835lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 May 2016 14:06:57 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] sh_eth: couple of software reset bit cleanups
Date: Sun, 08 May 2016 00:06:53 +0300
Message-ID: <1808900.MGlUzc8O9C@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's a set of 2 patches against DaveM's 'net-next.git' repo. We can save
on the repetitive chip reset code...

[1/2] sh_eth: call sh_eth_tsu_write() from sh_eth_chip_reset_giga()
[2/2] sh_eth: reuse sh_eth_chip_reset()

MBR, Sergei
