Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:50163 "EHLO
	relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751307AbcEILjo convert rfc822-to-8bit
	(ORCPT <rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 07:39:44 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "linux-mm@kvack.org" <linux-mm@kvack.org>
CC: "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: About lazy_max_pages()
Date: Mon, 9 May 2016 11:39:36 +0000
Message-ID: <SG2PR06MB091917A090460AEBEFF339E1D8700@SG2PR06MB0919.apcprd06.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

I have a question about (1) in the following RFC:
http://www.spinics.net/lists/linux-rt-users/msg15082.html

Does Upstream accept such a patch?

< Overview >
My environment (v4.6-rc5 on arm64 / r8a7795) has similar situation
when dma_free_coherent() is called.

< For example (The buffer size is 1024 bytes.) >
 - Sometimes the function spends about 8 msecs (worst-case).
 - If I modified the value such the patch, sometimes the spend time is about 1 msecs (worst-case).

So, I would like to know that upstream accepts such a patch.

< Remarks >
I also tried both the (1) and (2) patches on my environment.
However, kernel stopped on the way.

Best regards,
Yoshihiro Shimoda
