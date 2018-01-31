Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:38502 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751745AbeAaTyK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jan 2018 14:54:10 -0500
Received: by mail-lf0-f66.google.com with SMTP id g72so22548115lfg.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2018 11:54:09 -0800 (PST)
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add initial support for R-Car V3H (R8A77980)
Message-ID: <fbdd08a3-1ab3-8e70-20f1-d9c41493b11c@cogentembedded.com>
Date: Wed, 31 Jan 2018 22:54:06 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here are 2 patches against the 'renesas-devel-20180130v2-v4.15' tag of Simon Horman's
'renesas.git' repo. They 1st docuement the SoC DT bindings, and then add the SoC Kconfig
symbol.

[1/2] DT: arm: shmobile: document R8A77980 SoC bindings
[2/2] arm64: add Renesas R8A77980 support

MBR, Sergei
