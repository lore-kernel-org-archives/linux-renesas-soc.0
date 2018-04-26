Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:39069 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753393AbeDZU0u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 16:26:50 -0400
Received: by mail-lf0-f68.google.com with SMTP id j193-v6so9621247lfg.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Apr 2018 13:26:49 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A77970/Eagle CAN-FD support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Message-ID: <4e5216bc-5f1b-ace4-1aea-02269cd206ac@cogentembedded.com>
Date: Thu, 26 Apr 2018 23:26:46 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180426-v4.17-rc2' tag. We're adding the R8A77970 CAN-FD
device node and then enable single chnanel CAN-FD support on the Eagle board.

[1/2] arm64: dts: renesas: r8a77970: add CAN-FD support
[2/2] arm64: dts: renesas: eagle: add CAN-FD support

WBR, Sergei
