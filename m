Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:34076 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933366AbcIPN0m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 09:26:42 -0400
Received: by mail-lf0-f46.google.com with SMTP id u14so65844739lfd.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Sep 2016 06:26:42 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC 0/8] Add R8A7743/SK-RZG1M board support
Date: Fri, 16 Sep 2016 16:26:38 +0300
Message-ID: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 8 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160916-v4.8-rc6' tag. I'm adding the device tree support for
the R8A7743-based SK-RZG1M board. The SoC is close to R8A7791 and the board
seems  identical to the R8A7791/Porter board. Only serial console is supported
for now, no DHCP/NFS support yet, it will be done RSN... :-)

[1/8] ARM: shmobile: r8a7743: add clock index macros
[2/8] ARM: shmobile: r8a7743: add power domain index macros
[3/8] soc: renesas: rcar-sysc: add R8A7743 support
[4/8] ARM: shmobile: r8a7743: basic SoC support
[5/8] ARM: dts: r8a7743: initial SoC device tree
[6/8] ARM: dts: r8a7743: add SYS-DMAC support
[7/8] ARM: dts: r8a7743: add [H]SCIF support
[8/8] ARM: dts: sk-rzg1m: initial device tree

WBR, Sergei
