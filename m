Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:39184 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751814AbeFBThp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Jun 2018 15:37:45 -0400
Received: by mail-lf0-f65.google.com with SMTP id t134-v6so19491360lff.6
        for <linux-renesas-soc@vger.kernel.org>; Sat, 02 Jun 2018 12:37:44 -0700 (PDT)
Subject: [PATCH 1/3] sh_eth: make sh_eth_soft_swap() work on ARM
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
References: <9027499a-0e19-7721-a17f-26e86885da3f@cogentembedded.com>
Message-ID: <c83970ff-337d-6628-6976-e1665c44dd0b@cogentembedded.com>
Date: Sat, 2 Jun 2018 22:37:42 +0300
MIME-Version: 1.0
In-Reply-To: <9027499a-0e19-7721-a17f-26e86885da3f@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Browsing  thru the driver disassembly, I noticed that ARM gcc generated
no  code  whatsoever for sh_eth_soft_swap() while building a little-endian
kernel -- apparently __LITTLE_ENDIAN__ was not being #define'd, however
it got implicitly #define'd when building with the SH gcc (I could only
find the explicit #define __LITTLE_ENDIAN that was #include'd when building
a little-endian kernel).  Luckily, the Ether controller  only doing big-
endian DMA is encountered on the early SH771x SoCs only and all ARM SoCs
implement EDMR.DE and thus set 'sh_eth_cpu_data::hw_swap'. But anyway, we
need to fix the #ifdef inside sh_eth_soft_swap() to something that would
work on all architectures... 

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -562,7 +562,7 @@ struct sh_eth_private {
 
 static inline void sh_eth_soft_swap(char *src, int len)
 {
-#ifdef __LITTLE_ENDIAN__
+#ifdef __LITTLE_ENDIAN
 	u32 *p = (u32 *)src;
 	u32 *maxp;
 	maxp = p + ((len + sizeof(u32) - 1) / sizeof(u32));
