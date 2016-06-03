Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:35688 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932787AbcFCU42 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 3 Jun 2016 16:56:28 -0400
Received: by mail-lf0-f41.google.com with SMTP id w16so61855731lfd.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jun 2016 13:56:27 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/2] Document Renesas R8A7792 clock support
Date: Fri, 03 Jun 2016 23:56:23 +0300
Message-ID: <2432690.FBaBKRolRm@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 2 patches is against the 'clk-next' branch of CLK group's
'linux.git' repo. They are extracted from the 13 patch series adding support
for Renesas R8A7792/Blanche board support -- looks like I had the patch
addressees wrong that time...

[1/2] clk: renesas: rcar-gen2: document R8A7792 support
[2/2] clk: renesas: mstp: document R8A7792 support

MBR, Sergei
