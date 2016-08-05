Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:34064 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760529AbcHESYp (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 14:24:45 -0400
Received: by mail-lf0-f47.google.com with SMTP id l69so209169204lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Aug 2016 11:24:44 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Add R8A7792 DU support
Date: Fri, 05 Aug 2016 21:24:40 +0300
Message-ID: <4031442.KeMCTMarLN@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160725-v4.7-rc7' tag. We're adding the R8A7792 DU clocks and
device nodes. They have been tested on the Blanche board -- I'm not posting the
Blanche patch only because it also has some strange interaction with the
Ethernet chip, so that NFS root can't work anymore...

[1/2] ARM: dts: r8a7792: add DU clocks
[2/2] ARM: dts: r8a7792: add DU support

WBR, Sergei
