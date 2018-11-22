Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46635 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729340AbeKWFSM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 00:18:12 -0500
Received: by mail-lj1-f194.google.com with SMTP id v15-v6so8693508ljh.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Nov 2018 10:37:36 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/4] Renesas R8A77980 CPG/MSSR RPC clock support
To: linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Message-ID: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
Date: Thu, 22 Nov 2018 21:37:33 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 4 patches against the 'clk-renesas' branch of Geert Uytterhoeven's
'renesas-drivers.git' repo. We're adding support for the RPC clocks...

[1/4] clk: renesas: rcar-gen3-cpg: factor out cpg_reg_modify()
[2/4] clk: renesas: rcar-gen3-cpg: add RPC clock
[3/4] clk: renesas: rcar-gen3-cpg: add RPCD2 clock
[4/4] clk: renesas: r8a77980-cpg-mssr: add RPC clocks

MBR, Sergei
