Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:34943 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750825AbdALHm7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2017 02:42:59 -0500
Received: by mail-lf0-f52.google.com with SMTP id m78so7378692lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jan 2017 23:42:58 -0800 (PST)
To: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Isn't gen3 peripheral bus 32-bit?
Cc: Artemi Ivanov <artemi.ivanov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>
Message-ID: <3453a281-7e5b-aca7-ee56-04da8534ae0d@cogentembedded.com>
Date: Thu, 12 Jan 2017 10:42:54 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi

R-Car GEN3 PCIe modules have 32-bit connect to internal AXI bus.

Could please somebody with lowlevel hardware knowledge answer, if this
is PCIe module limitation, or internal bus limitation.

Depending on that, different modification of renesas/r8a779[56].dtsi
files is needed: either
- wrap only pcie nodes into 32-bit sub-node of /soc, or
- turn entire /soc subtree to 32-bit.


Problem I'm trying to solve is related to DMA ranges handling.
Architecture code needs explicit information on DMA range
limitations caused by interconnect. See [1] thread for details.

Nikita

[1] https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg10449.html
