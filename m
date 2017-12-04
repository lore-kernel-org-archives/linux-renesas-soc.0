Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:54764 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751950AbdLDOSP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 09:18:15 -0500
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 0/2] net: sh_eth: add support for SH7786 and big-endian
Date: Mon,  4 Dec 2017 15:17:42 +0100
Message-Id: <20171204141744.18599-1-thomas.petazzoni@free-electrons.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

I've recently been working on an SH7786 based platform, which uses the
sh_eth network controller. One peculiarity of my setup is that the CPU
is configured big-endian (even though little-endian is more
traditional in the Linux SuperH world), and the sh_eth driver was not
ready for this.

The first patch simply adds the sh_eth_cpu_data structure that
describes the SH7786 controller.

The second patch fixes the driver for big-endian operation. However,
I'd like this patch to be carefully reviewed by Sergei Shtylyov who
already did some endianness related changes in this driver. Indeed, my
change is based on the assumption that the DMA descriptors are in the
native endianness of the CPU.

Thanks,

Thomas

Thomas Petazzoni (2):
  net: sh_eth: add support for SH7786
  net: sh_eth: make work on big endian systems

 drivers/net/ethernet/renesas/sh_eth.c | 89 ++++++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 34 deletions(-)

-- 
2.13.6
