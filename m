Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:33298 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753515AbcGDUvP (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 4 Jul 2016 16:51:15 -0400
Received: by mail-lf0-f53.google.com with SMTP id f6so123113899lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jul 2016 13:51:14 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] Add R8A7792/Blanche PFC support
Date: Mon, 04 Jul 2016 23:51:11 +0300
Message-ID: <2793535.9X0Tq7I1Mq@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160704-v4.7-rc6' tag. We're adding the R8A7792 PFC node and
then describe the pins for the SCIFs and SMSC LAN89218 Ethernet chip found on
the Blanche board. These patches depend on the R8A7792 PFC driver patchset
in order to work properly.

[1/3] ARM: dts: r8a7792: add PFC support
[2/3] ARM: dts: blanche: add SCIF pins
[3/3] ARM: dts: blanche: add Ethernet pins

WBR, Sergei
