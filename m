Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f171.google.com ([209.85.208.171]:35083 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbeH0Wgo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 18:36:44 -0400
Received: by mail-lj1-f171.google.com with SMTP id p10-v6so4792ljg.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Aug 2018 11:48:56 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Add R8A77980/Condor PCIe support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Message-ID: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
Date: Mon, 27 Aug 2018 21:48:53 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180827-v4.19-rc1' tag. We're adding the R8A77980 PCIe
related device nodes and then enable PCIe on the Condor board.

[1/2] arm64: dts: renesas: r8a77980: add PCIe support
[2/2] arm64: dts: renesas: condor: add PCIe support

WBR, Sergei
