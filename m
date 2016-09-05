Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:36454 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754360AbcIEUyG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Sep 2016 16:54:06 -0400
Received: by mail-lf0-f51.google.com with SMTP id g62so133254919lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Sep 2016 13:54:05 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Add R8A7792 MSIOF support
Date: Mon, 05 Sep 2016 23:54:02 +0300
Message-ID: <2481458.x1iQg26kO7@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160905-v4.8-rc5' tag. We're adding the R8A7792 MSIOF clocks
and device nodes. I'm not posting the board patches because the MSIOF driver
seems erratic ATM...

[1/2] ARM: dts: r8a7792: add MSIOF clock
[2/2] ARM: dts: r8a7792: add MSIOF support

WBR, Sergei
