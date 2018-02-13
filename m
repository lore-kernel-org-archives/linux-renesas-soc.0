Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:38348 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934226AbeBMLSH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 06:18:07 -0500
Received: by mail-lf0-f45.google.com with SMTP id g72so24586247lfg.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2018 03:18:07 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Add R8A77970/Eagle GPIO support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Message-ID: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com>
Date: Tue, 13 Feb 2018 14:18:04 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180213-v4.16-rc1' tag. We're adding the R8A77970 GPIO
nodes and then describing the PHY IRQ for EtherAVB device declared earlier.

[1/2] arm64: dts: renesas: r8a77970: add GPIO support
[2/2] arm64: dts: renesas: eagle: specify EtherAVB PHY IRQ

WBR, Sergei
