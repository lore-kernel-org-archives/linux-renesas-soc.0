Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:35570 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754127AbcHSWRN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Aug 2016 18:17:13 -0400
Received: by mail-lf0-f44.google.com with SMTP id f93so42007670lfi.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Aug 2016 15:17:12 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Add R8A7792 VSP1V support
Date: Sat, 20 Aug 2016 01:17:09 +0300
Message-ID: <1635089.v8k0jcJkvb@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160817-v4.8-rc2' tag. We're adding the R8A7792 VSP1V clocks
and device nodes. The 2nd patch depends on the VSP1 driver patch in order for
the VSP1V core to be recognized by the driver. The patches have been tested on
the Blanche board...

[1/2] ARM: dts: r8a7792: add VSP1V clocks
[2/2] ARM: dts: r8a7792: add VSP1V support

WBR, Sergei
