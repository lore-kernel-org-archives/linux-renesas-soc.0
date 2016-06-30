Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34203 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752043AbcF3XLO (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 19:11:14 -0400
Received: by mail-lf0-f49.google.com with SMTP id h129so65942120lfh.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jun 2016 16:11:13 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Add R8A7792/Blanche PFC support
Date: Fri, 01 Jul 2016 02:05:15 +0300
Message-ID: <2144803.0K8qXzjIFq@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160630-v4.7-rc5' tag. We're adding the R8A7792 PFC node and
the describe the pins for the SCIFs and SMSC LAN89218 Ethernet chip found on
the Blanche board). These patches depend on the R8A7792 PFC driver patchset
in order to work properly.

[1/3] ARM: dts: r8a7792: add PFC support
[2/3] ARM: dts: blanche: add SCIF pins
[3/3] ARM: dts: blanche: add Ethernet pins

WBR, Sergei
