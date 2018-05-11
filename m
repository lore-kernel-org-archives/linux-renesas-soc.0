Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:41909 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750746AbeEKUSk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 16:18:40 -0400
Received: by mail-lf0-f42.google.com with SMTP id m17-v6so4480015lfj.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 May 2018 13:18:39 -0700 (PDT)
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Disable EtherAVB by default on R8A779{7|8}0 SoCs
Message-ID: <5844eef7-0f5e-6366-4d3d-a3a658e7f988@cogentembedded.com>
Date: Fri, 11 May 2018 23:18:36 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180511-v4.17-rc4' tag. I'm fixing the issue in the EtherAVB
device nodes in the R8A779{7|8}0 device trees that missed the "status" prop,
usually disabling the SoC devices in anticipation that the board device trees
enable the devices according to their needs. There should be no issues with
the current R8A779{7|8}0 board device trees, as all of them use EtherAVB
anyway, so I'm sending the patches generated against the 'devel' branch...

[1/2] arm64: dts: renesas: r8a77970: disable EtherAVB
[2/2] arm64: dts: renesas: r8a77980: disable EtherAVB

MBR, Sergei
