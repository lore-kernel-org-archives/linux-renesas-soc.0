Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:33495 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753072AbcIBWEq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 18:04:46 -0400
Received: by mail-lf0-f51.google.com with SMTP id b199so92880223lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Sep 2016 15:04:45 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Add R8A7792/Wheat QSPI support
Date: Sat, 03 Sep 2016 01:04:37 +0300
Message-ID: <1648590.FPpmBRoQyh@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160902-v4.8-rc4' tag plus the Wheat board patches posted this
week. We're adding the R8A7792/Wheat QSPI clocks and device nodes. The board
patch depends on the PFC driver QSPI patch in order for the QSPI pins to be
configured...

[1/3] ARM: dts: r8a7792: add QSPI clock
[2/3] ARM: dts: r8a7792: add QSPI support
[3/3] ARM: dts: wheat: add QSPI support

WBR, Sergei
