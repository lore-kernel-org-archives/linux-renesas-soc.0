Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:36563 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751042AbcHZUWj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2016 16:22:39 -0400
Received: by mail-lf0-f54.google.com with SMTP id g62so64171113lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2016 13:22:38 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Add R8A7792/Wheat board support
Date: Fri, 26 Aug 2016 23:16:49 +0300
Message-ID: <3665116.9BjHTnhfR3@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160826-v4.8-rc3' tag. We add the device tree support for
the R8A7792-based Wheat board. I have only sparse board documentation
at this point, according to which this board somewhat differs from the other
R-Car evaluation boards in that it has debug serial port, debug Ethernet chip,
and a NOR flash on the separate debug board (connected to the main board
with a ribbon cable). I'm not sure how to approach this (DT overlay, perhaps?),
for now I'm just posting the debug UART/Ethernet support the same way it was
done for the Blanche board -- these components seem to be the same between 
these 2 boards...

[1/3] DT: arm: shmobile: document Wheat board
[2/3] ARM: dts: wheat: initial device tree
[3/3] ARM: dts: wheat: add Ethernet support

WBR, Sergei
