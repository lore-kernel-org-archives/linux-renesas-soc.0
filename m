Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:34451 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965125AbdDTSzp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 14:55:45 -0400
Received: by mail-lf0-f47.google.com with SMTP id t144so33947372lff.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Apr 2017 11:55:44 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170420185132.258111787@cogentembedded.com>
Date: Thu, 20 Apr 2017 21:51:32 +0300
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
To: linux-renesas-soc@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] Add R8A7743/SK-RZG1M PFC support
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20170420-v4.11-rc7' tag.  We're adding the R8A7743 PFC node
and then describing the pins for SCIF0 and Ether devices declared earlier.
These patches depend on the R8A7743 PFC suport in order to work properly.

[1/3] ARM: dts: r8a7743: add PFC support
[2/3] ARM: dts: sk-rzg1m: add SCIF0 pins
[3/3] ARM: dts: sk-rzg1m: add Ether pins

WBR, Sergei
