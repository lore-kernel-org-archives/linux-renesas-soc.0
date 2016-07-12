Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:36395 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750787AbcGLVJL (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 12 Jul 2016 17:09:11 -0400
Received: by mail-lf0-f47.google.com with SMTP id q132so23757051lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jul 2016 14:09:10 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Add R8A7792 SDHI support
Date: Wed, 13 Jul 2016 00:09:02 +0300
Message-ID: <2441635.ESeLhIjWEX@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160711-v4.7-rc7' tag plus the R8A7792 PFC/GPIO/EtherAVB
patchsets. We're adding the R8A7792 SDHI clocks and device nodes. They have
been tested on the Blanche board -- I'm not posting the Blanche patch only
because it has some strange interaction with the Ethernet chip, so that NFS
root woedn't work anymore...

[1/2] ARM: dts: r8a7792: add SD clocks
[2/2] ARM: dts: r8a7792: add SDHI support

WBR, Sergei
