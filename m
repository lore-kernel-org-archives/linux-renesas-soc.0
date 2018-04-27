Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:46946 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758062AbeD0TK7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 15:10:59 -0400
Received: by mail-lf0-f51.google.com with SMTP id v85-v6so4113088lfa.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Apr 2018 12:10:58 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A77980/Condor CAN-FD support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Message-ID: <c184f961-2f98-532f-ed02-6f3751256d9c@cogentembedded.com>
Date: Fri, 27 Apr 2018 22:10:55 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180426-v4.17-rc2' tag. We're adding the R8A77980 CAN-FD
device node and then enable single channel CAN-FD support on the Condor board.

[1/2] arm64: dts: renesas: r8a77980: add CAN-FD support
[2/2] arm64: dts: renesas: condor: add CAN-FD support

WBR, Sergei
