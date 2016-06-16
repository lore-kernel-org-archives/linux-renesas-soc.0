Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:35229 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754196AbcFPWAk (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 18:00:40 -0400
Received: by mail-lf0-f48.google.com with SMTP id l188so46641062lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jun 2016 15:00:40 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Add R8A7792 JPEG codec support
Date: Fri, 17 Jun 2016 01:00:36 +0300
Message-ID: <7346244.CEZI3u99oZ@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160616-v4.7-rc3' tag. We add the device tree support for
the R8A7792 JPEG Processing Unit (JPU).

[1/2] ARM: dts: r8a7792: add JPU clocks
[2/2] ARM: dts: r8a7792: add JPU support

WBR, Sergei
