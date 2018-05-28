Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35315 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933885AbeE1UKz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 May 2018 16:10:55 -0400
Received: by mail-wm0-f65.google.com with SMTP id o78-v6so34853429wmg.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 May 2018 13:10:55 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3 0/2] Add R8A77980/Condor I2C support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Message-ID: <e9c94553-be9d-0eec-a1ee-1713bb97fbab@cogentembedded.com>
Date: Mon, 28 May 2018 23:10:52 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180528-v4.17-rc7' tag. We're adding the R8A77980 I2C nodes
and then describing 2 PCA9654 I/O expanders connected to the I2C0 bus on
the Condor board.

[1/2] arm64: dts: renesas: r8a77980: add I2C support
[2/2] arm64: dts: renesas: condor: add I2C0 support

WBR, Sergei
